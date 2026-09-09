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

import 'dart:math';

import 'package:flauncher/l10n/app_localizations.dart';
import 'package:flauncher/providers/apps_service.dart';
import 'package:flauncher/widgets/app_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../models/app.dart';
import '../models/category.dart';
import '../providers/settings_service.dart';
import 'category_container_common.dart';

class AppsGrid extends StatelessWidget
{
  final Category category;
  final List<App> applications;

  final bool isFirstSection;

  /// 是否让第一张卡片自动获得焦点（主屏只给首个分区传 true）
  final bool autofocus;

  /// 首页瀑布流：网格最多显示几行，超出的折叠到「更多」卡片里（null = 全部显示）
  final int? maxRows;

  /// 点击「更多」卡片时的回调（一般切到「应用」页看全部）
  final VoidCallback? onSeeAll;

  AppsGrid({
    Key? key,
    required this.category,
    required this.applications,
    this.isFirstSection = false,
    this.autofocus = true,
    this.maxRows,
    this.onSeeAll,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 折叠：超过 maxRows 行时，最后留一格放「更多」卡片
    final int? rows = maxRows;
    int? visibleCount;
    if (rows != null && applications.length > rows * category.columnsCount) {
      visibleCount = rows * category.columnsCount - 1;
    }
    final bool collapsed = visibleCount != null;
    final int shownCount = visibleCount ?? applications.length;

    Widget categoryContent;
    if (applications.isEmpty) {
      categoryContent = categoryContainerEmptyState(context);
    }
    else {
      categoryContent = GridView.custom(
        clipBehavior: Clip.none,
        primary: false,
        shrinkWrap: true,
        gridDelegate: _buildSliverGridDelegate(),
        padding: const EdgeInsets.all(24),
        childrenDelegate: SliverChildBuilderDelegate(
          childCount: shownCount + (collapsed ? 1 : 0),
          findChildIndexCallback: _findChildIndex,
          (context, index) {
            // 折叠态的最后一格：更多
            if (collapsed && index == shownCount) {
              return _SeeAllCard(
                remaining: applications.length - shownCount,
                onTap: onSeeAll,
              );
            }

            final isFirstInRow = index % category.columnsCount == 0;
            final isLastInRow = index % category.columnsCount == category.columnsCount - 1 || index == applications.length - 1;

            return AppCard(
              key: Key(applications[index].packageName),
              index: index,
              category: category,
              application: applications[index],
              autofocus: autofocus && index == 0,
              handleUpNavigationToSettings: isFirstSection && index < category.columnsCount,
              isFirstInRow: isFirstInRow,
              isLastInRow: isLastInRow,
              // 折叠态下禁用拖动排序，避免显示顺序与真实顺序不一致
              onMove: collapsed ? (_) {} : (direction) => _onMove(context, direction, applications[index]),
              onMoveEnd: collapsed ? () {} : () => _saveOrder(context),
              onMoveCancel: collapsed ? () {} : () => _cancelOrder(context),
            );
          }
        )
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Selector<SettingsService, bool>(
          selector: (context, service) => service.showCategoryTitles,
          builder: (context, showCategoriesTitle, _) {
            if (showCategoriesTitle) {
              return Padding(
                padding: const EdgeInsets.only(left: 16, bottom: 8),
                child: Row(
                  children: [
                    Text(category.name,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontSize: 18, shadows: [const Shadow(color: Colors.black54, offset: Offset(1, 1), blurRadius: 8)])
                    ),
                    const SizedBox(width: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text('${applications.length}',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: Colors.white70, fontSize: 12, height: 1.2)
                      ),
                    ),
                  ],
                ),
              );
            }

            return const SizedBox.shrink();
          }
        ),
        categoryContent
      ],
    );
  }


  int? _findChildIndex(Key key) {
    final valueKey = key as ValueKey<String>;
    final index = applications.indexWhere((app) => app.packageName == valueKey.value);
    return index >= 0 ? index : null;
  }

  void _onMove(BuildContext context, AxisDirection direction, App movingApp) {
    final index = applications.indexOf(movingApp);
    if (index == -1) return;

    final currentRow = (index / category.columnsCount).floor();
    final totalRows = ((applications.length - 1) / category.columnsCount).floor();

    int? newIndex;
    switch (direction) {
      case AxisDirection.up:
        if (currentRow > 0) {
          newIndex = index - category.columnsCount;
        }
        // At top boundary - do nothing
        break;
      case AxisDirection.right:
        if (index < applications.length - 1) {
          newIndex = index + 1;
        }
        break;
      case AxisDirection.down:
        if (currentRow < totalRows) {
          newIndex = min(index + category.columnsCount, applications.length - 1);
        }
        // At bottom boundary - do nothing
        break;
      case AxisDirection.left:
        if (index > 0) {
          newIndex = index - 1;
        }
        break;
    }
    if (newIndex != null) {
      final appsService = context.read<AppsService>();
      appsService.setPendingReorderFocus(movingApp.packageName, category.id, newIndex);
      appsService.reorderApplication(category, index, newIndex);
    }
  }

  void _saveOrder(BuildContext context) {
    final appsService = context.read<AppsService>();
    appsService.saveApplicationOrderInCategory(category);
  }

  void _cancelOrder(BuildContext context) {
    final appsService = context.read<AppsService>();
    appsService.cancelReorderApplication(category);
  }

  SliverGridDelegate _buildSliverGridDelegate() => SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: category.columnsCount,
        childAspectRatio: 16 / 9,
        // 艾蒙顿/当贝风格：卡片间距 20（1080p 基准下等于艾蒙顿的 40px）
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      );

}

/// 瀑布流分区被折叠时，末尾的「更多」卡片（点击去看全部应用）
class _SeeAllCard extends StatefulWidget {
  final int remaining;
  final VoidCallback? onTap;

  const _SeeAllCard({required this.remaining, this.onTap});

  @override
  State<_SeeAllCard> createState() => _SeeAllCardState();
}

class _SeeAllCardState extends State<_SeeAllCard> {
  late final FocusNode _focusNode;
  bool _focused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode(debugLabel: 'see_all_card');
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() => setState(() => _focused = _focusNode.hasFocus);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Color accent = theme.colorScheme.primary;
    final String more = AppLocalizations.of(context)!.more;

    return FocusableActionDetector(
      focusNode: _focusNode,
      onShowFocusHighlight: (value) => setState(() => _focused = value),
      shortcuts: const {
        SingleActivator(LogicalKeyboardKey.select): ActivateIntent(),
        SingleActivator(LogicalKeyboardKey.enter): ActivateIntent(),
        SingleActivator(LogicalKeyboardKey.gameButtonA): ActivateIntent(),
      },
      actions: <Type, Action<Intent>>{
        ActivateIntent: CallbackAction<ActivateIntent>(
          onInvoke: (_) => widget.onTap?.call(),
        ),
      },
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedScale(
          scale: _focused ? 1.05 : 1.0,
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOutCubic,
          child: AspectRatio(
            aspectRatio: 16 / 9,
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.apps_rounded,
                    size: 34,
                    color: Colors.white.withOpacity(0.85),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    more,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: Colors.white.withOpacity(0.85),
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (widget.remaining > 0)
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Text(
                        '+${widget.remaining}',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: Colors.white.withOpacity(0.55),
                          fontSize: 12,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
