import 'package:flauncher/l10n/app_localizations.dart';
import 'package:flauncher/models/app.dart';
import 'package:flauncher/models/category.dart';
import 'package:flauncher/providers/apps_service.dart';
import 'package:flauncher/providers/settings_service.dart';
import 'package:flauncher/widgets/apps_grid.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// 「应用」分页：把全部未隐藏应用以网格形式铺开。
///
/// 这里使用一个 id 为 -1 的虚拟分区，网格内部的拖动排序会自动跳过保存，
/// 避免把顺序写回不存在的分区。
class AllAppsPage extends StatelessWidget {
  const AllAppsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appsService = context.watch<AppsService>();
    final settingsService = context.watch<SettingsService>();

    final List<App> apps = appsService.applications.where((app) => !app.hidden).toList()
      ..sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));

    final Category virtualCategory = Category.withApplications(
      name: AppLocalizations.of(context)!.allApps,
      id: -1,
      type: CategoryType.grid,
      columnsCount: settingsService.columnsForCategory(Category.ColumnsCount),
      rowHeight: settingsService.rowHeightForCategory(Category.RowHeight).round(),
      applications: apps,
    );

    // 用 SingleChildScrollView 包一层：网格本身是 shrinkWrap，只有在无界高度下才能正常滚动
    return SingleChildScrollView(
      child: AppsGrid(
        category: virtualCategory,
        applications: apps,
        isFirstSection: true,
      ),
    );
  }
}
