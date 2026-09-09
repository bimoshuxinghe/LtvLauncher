import 'dart:async';

import 'package:flauncher/l10n/app_localizations.dart';
import 'package:flauncher/models/app.dart';
import 'package:flauncher/providers/apps_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

/// 艾蒙顿桌面风格的首页大卡片位。
///
/// 对应艾蒙顿 `CardViewPager` + `view_home_page_card`：卡片约 592×333（16:9），
/// 左侧大号标题、右侧 200×200 图标、底部一行小图标 + 文案，并自动轮播。
///
/// 这里按屏幕宽度等比缩放（大卡约占屏宽 31%，与艾蒙顿 592/1920 一致），
/// 以适配不同分辨率的设备。
class FeaturedCarousel extends StatefulWidget {
  /// 已按「最近使用」排好序的应用列表
  final List<App> apps;

  /// 是否让第一张卡片自动获得焦点
  final bool autofocus;

  const FeaturedCarousel({
    super.key,
    required this.apps,
    this.autofocus = false,
  });

  @override
  State<FeaturedCarousel> createState() => _FeaturedCarouselState();
}

class _FeaturedCarouselState extends State<FeaturedCarousel> {
  static const Duration _autoPlayInterval = Duration(seconds: 6);

  late PageController _pageController;
  Timer? _autoPlayTimer;
  int _currentPage = 0;
  bool _focused = false;

  /// 大卡占可用宽度的比例（艾蒙顿 592 / 1920 ≈ 0.31）
  static const double _cardWidthRatio = 0.32;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: _cardWidthRatio);
    _startAutoPlay();
  }

  @override
  void didUpdateWidget(covariant FeaturedCarousel oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.apps.length != widget.apps.length &&
        _currentPage >= widget.apps.length) {
      _currentPage = 0;
      if (_pageController.hasClients) {
        _pageController.jumpToPage(0);
      }
    }
  }

  @override
  void dispose() {
    _autoPlayTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoPlay() {
    _autoPlayTimer?.cancel();
    if (widget.apps.length < 2) return;
    _autoPlayTimer = Timer.periodic(_autoPlayInterval, (_) {
      // 用户正在操作卡片时不自动切换
      if (_focused || !mounted) return;
      _goToPage(_currentPage + 1);
    });
  }

  void _goToPage(int page) {
    if (widget.apps.isEmpty) return;
    final int target;
    if (page < 0) {
      target = widget.apps.length - 1;
    } else if (page >= widget.apps.length) {
      target = 0;
    } else {
      target = page;
    }

    if (!_pageController.hasClients) {
      setState(() => _currentPage = target);
      return;
    }

    _pageController.animateToPage(
      target,
      duration: const Duration(milliseconds: 450),
      curve: Curves.easeInOutCubic,
    );
  }

  void _onFocusChanged(bool focused) {
    setState(() => _focused = focused);
    if (!focused) {
      _startAutoPlay();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.apps.isEmpty) {
      return const SizedBox.shrink();
    }

    final bool single = widget.apps.length == 1;

    return LayoutBuilder(
      builder: (context, constraints) {
        final double cardWidth = constraints.maxWidth * _cardWidthRatio;
        final double cardHeight = cardWidth * 9 / 16;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: cardHeight,
              child: PageView.builder(
                controller: _pageController,
                clipBehavior: Clip.none,
                padEnds: false,
                itemCount: widget.apps.length,
                onPageChanged: (index) {
                  if (mounted) {
                    setState(() => _currentPage = index);
                  }
                },
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: _FeaturedCard(
                    app: widget.apps[index],
                    autofocus: widget.autofocus && index == 0,
                    onFocusChanged: _onFocusChanged,
                    onArrowLeft: () => _goToPage(_currentPage - 1),
                    onArrowRight: () => _goToPage(_currentPage + 1),
                  ),
                ),
              ),
            ),
            if (!single)
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(widget.apps.length, (index) {
                    final bool active = index == _currentPage;
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      margin: const EdgeInsets.only(right: 8),
                      width: active ? 24 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: active
                            ? Theme.of(context).colorScheme.primary
                            : Colors.white.withOpacity(0.25),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    );
                  }),
                ),
              ),
          ],
        );
      },
    );
  }
}

class _FeaturedCard extends StatefulWidget {
  final App app;
  final bool autofocus;
  final ValueChanged<bool> onFocusChanged;
  final VoidCallback onArrowLeft;
  final VoidCallback onArrowRight;

  const _FeaturedCard({
    required this.app,
    required this.autofocus,
    required this.onFocusChanged,
    required this.onArrowLeft,
    required this.onArrowRight,
  });

  @override
  State<_FeaturedCard> createState() => _FeaturedCardState();
}

