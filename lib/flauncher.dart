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


import 'package:flauncher/actions.dart';
import 'package:flauncher/custom_traversal_policy.dart';
import 'package:flauncher/providers/apps_service.dart';
import 'package:flauncher/providers/launcher_state.dart';
import 'package:flauncher/providers/tv_inputs_service.dart';
import 'package:flauncher/providers/wallpaper_service.dart';
import 'package:flauncher/widgets/all_apps_page.dart';
import 'package:flauncher/widgets/apps_grid.dart';
import 'package:flauncher/widgets/category_row.dart';
import 'package:flauncher/widgets/launcher_alternative_view.dart';
import 'package:flauncher/widgets/focus_aware_app_bar.dart';
import 'package:flauncher/widgets/launcher_tab_bar.dart';
import 'package:flauncher/widgets/tv_inputs_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flauncher/widgets/continue_watching_row.dart';
import 'package:flauncher/providers/watch_next_service.dart';
import 'package:flauncher/providers/settings_service.dart';
import 'package:flauncher/l10n/app_localizations.dart';

import 'models/app.dart';
import 'models/category.dart';

class FLauncher extends StatefulWidget {
  const FLauncher({super.key});

  @override
  State<FLauncher> createState() => _FLauncherState();
}

class _FLauncherState extends State<FLauncher> {
  final GlobalKey<FocusAwareAppBarState> _appBarKey = GlobalKey();

