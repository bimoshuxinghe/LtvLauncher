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
import 'package:collection/collection.dart';
import 'package:flauncher/widgets/all_apps_page.dart';
import 'package:flauncher/widgets/favorite_apps_row.dart';
import 'package:flauncher/widgets/time_hero_card.dart';
import 'package:flauncher/widgets/weather_hero_card.dart';
import 'package:flauncher/widgets/launcher_alternative_view.dart';
import 'package:flauncher/widgets/focus_aware_app_bar.dart';
import 'package:flauncher/widgets/launcher_tab_bar.dart';
import 'package:flauncher/widgets/tv_inputs_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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

  /// 首页：顶部左右两大卡（天气 / 时间），下方「常用应用」横向卡片行。
  Widget _homePage(BuildContext context, AppsService appsService) {
    final Category? favoritesCategory = appsService.categories.firstWhereOrNull(
      (category) => category.name == 'Favorites' || category.name == '常用应用',
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 顶部双大卡：左天气，右时间
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final double maxWidth = constraints.maxWidth;
              final double cardWidth = ((maxWidth - 24) / 2).clamp(220.0, 560.0);
              final double cardHeight = cardWidth * 9 / 16;
              return Row(
                children: [
                  SizedBox(
                    width: cardWidth,
                    height: cardHeight,
                    child: const WeatherHeroCard(),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: cardWidth,
                    height: cardHeight,
                    child: const TimeHeroCard(),
                  ),
                ],
              );
            },
          ),
        ),
        const SizedBox(height: 32),
        // 常用应用行：按遥控器下键切到「应用」页看全部
        if (favoritesCategory != null)
          FavoriteAppsRow(
            category: favoritesCategory,
            applications: favoritesCategory.applications,
            onShowAllApps: () => setState(() => _selectedTabIndex = 1),
          )
        else
          const Spacer(),
        const Spacer(),
      ],
    );
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