class _FeaturedCardState extends State<_FeaturedCard> {
  late final FocusNode _focusNode;
  late final Future<AppBannerImage> _imageFuture;
  bool _focused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode(debugLabel: 'featured_${widget.app.packageName}');
    _focusNode.addListener(_handleFocus);
    _imageFuture = _loadImage();
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocus);
    _focusNode.dispose();
    super.dispose();
  }

  void _handleFocus() {
    setState(() => _focused = _focusNode.hasFocus);
    widget.onFocusChanged(_focusNode.hasFocus);
  }

  Future<AppBannerImage> _loadImage() async {
    final AppsService appsService = context.read<AppsService>();
    final banner = await appsService.getAppBanner(widget.app.packageName);
    if (banner.isNotEmpty) {
      return AppBannerImage(banner: MemoryImage(banner), icon: null);
    }
    final icon = await appsService.getAppIcon(widget.app.packageName);
    return AppBannerImage(banner: null, icon: MemoryImage(icon));
  }

  void _launch() {
    context.read<AppsService>().launchApp(widget.app);
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Color accent = theme.colorScheme.primary;
    final AppLocalizations localizations = AppLocalizations.of(context)!;

    return FocusableActionDetector(
      focusNode: _focusNode,
      autofocus: widget.autofocus,
      onShowFocusHighlight: (value) => setState(() => _focused = value),
      shortcuts: const {
        SingleActivator(LogicalKeyboardKey.select): ActivateIntent(),
        SingleActivator(LogicalKeyboardKey.enter): ActivateIntent(),
        SingleActivator(LogicalKeyboardKey.gameButtonA): ActivateIntent(),
      },
      actions: <Type, Action<Intent>>{
        ActivateIntent: CallbackAction<ActivateIntent>(
          onInvoke: (_) => _launch(),
        ),
        _PreviousPageIntent: CallbackAction<_PreviousPageIntent>(
          onInvoke: (_) => widget.onArrowLeft(),
        ),
        _NextPageIntent: CallbackAction<_NextPageIntent>(
          onInvoke: (_) => widget.onArrowRight(),
        ),
      },
      child: Shortcuts(
        shortcuts: const {
          SingleActivator(LogicalKeyboardKey.arrowLeft): _PreviousPageIntent(),
          SingleActivator(LogicalKeyboardKey.arrowRight): _NextPageIntent(),
        },
        child: GestureDetector(
          onTap: _launch,
          child: AnimatedScale(
            scale: _focused ? 1.05 : 1.0,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOutCubic,
            child: FutureBuilder<AppBannerImage>(
              future: _imageFuture,
              builder: (context, snapshot) {
                final AppBannerImage? image = snapshot.data;

                return Material(
                  borderRadius: BorderRadius.circular(14),
                  clipBehavior: Clip.antiAlias,
                  elevation: _focused ? 24 : 4,
                  shadowColor: _focused
                      ? accent.withOpacity(0.5)
                      : Colors.black.withOpacity(0.5),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      // 背景：优先用应用 banner，没有则用渐变底
                      if (image?.banner != null)
                        Image(
                          image: image!.banner!,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => _placeholder(accent),
                        )
                      else
                        _placeholder(accent),
                      // 底部渐变，保证文字可读
                      DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.black.withOpacity(0.85),
                              Colors.black.withOpacity(0.35),
                              Colors.transparent,
                            ],
                            stops: const [0.0, 0.55, 1.0],
                          ),
                        ),
                      ),
                      // 焦点高亮描边
                      if (_focused)
                        IgnorePointer(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: accent, width: 2.5),
                            ),
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            // 左侧：大号应用名 + 「打开」提示
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    widget.app.name,
                                    style: theme.textTheme.headlineMedium?.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      height: 1.05,
                                      shadows: const [
                                        Shadow(
                                          color: Colors.black87,
                                          blurRadius: 12,
                                          offset: Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.play_arrow_rounded,
                                        size: 18,
                                        color: Colors.white.withOpacity(0.75),
                                      ),
                                      const SizedBox(width: 6),
                                      Flexible(
                                        child: Text(
                                          localizations.open,
                                          style: theme.textTheme.bodySmall?.copyWith(
                                            color: Colors.white.withOpacity(0.75),
                                            fontSize: 12,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 12),
                            // 右侧：应用图标（艾蒙顿为 200×200，约占卡宽 34%）
                            if (image?.icon != null)
                              Container(
                                width: 64,
                                height: 64,
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.35),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: const EdgeInsets.all(8),
                                child: Image(
                                  image: image!.icon!,
                                  fit: BoxFit.contain,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _placeholder(Color accent) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            accent.withOpacity(0.35),
            Colors.black.withOpacity(0.65),
          ],
        ),
      ),
    );
  }
}

class AppBannerImage {
  final ImageProvider? banner;
  final ImageProvider? icon;

  const AppBannerImage({this.banner, this.icon});
}

class _PreviousPageIntent extends Intent {
  const _PreviousPageIntent();
}

class _NextPageIntent extends Intent {
  const _NextPageIntent();
}
