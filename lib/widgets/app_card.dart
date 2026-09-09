/*
 * FLauncher
 * Copyright (C) 2021  Étienne Fesser
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */

import 'package:flauncher/l10n/app_localizations.dart';
import 'dart:async';

import 'package:flauncher/actions.dart';
import 'package:flauncher/app_image_type.dart';
import 'package:flauncher/providers/apps_service.dart';
import 'package:flauncher/providers/settings_service.dart';
import 'package:flauncher/widgets/application_info_panel.dart';
import 'package:flauncher/widgets/focus_keyboard_listener.dart';
import 'package:flauncher/widgets/app_card_keys.dart';
import 'package:flauncher/providers/launcher_state.dart';
import 'package:flauncher/providers/notifications_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../models/app.dart';
import '../models/category.dart';

class AppCard extends StatefulWidget
{
  final App application;
  final Category category;
  final bool autofocus;
  final void Function(AxisDirection) onMove;
  final VoidCallback onMoveEnd;
  final VoidCallback? onMoveCancel;
  final int index;
  final bool handleUpNavigationToSettings;
  final bool isFirstInRow;
  final bool isLastInRow;

  /// 卡片宽高比（默认 16:9）。首页瀑布流的大卡片位可以用更宽的比例。
  final double aspectRatio;

  /// 按下遥控器下键时的回调。首页常用应用行用它切到「全部应用」页。
  final VoidCallback? onArrowDown;

  const AppCard({
    super.key,
    required this.application,
    required this.category,
    required this.autofocus,
    required this.onMove,
    required this.onMoveEnd,
    this.onMoveCancel,
    this.index = 0,
    this.handleUpNavigationToSettings = false,
    this.isFirstInRow = false,
    this.isLastInRow = false,
    this.aspectRatio = 16 / 9,
    this.onArrowDown,
  });

  @override
  State<AppCard> createState() => _AppCardState();
}

class _AppCardState extends State<AppCard> with TickerProviderStateMixin {
  bool _moving = false;
  bool _clicked = false;
  late FocusNode _focusNode;

  late Future<(AppImageType, ImageProvider)> _appImageLoadFuture;
  late final AnimationController _animation = AnimationController(
    vsync: this,
    duration: const Duration(
      milliseconds: 1200,
    ),
  );
  
