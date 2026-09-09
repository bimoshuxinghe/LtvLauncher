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

import 'package:flauncher/providers/apps_service.dart';
import 'package:flauncher/widgets/app_card.dart';
import 'package:flauncher/widgets/category_container_common.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/app.dart';
import '../models/category.dart';
import '../providers/settings_service.dart';

class CategoryRow extends StatelessWidget
{
  final Category category;
  final List<App> applications;

  final bool isFirstSection;

  /// 是否让第一张卡片自动获得焦点。
  /// 主屏只给首个分区传 true，保证开机焦点落在最上面一行。
  final bool autofocus;

  CategoryRow({
    Key? key,
    required this.category,
    required this.applications,
    this.isFirstSection = false,
    this.autofocus = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget categoryContent;
    if (applications.isEmpty) {
      categoryContent = categoryContainerEmptyState(context);
    }
    else {
      categoryContent = SizedBox(
        height: category.rowHeight.toDouble(),
        child: ListView.custom(
          clipBehavior: Clip.none,
          padding: const EdgeInsets.all(12),
          scrollDirection: Axis.horizontal,
          childrenDelegate: SliverChildBuilderDelegate(
            childCount: applications.length,
            findChildIndexCallback: _findChildIndex,
            (context, index) => Padding(
                key: Key(applications[index].packageName),
                // 卡片间距 20，与网格分区一致
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: AppCard(
                  index: index,
                  category: category,
                  application: applications[index],
                  autofocus: autofocus && index == 0,
                  handleUpNavigationToSettings: isFirstSection,
                  isFirstInRow: index == 0,
                  isLastInRow: index == applications.length - 1,
                  onMove: (direction) => _onMove(context, direction, applications[index]),
                  onMoveEnd: () => _onMoveEnd(context),
                  onMoveCancel: () => _onMoveCancel(context),
                )
            )
          )
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
    if (key is ValueKey<String>) {
      final index = applications.indexWhere((app) => app.packageName == key.value);
      return index >= 0 ? index : null;
    }
    return null;
  }

  void _onMove(BuildContext context, AxisDirection direction, App movingApp) {
    final index = applications.indexOf(movingApp);
    if (index == -1) return;

    int newIndex = 0;

    if (direction == AxisDirection.right && index < applications.length - 1) {
      newIndex = index + 1;
    } else if (direction == AxisDirection.left && index > 0) {
      newIndex = index - 1;
    } else {
      // Ignore UP/DOWN or at boundaries
      return;
    }

    final appsService = context.read<AppsService>();
    appsService.setPendingReorderFocus(movingApp.packageName, category.id, newIndex);
    appsService.reorderApplication(category, index, newIndex);
  }

  void _onMoveEnd(BuildContext context) {
    final appsService = context.read<AppsService>();
    appsService.saveApplicationOrderInCategory(category);
  }

  void _onMoveCancel(BuildContext context) {
    final appsService = context.read<AppsService>();
    appsService.cancelReorderApplication(category);
  }
}
