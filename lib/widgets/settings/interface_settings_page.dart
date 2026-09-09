/*
 * FLauncher
 * Copyright (C) 2024 LeanBitLab
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

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flauncher/l10n/app_localizations.dart';
import 'card_size_page.dart';
import 'focusable_settings_tile.dart';
import 'launcher_sections_panel_page.dart';
import 'wallpaper_panel_page.dart';
import 'status_bar_panel_page.dart';
import 'accent_color_page.dart';
import 'misc_panel_page.dart';
import 'themes_page.dart';
import '../../providers/settings_service.dart';

class InterfaceSettingsPage extends StatelessWidget {
  static const String routeName = "interface_settings_panel";

  const InterfaceSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;

    return Column(
      children: [
        Text(localizations.interface, style: Theme.of(context).textTheme.titleLarge),
        const Divider(),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                FocusableSettingsTile(
                  autofocus: true,
                  leading: const Icon(Icons.category),
                  title: Text(localizations.launcherSections, style: Theme.of(context).textTheme.bodyMedium),
                  onPressed: () => Navigator.of(context).pushNamed(LauncherSectionsPanelPage.routeName),
                ),
                FocusableSettingsTile(
                  leading: const Icon(Icons.wallpaper_outlined),
                  title: Text(localizations.wallpaper, style: Theme.of(context).textTheme.bodyMedium),
                  onPressed: () => Navigator.of(context).pushNamed(WallpaperPanelPage.routeName),
                ),
                FocusableSettingsTile(
                  leading: const Icon(Icons.tips_and_updates),
                  title: Text(localizations.statusBar, style: Theme.of(context).textTheme.bodyMedium),
                  onPressed: () => Navigator.of(context).pushNamed(StatusBarPanelPage.routeName),
                ),
                FocusableSettingsTile(
                  leading: const Icon(Icons.palette_outlined),
                  title: Text(localizations.accentColor, style: Theme.of(context).textTheme.bodyMedium),
                  onPressed: () => Navigator.of(context).pushNamed(AccentColorPage.routeName),
                ),
                FocusableSettingsTile(
                  leading: const Icon(Icons.crop_square),
                  title: Text(localizations.themes, style: Theme.of(context).textTheme.bodyMedium),
                  onPressed: () => Navigator.of(context).pushNamed(ThemesPage.routeName),
                ),
                Consumer<SettingsService>(
                  builder: (context, settingsService, _) => FocusableSettingsTile(
                    leading: const Icon(Icons.aspect_ratio),
                    title: Text(localizations.cardSize, style: Theme.of(context).textTheme.bodyMedium),
                    trailing: Text(
                      _cardSizeLabel(settingsService.cardSize, localizations),
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white54),
                    ),
                    onPressed: () => Navigator.of(context).pushNamed(CardSizePage.routeName),
                  ),
                ),
                Consumer<SettingsService>(
                  builder: (context, settingsService, _) => FocusableSettingsTile(
                    leading: const Icon(Icons.featured_video_outlined),
                    title: Text(localizations.showFeaturedRow, style: Theme.of(context).textTheme.bodyMedium),
                    subtitle: Text(localizations.showFeaturedRowDescription,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white54)),
                    trailing: Switch(
                      value: settingsService.showFeaturedRow,
                      onChanged: (value) => settingsService.setShowFeaturedRow(value),
                    ),
                    onPressed: () => settingsService.setShowFeaturedRow(!settingsService.showFeaturedRow),
                  ),
                ),
                FocusableSettingsTile(
                  leading: const Icon(Icons.miscellaneous_services),
                  title: Text(localizations.miscellaneous, style: Theme.of(context).textTheme.bodyMedium),
                  onPressed: () => Navigator.of(context).pushNamed(MiscPanelPage.routeName),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

String _cardSizeLabel(CardSize size, AppLocalizations localizations) {
  switch (size) {
    case CardSize.small:
      return localizations.cardSizeSmall;
    case CardSize.medium:
      return localizations.cardSizeMedium;
    case CardSize.large:
      return localizations.cardSizeLarge;
    case CardSize.follow:
      return localizations.cardSizeFollow;
  }
}