  double _bumpDirection = 0;
  late final AnimationController _bumpController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 200),
  );
  late final Animation<double> _bumpAnimation = TweenSequence<double>([
    TweenSequenceItem(tween: Tween(begin: 0.0, end: 8.0).chain(CurveTween(curve: Curves.easeOut)), weight: 1),
    TweenSequenceItem(tween: Tween(begin: 8.0, end: 0.0).chain(CurveTween(curve: Curves.easeIn)), weight: 1),
  ]).animate(_bumpController);

  AppsService? _appsService;

  /// 卡片下方是否单独显示应用名（用于决定卡片内是否画底部名称条）
  bool _showAppNamesBelowIcons = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();

    _appsService = Provider.of<AppsService>(context, listen: false);
    _appsService!.addListener(_onAppsServiceChanged);

    FocusManager.instance.addHighlightModeListener(_focusHighlightModeChanged);
    _appImageLoadFuture = _loadAppBannerOrIcon(_appsService!);

    // Check if we need to restore focus/reorder mode after a move
    WidgetsBinding.instance.addPostFrameCallback((_) {
       if (!mounted) return;
       final appsService = Provider.of<AppsService>(context, listen: false);
       if (appsService.pendingReorderFocusPackage == widget.application.packageName &&
           appsService.pendingReorderFocusCategoryId == widget.category.id) {
          appsService.clearPendingReorderFocusPackage();
          if (!_focusNode.hasFocus) {
            _focusNode.requestFocus();
          }
          
          if (!_moving) {
            setState(() {
              _moving = true;
            });
          }
       }
    });
  }

  @override
  void didUpdateWidget(AppCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    
    // Check for pending focus on update as well
    WidgetsBinding.instance.addPostFrameCallback((_) {
       if (!mounted) return;
       final appsService = Provider.of<AppsService>(context, listen: false);
       if (appsService.pendingReorderFocusPackage == widget.application.packageName &&
           appsService.pendingReorderFocusCategoryId == widget.category.id) {
          appsService.clearPendingReorderFocusPackage();
          if (!_focusNode.hasFocus) {
            _focusNode.requestFocus();
          }
          
          if (!_moving) {
            setState(() {
              _moving = true;
            });
          }
       }
    });
  }

  @override
  void dispose() {
    if (_appsService != null) {
      _appsService!.removeListener(_onAppsServiceChanged);
    }
    FocusManager.instance.removeHighlightModeListener(_focusHighlightModeChanged);
    _animation.dispose();
    _bumpController.dispose();
    _focusNode.dispose();

    super.dispose();
  }

  void _onAppsServiceChanged() {
    // Reload the app image when the AppsService notifies of changes
    // (e.g., after setting a custom banner)
    setState(() {
      _appImageLoadFuture = _loadAppBannerOrIcon(_appsService!);
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool showAppNames = context.select<SettingsService, bool>((s) => s.showAppNamesBelowIcons);
    _showAppNamesBelowIcons = showAppNames;
    final String themes = context.select<SettingsService, String>((s) => s.themes);
    final bool hideHighlightOutlineOnHomescreen = context.select<SettingsService, bool>((s) => s.hideHighlightOutlineOnHomescreen);
    final bool appSelectorTransitionAnimationEnabled = context.select<SettingsService, bool>((s) => s.appSelectorTransitionAnimationEnabled);

    BorderRadius borderRadius;
    BorderRadius innerBorderRadius;

    switch (themes) {
      case 'premium':
        borderRadius = BorderRadius.circular(16);
        innerBorderRadius = BorderRadius.circular(14);
        break;
      case 'classic':
        borderRadius = BorderRadius.zero;
        innerBorderRadius = BorderRadius.zero;
        break;
      case 'capsule':
        borderRadius = BorderRadius.circular(100);
        innerBorderRadius = BorderRadius.circular(98);
        break;
      case 'modern':
      default:
        // 瀑布流风格：更圆润的卡片，接近当贝/艾蒙顿桌面的观感
        borderRadius = BorderRadius.circular(14);
        innerBorderRadius = BorderRadius.circular(12);
        break;
    }

    return FocusKeyboardListener(
      onPressed: (key) => _onPressed(context, key),
      onLongPress: (key) => _onLongPress(context, key),
      builder: (context) {
        final bool shouldHighlight = _shouldHighlight(context);

        return AnimatedBuilder(
          animation: _bumpAnimation,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(_bumpAnimation.value * _bumpDirection, 0),
              child: child,
            );
          },
          child: AnimatedScale(
          scale: _clicked ? 0.9 : 1.0,
          duration: const Duration(milliseconds: 150),
          curve: Curves.easeOutCubic,
          child: AnimatedOpacity(
            opacity: _clicked ? 0.5 : 1.0,
            duration: const Duration(milliseconds: 150),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: AspectRatio(
                    aspectRatio: widget.aspectRatio,
                    child: RepaintBoundary(
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          return AnimatedContainer(
                            duration: appSelectorTransitionAnimationEnabled ? const Duration(milliseconds: 200) : Duration.zero,
                            curve: Curves.easeOutBack,
                            transformAlignment: Alignment.center,
                            transform: _scaleTransform(context, themes, constraints.maxWidth),
                            child: Material(
                          borderRadius: borderRadius,
                          clipBehavior: Clip.antiAlias,
                          elevation: shouldHighlight ? (themes == 'premium' ? 32 : (themes == 'classic' ? 8 : 16)) : 0,
                          shadowColor: shouldHighlight ? Theme.of(context).primaryColor.withOpacity(0.6) : Colors.black,
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Selector<NotificationsService, int>(
                                selector: (_, service) => service.getNotificationCount(widget.application.packageName),
                                builder: (context, count, _) {
                                  if (count <= 0) return const SizedBox.shrink();
                                  return Positioned(
                                    top: 8,
                                    right: 8,
                                    child: IgnorePointer(
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius: BorderRadius.circular(10),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Colors.black45,
                                              blurRadius: 4,
                                              offset: Offset(0, 2),
                                            ),
                                          ],
                                        ),
                                        constraints: const BoxConstraints(
                                          minWidth: 20,
                                          minHeight: 20,
                                        ),
                                        child: Center(
                                          child: Text(
                                            '$count',
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              height: 1.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                              Actions(
                                actions: <Type, Action<Intent>>{
                                  ActivateIntent: CallbackAction<ActivateIntent>(
                                    onInvoke: (_) => _onPressed(context, LogicalKeyboardKey.enter),
                                  ),
                                  ButtonActivateIntent: CallbackAction<ButtonActivateIntent>(
                                    onInvoke: (_) => _onPressed(context, LogicalKeyboardKey.enter),
                                  ),
                                },
                                child: InkWell(
                                  focusNode: _focusNode,
                                  autofocus: widget.autofocus,
                                  focusColor: Colors.transparent,
                                  child: _appImage(),
                                  onTap: () => _onPressed(context, LogicalKeyboardKey.enter),
                                  onLongPress: () => _onLongPress(context, LogicalKeyboardKey.enter),
                                  onFocusChange: (focused) {
                                    Scrollable.ensureVisible(
                                      context,
                                      // This specific alignment value is not only
                                      // to center the focused card in the row while
                                      // scrolling, but to prevent the topmost category
                                      // title to be hidden by the content above it when
                                      // scrolling from the app bar. How it relates to this,
                                      // I don't know
                                      alignment: 0.5,
                                      curve: Curves.easeInOut,
                                      duration: Duration(milliseconds: 100)
                                    );
                                  },
                                ),
                              ),
                              if (_moving) ..._arrows(),
                              IgnorePointer(
                                child: AnimatedOpacity(
                                  duration: appSelectorTransitionAnimationEnabled ? const Duration(milliseconds: 200) : Duration.zero,
                                  curve: Curves.easeInOut,
                                  opacity: shouldHighlight ? 0 : 0.10,
                                  child: Container(color: Colors.black),
                                ),
                              ),
                              Selector<SettingsService, (bool, String)>(
                                selector: (_, settingsService) => (settingsService.appHighlightAnimationEnabled, settingsService.accentColorHex),
                                builder: (context, settings, _) {
                                  final (animationEnabled, accentColorHex) = settings;
                                  final accentColor = Color(int.parse('FF$accentColorHex', radix: 16));

                                  if (shouldHighlight && !hideHighlightOutlineOnHomescreen) {
                                    if (themes == 'premium') {
                                      _animation.stop();
                                      return const SizedBox();
                                    }
                                    if (themes == 'classic') {
                                      _animation.stop();
                                      return IgnorePointer(
                                        child: Stack(
                                          fit: StackFit.expand,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius: borderRadius,
                                                border: Border.all(
                                                  color: accentColor,
                                                  width: 4
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }
                                    if (animationEnabled) {
                                      _animation.repeat(reverse: true);
                                      return AnimatedBuilder(
                                        animation: CurvedAnimation(parent: _animation, curve: Curves.easeInOut),
                                        builder: (context, child) {
                                          final opacity = 0.4 + (_animation.value * 0.6);

                                          return IgnorePointer(
                                            child: Stack(
                                              fit: StackFit.expand,
                                              children: [
                                                // Outer outline (Accent Color)
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius: borderRadius,
                                                    border: Border.all(
                                                      color: accentColor.withOpacity(opacity),
                                                      width: 2
                                                    ),
                                                  ),
                                                ),
                                                // Inner outline (Black)
                                                Padding(
                                                  padding: const EdgeInsets.all(2),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius: innerBorderRadius,
                                                      border: Border.all(
                                                        color: Colors.black.withOpacity(opacity),
                                                        width: 2
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    } else {
                                      _animation.stop();
                                      return IgnorePointer(
                                        child: Stack(
                                          fit: StackFit.expand,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius: borderRadius,
                                                border: Border.all(
                                                  color: accentColor,
                                                  width: 2
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(2),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius: innerBorderRadius,
                                                  border: Border.all(
                                                    color: Colors.black,
                                                    width: 2
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }
                                  }

                                  _animation.stop();
                                  return const SizedBox();
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            if (showAppNames)
                  Padding(
                    padding: const EdgeInsets.only(top: 6.0),
                    // 艾蒙顿 view_app_item：卡片下方应用名 36px ≈ 18sp
                    child: Text(
                      widget.application.name,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 16),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                    ),
                  ),
              ],
            ),
          ),
          ),
        );
      },
    );
  }

  Future<(AppImageType, ImageProvider)> _loadAppBannerOrIcon(AppsService service) async {
    Uint8List bytes = Uint8List(0);

    bytes = await service.getAppBanner(widget.application.packageName);
    AppImageType type = AppImageType.Banner;

    if (bytes.isEmpty) {
      type = AppImageType.Icon;
      bytes = await service.getAppIcon(widget.application.packageName);
    }

    return (type, MemoryImage(bytes));
  }

  Widget _appImage()
  {
    App app = widget.application;

    return FutureBuilder(
      future: _appImageLoadFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final record = snapshot.data;
          if (record == null) return const SizedBox();

          if (record.$1 == AppImageType.Banner) {
            return Ink.image(
              image: record.$2,
              fit: BoxFit.cover,
              onImageError: (e, s) => debugPrint('AppCard banner image error: $e'),
            );
          }
          else {
            // 瀑布流卡片：图标居中 + 底部渐变名称条（当贝桌面风格）
            return Ink(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white.withOpacity(0.10),
                    Colors.white.withOpacity(0.03),
                  ],
                ),
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Center(
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        // 图标占卡片高度的 42%，宽度自适应
                        final double iconSize = (constraints.maxHeight * 0.42).clamp(16.0, 96.0);
                        return SizedBox(
                          width: iconSize,
                          height: iconSize,
                          child: Ink.image(
                            image: record.$2,
                            fit: BoxFit.contain,
                            onImageError: (e, s) => debugPrint('AppCard icon image error: $e'),
                          ),
                        );
                      },
                    ),
                  ),
                  if (!_showAppNamesBelowIcons)
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(10, 22, 10, 8),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.black.withOpacity(0.75),
                              Colors.black.withOpacity(0.35),
                              Colors.transparent,
                            ],
                            stops: const [0.0, 0.55, 1.0],
                          ),
                        ),
                        child: Text(
                          app.name,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                ],
              ),
            );
          }
        }
        else if (snapshot.hasError) {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: Center(
              child: Text(
                app.name,
                style: Theme.of(context).textTheme.bodySmall,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              )
            ),
          );
        }
        else {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(),
                  const SizedBox(height: 0, width: 16),
                  Text(AppLocalizations.of(context)!.loading)
                ],
              ),
            ),
          );
        }
      }
    );
  }

  void _focusHighlightModeChanged(FocusHighlightMode mode)
  {
    setState(() { });
  }

  bool _shouldHighlight(BuildContext context)
  {
    return FocusManager.instance.highlightMode == FocusHighlightMode.traditional && Focus.of(context).hasFocus;
  }

  Matrix4 _scaleTransform(BuildContext context, String theme, double maxWidth) {
    double scale = 1.0;
    if (!_moving && _shouldHighlight(context)) {
      if (theme == 'premium') {
        scale = 1.15;
      } else if (theme == 'classic') {
        scale = 1.0;
      } else {
        scale = 1.1;
      }

      if (maxWidth > 0) {
        // Gap between cards is at least 16px.
        // Limit horizontal expansion to 14px per side to prevent cropping with the next card.
        double maxScale = 1.0 + (28.0 / maxWidth);
        if (scale > maxScale) {
          scale = maxScale;
        }
      }
    }
    return Matrix4.diagonal3Values(scale, scale, 1.0);
  }

  List<Widget> _arrows() {
    final arrows = <Widget>[
      _arrow(Alignment.centerLeft, Icons.keyboard_arrow_left, () {
        widget.onMove(AxisDirection.left);
      }),
      _arrow(Alignment.centerRight, Icons.keyboard_arrow_right, () {
        widget.onMove(AxisDirection.right);
      }),
    ];
    
    // Only show Up/Down arrows for grid layouts
    if (widget.category.type == CategoryType.grid) {
      arrows.add(_arrow(Alignment.topCenter, Icons.keyboard_arrow_up, () {
        widget.onMove(AxisDirection.up);
      }));
      arrows.add(_arrow(Alignment.bottomCenter, Icons.keyboard_arrow_down, () {
        widget.onMove(AxisDirection.down);
      }));
    }

    return arrows;
  }

  Widget _arrow(Alignment alignment, IconData icon, VoidCallback onTap) =>
      ExcludeFocus(
        child: Align(
          alignment: alignment,
          child: Ink(
            decoration: ShapeDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.8),
              shape: CircleBorder()
            ),
            child: SizedBox(
              height: 36,
              width: 36,
              child: IconButton(
                icon: Icon(icon, size: 24),
                onPressed: onTap,
                padding: EdgeInsets.all(0)
              )
            )
          )
        ),
      );

  DateTime? _lastMoveTime;

  KeyEventResult _onPressed(BuildContext context, LogicalKeyboardKey? key) {
    if (!_moving) {
      if (key == LogicalKeyboardKey.arrowLeft && widget.isFirstInRow) {
        _bumpDirection = -1.0;
        if (!_bumpController.isAnimating) {
          _bumpController.forward(from: 0.0);
        }
        return KeyEventResult.handled;
      } else if (key == LogicalKeyboardKey.arrowRight && widget.isLastInRow) {
        _bumpDirection = 1.0;
        if (!_bumpController.isAnimating) {
          _bumpController.forward(from: 0.0);
        }
        return KeyEventResult.handled;
      } else if (key == LogicalKeyboardKey.arrowDown && widget.onArrowDown != null) {
        widget.onArrowDown!();
        return KeyEventResult.handled;
      }
    }

    if (_moving) {
      if (AppCardKeys.isArrowKey(key)) {
        final now = DateTime.now();
        if (_lastMoveTime != null && now.difference(_lastMoveTime!) < const Duration(milliseconds: 50)) {
          return KeyEventResult.handled;
        }
        _lastMoveTime = now;
      }

      WidgetsBinding.instance.addPostFrameCallback((_) => Scrollable.ensureVisible(context,
          alignment: 0.1, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
      if (key == LogicalKeyboardKey.arrowLeft) {
        widget.onMove(AxisDirection.left);
      } else if (key == LogicalKeyboardKey.arrowUp) {
        widget.onMove(AxisDirection.up);
      } else if (key == LogicalKeyboardKey.arrowRight) {
        widget.onMove(AxisDirection.right);
      } else if (key == LogicalKeyboardKey.arrowDown) {
        widget.onMove(AxisDirection.down);
      } else if (AppCardKeys.validationKeys.contains(key)) {
        setState(() => _moving = false);
        widget.onMoveEnd();
      } else if (AppCardKeys.cancelKeys.contains(key)) {
        setState(() => _moving = false);
        widget.onMoveCancel?.call();
        context.read<LauncherState>().suppressBackNavigation();
      } else {
        return KeyEventResult.ignored;
      }

      return KeyEventResult.handled;
    } else if (key == null || AppCardKeys.validationKeys.contains(key)) {
      if (!_clicked) {
        setState(() => _clicked = true);
        Future.delayed(const Duration(milliseconds: 150), () {
          if (!mounted) return;
          context.read<AppsService>().launchApp(widget.application);
          // Reset after a short delay so it looks normal when user returns
          Future.delayed(const Duration(milliseconds: 500), () {
            if (mounted) {
              setState(() => _clicked = false);
            }
          });
        });
      }
      return KeyEventResult.handled;
    } else if (key == LogicalKeyboardKey.arrowUp && widget.handleUpNavigationToSettings) {
      Actions.invoke(context, const MoveFocusToSettingsIntent());
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  KeyEventResult _onLongPress(BuildContext context, LogicalKeyboardKey? key) {
    if (!_moving && (key == null || AppCardKeys.longPressableKeys.contains(key))) {
      _showPanel(context);
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  Future<void> _showPanel(BuildContext context) async {
    try {
      final result = await showDialog<ApplicationInfoPanelResult>(
        context: context,
        builder: (context) => ApplicationInfoPanel(
          category: widget.category,
          application: widget.application,
        ),
      );
      if (result == ApplicationInfoPanelResult.reorderApp) {
        setState(() => _moving = true);
      }
    } catch (e, stackTrace) {
      print('Error showing panel: $e');
      print('Stack trace: $stackTrace');
    }
  }
}
