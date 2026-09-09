import 'package:flauncher/l10n/app_localizations.dart';
import 'package:flauncher/providers/apps_service.dart';
import 'package:flauncher/providers/settings_service.dart';
import 'package:flauncher/widgets/app_card.dart';
import 'package:flauncher/widgets/favorite_app_picker_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../models/app.dart';
import '../models/category.dart';

/// 首页「常用应用」横向卡片行。
///
/// 把 Favorites 分类里的应用以大尺寸矩形卡片展示，末尾带一个「+」添加卡片。
/// 在卡片上按遥控器下键会触发 [onShowAllApps]（通常切到「应用」页看全部）。
class FavoriteAppsRow extends StatelessWidget {
  final Category category;
  final List<App> applications;
  final VoidCallback? onShowAllApps;

  const FavoriteAppsRow({
    super.key,
    required this.category,
    required this.applications,
    this.onShowAllApps,
  });

  @override
  Widget build(BuildContext context) {
    final settingsService = context.watch<SettingsService>();
    final showTitle = settingsService.showCategoryTitles;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showTitle)
          Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 8),
            child: Row(
              children: [
                Text(
                  _title(context),
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 18,
                        shadows: [const Shadow(color: Colors.black54, offset: Offset(1, 1), blurRadius: 8)],
                      ),
                ),
                const SizedBox(width: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '${applications.length}',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Colors.white70,
                          fontSize: 12,
                          height: 1.2,
                        ),
                  ),
                ),
              ],
            ),
          ),
        SizedBox(
          height: category.rowHeight.toDouble(),
          child: ListView.custom(
            clipBehavior: Clip.none,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            scrollDirection: Axis.horizontal,
            childrenDelegate: SliverChildBuilderDelegate(
              childCount: applications.length + 1,
              findChildIndexCallback: _findChildIndex,
              (context, index) {
                final bool isAddCard = index == applications.length;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: isAddCard
                      ? _AddFavoriteCard(
                          onTap: () => _showPicker(context),
                        )
                      : AppCard(
                          key: Key(applications[index].packageName),
                          index: index,
                          category: category,
                          application: applications[index],
                          autofocus: index == 0,
                          handleUpNavigationToSettings: false,
                          isFirstInRow: index == 0,
                          isLastInRow: index == applications.length - 1,
                          aspectRatio: 2.8,
                          onArrowDown: onShowAllApps,
                          onMove: (direction) => _onMove(context, direction, applications[index]),
                          onMoveEnd: () => _onMoveEnd(context),
                          onMoveCancel: () => _onMoveCancel(context),
                        ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  String _title(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    if (category.name == 'Favorites' || category.name == '常用应用') {
      return localizations.favoriteApps;
    }
    return category.name;
  }

  int? _findChildIndex(Key key) {
    if (key is ValueKey<String>) {
      final index = applications.indexWhere((app) => app.packageName == key.value);
      return index >= 0 ? index : null;
    }
    return null;
  }

  void _showPicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const FavoriteAppPickerDialog(),
    );
  }

  void _onMove(BuildContext context, AxisDirection direction, App movingApp) {
    final index = applications.indexOf(movingApp);
    if (index == -1) return;

    int newIndex = index;
    if (direction == AxisDirection.right && index < applications.length - 1) {
      newIndex = index + 1;
    } else if (direction == AxisDirection.left && index > 0) {
      newIndex = index - 1;
    } else {
      return;
    }

    final appsService = context.read<AppsService>();
    appsService.setPendingReorderFocus(movingApp.packageName, category.id, newIndex);
    appsService.reorderApplication(category, index, newIndex);
  }

  void _onMoveEnd(BuildContext context) {
    context.read<AppsService>().saveApplicationOrderInCategory(category);
  }

  void _onMoveCancel(BuildContext context) {
    context.read<AppsService>().cancelReorderApplication(category);
  }
}

/// 「+」添加卡片
class _AddFavoriteCard extends StatefulWidget {
  final VoidCallback? onTap;

  const _AddFavoriteCard({this.onTap});

  @override
  State<_AddFavoriteCard> createState() => _AddFavoriteCardState();
}

class _AddFavoriteCardState extends State<_AddFavoriteCard> {
  bool _focused = false;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Color accent = theme.colorScheme.primary;

    return FocusableActionDetector(
      onShowFocusHighlight: (value) => setState(() => _focused = value),
      autofocus: false,
      shortcuts: const {
        SingleActivator(LogicalKeyboardKey.select): ActivateIntent(),
        SingleActivator(LogicalKeyboardKey.enter): ActivateIntent(),
        SingleActivator(LogicalKeyboardKey.gameButtonA): ActivateIntent(),
      },
      actions: <Type, Action<Intent>>{
        ActivateIntent: CallbackAction<ActivateIntent>(
          onInvoke: (_) {
            widget.onTap?.call();
            return null;
          },
        ),
      },
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedScale(
          scale: _focused ? 1.05 : 1.0,
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOutCubic,
          child: AspectRatio(
            aspectRatio: 2.8,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Colors.white.withOpacity(_focused ? 0.16 : 0.08),
                border: Border.all(
                  color: _focused ? accent : Colors.white.withOpacity(0.25),
                  width: _focused ? 2.5 : 1.2,
                ),
                boxShadow: _focused
                    ? [
                        BoxShadow(
                          color: accent.withOpacity(0.35),
                          blurRadius: 16,
                          spreadRadius: 1,
                        ),
                      ]
                    : null,
              ),
              child: Center(
                child: Icon(
                  Icons.add_rounded,
                  size: 48,
                  color: Colors.white.withOpacity(0.85),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
