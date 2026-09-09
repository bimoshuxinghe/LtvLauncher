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
import 'package:flauncher/widgets/weather_hero_card.dart';
import 'package:flauncher/widgets/launcher_alternative_view.dart';
import 'package:flauncher/widgets/focus_aware_app_bar.dart';
import 'package:flauncher/widgets/launcher_tab_bar.dart';
import 'package:flauncher/widgets/tv_inputs_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flauncher/providers/settings_service.dart';
import 'package:flauncher/l10n/app_localizations.dart';

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

  /// 首页（严格对齐艾蒙顿 fragmnet_main.xml）：
  ///   左上大卡（592×333，永远显示）→ 与标题之间留白 236px → 分类标题 → 横向卡片行
  Widget _homePage(BuildContext context, AppsService appsService) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 艾蒙顿大卡：顶部居中靠左，占屏宽 ~31%（592/1920），比例 16:9（333/592）
          Padding(
            padding: const EdgeInsets.only(left: 24, top: 4),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final double cardWidth =
                    (constraints.maxWidth * 0.31).clamp(220.0, 460.0);
                final double cardHeight = cardWidth * 9 / 16;
                return Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    width: cardWidth,
                    height: cardHeight,
                    child: const WeatherHeroCard(),
                  ),
                );
              },
            ),
          ),
          // 艾蒙顿：大卡(y160~493) 到分类标题(y729) 之间的 236px 留白
          const SizedBox(height: 118),
          _sections(appsService.launcherSections, context.watch<SettingsService>()),
        ],
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
    List<Widget> children = [];
    // 大卡位已在 _homePage 单独渲染，这里不再算作「首个内容」
    bool firstCategoryFound = false;

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
              autofocus: isFirstSection,
              // 瀑布流：首页网格分区最多两行，超出的收进「更多」
              maxRows: 2,
              onSeeAll: () => setState(() => _selectedTabIndex = 1)
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
        // 艾蒙顿风格：底部额外压一层渐变（对应其 450px 高的底部遮罩），
        // 保证最下面一行卡片的文字可读
        Align(
          alignment: Alignment.bottomCenter,
          child: IgnorePointer(
            child: Container(
              height: MediaQuery.sizeOf(context).height * 0.42,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.55),
                  ],
                ),
              ),
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