  /// 0 = 首页，1 = 应用，2 = 输入源
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) => Actions(
    actions: <Type, Action<Intent>>{
      MoveFocusToSettingsIntent: CallbackAction<MoveFocusToSettingsIntent>(
        onInvoke: (_) => _appBarKey.currentState?.focusSettings(),
      ),
    },
    child: FocusTraversalGroup(
      policy: RowByRowTraversalPolicy(),
      child: Stack(
        children: [
          RepaintBoundary(
            child: Consumer<WallpaperService>(
              builder: (_, wallpaperService, __) => _wallpaper(context, wallpaperService)
            ),
          ),
          Consumer<LauncherState>(
            builder: (_, state, child) => Visibility(
              child: child!,
              replacement: const Center(
                child: AlternativeLauncherView()
              ),
              visible: state.launcherVisible
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: FocusAwareAppBar(key: _appBarKey),
              body: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: Consumer<AppsService>(
                  builder: (context, appsService, _) {
                    if (appsService.initialized) {
                      final bool hasInputs = context.select<TvInputsService, bool>((service) => service.hasInputs);
                      final int maxTab = hasInputs ? 2 : 1;
                      final int tab = _selectedTabIndex.clamp(0, maxTab);

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LauncherTabBar(
                            selectedIndex: tab,
                            onSelected: (index) => setState(() => _selectedTabIndex = index.clamp(0, maxTab)),
                          ),
                          Expanded(
                            child: _currentPage(context, appsService, tab),
                          ),
                        ],
                      );
                    }
                    else {
                      return _emptyState(context);
                    }
                  }
                )
              )
            )
          )
        ]
      )
    ),
  );

  /// 按当前 Tab 返回对应页面：首页 / 全部应用 / 输入源
  Widget _currentPage(BuildContext context, AppsService appsService, int tab) {
    switch (tab) {
      case 1:
        return const AllAppsPage();
      case 2:
        return const TvInputsPage();
      default:
        return _homePage(context, appsService);
    }
  }

  /// 首页：继续观看 + 精选大卡片位 + 用户配置的行/网格分区
  Widget _homePage(BuildContext context, AppsService appsService) {
    final SettingsService settingsService = context.watch<SettingsService>();

    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ContinueWatchingRow(),
          if (settingsService.showFeaturedRow) _featuredRow(context, appsService, settingsService),
          _sections(appsService.launcherSections, settingsService),
        ],
      ),
    );
  }

  /// 艾蒙顿风格的「大卡片位」：按最近使用排序，16:9 横幅，高度约为普通行的一倍多
  Widget _featuredRow(BuildContext context, AppsService appsService, SettingsService settingsService) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;

    final List<App> featured = appsService.applications.where((app) => !app.hidden).toList()
      ..sort((a, b) {
        final DateTime aTime = a.lastLaunchedAt ?? DateTime.fromMillisecondsSinceEpoch(0);
        final DateTime bTime = b.lastLaunchedAt ?? DateTime.fromMillisecondsSinceEpoch(0);
        return bTime.compareTo(aTime);
      });

    if (featured.isEmpty) {
      return const SizedBox.shrink();
    }

    final List<App> shown = featured.take(10).toList();

    final Category category = Category.withApplications(
      name: localizations.featured,
      id: -2,
      type: CategoryType.row,
      columnsCount: 1,
      rowHeight: settingsService.featuredRowHeight.round(),
      applications: shown,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: CategoryRow(
        category: category,
        applications: shown,
        autofocus: false,
      ),
    );
  }

  /// 把「卡片尺寸」设置套用到分区上（跟随分区时直接用原值，不新建对象）
  Category _applyCardSize(Category source, SettingsService settingsService) {
    if (settingsService.cardSize == CardSize.follow) {
      return source;
    }

    return Category.withApplications(
      name: source.name,
      id: source.id,
      order: source.order,
      columnsCount: settingsService.columnsForCategory(source.columnsCount),
      rowHeight: settingsService.rowHeightForCategory(source.rowHeight).round(),
      sort: source.sort,
      type: source.type,
      applications: source.applications,
    );
  }

  Widget _sections(List<LauncherSection> sections, SettingsService settingsService) {
    final watchNextService = Provider.of<WatchNextService>(context, listen: false);
    final bool continueWatchingActive = settingsService.showContinueWatching && watchNextService.programs.isNotEmpty;

    List<Widget> children = [];
    bool firstCategoryFound = continueWatchingActive || settingsService.showFeaturedRow;

    for (var section in sections) {
      final Key sectionKey = Key(section.id.toString());

      if (section is LauncherSpacer) {
        children.add(SizedBox(key: sectionKey, height: section.height.toDouble()));
        continue;
      }

      Category category = _applyCardSize(section as Category, settingsService);
      Widget categoryWidget;

      // Pass isFirstSection only to the first category found
      bool isFirstSection = !firstCategoryFound;
      if (isFirstSection) firstCategoryFound = true;

      switch (category.type) {
        case CategoryType.row:
          categoryWidget = CategoryRow(
              key: sectionKey,
              category: category,
              applications: category.applications,
              isFirstSection: isFirstSection,
              autofocus: isFirstSection
          );
          break; // Added break
        case CategoryType.grid:
          categoryWidget = AppsGrid(
              key: sectionKey,
              category: category,
              applications: category.applications,
              isFirstSection: isFirstSection,
              autofocus: isFirstSection
          );
          break; // Added break
      }

      children.add(Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: categoryWidget
      ));
    }

    return Column(children: children);
  }

  Widget _wallpaper(BuildContext context, WallpaperService wallpaperService) {
    Widget background;
    if (wallpaperService.wallpaper != null) {
      final physicalSize = MediaQuery.sizeOf(context);
      background = Image(
        image: wallpaperService.wallpaper!,
        key: Key("background_${wallpaperService.version}"),
        fit: BoxFit.cover,
        height: physicalSize.height,
        width: physicalSize.width
      );
    }
    else {
      background = Container(key: const Key("background"), decoration: BoxDecoration(gradient: wallpaperService.gradient.gradient));
    }

    return Stack(
      fit: StackFit.expand,
      children: [
        background,
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.35),
                Colors.black.withOpacity(0.15),
                Colors.black.withOpacity(0.45),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _emptyState(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          const SizedBox(height: 16),
          Text(localizations.loading, style: Theme.of(context).textTheme.titleLarge),
        ],
      ),
    );
  }
}
