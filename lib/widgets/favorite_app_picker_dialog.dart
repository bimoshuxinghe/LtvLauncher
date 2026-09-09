import 'dart:typed_data';

import 'package:flauncher/providers/apps_service.dart';
import 'package:flauncher/widgets/side_panel_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flauncher/l10n/app_localizations.dart';

/// 选择应用添加到「常用应用」的对话框。
///
/// 列出所有未隐藏且不在常用应用中的应用，点击后自动加入 Favorites。
class FavoriteAppPickerDialog extends StatelessWidget {
  const FavoriteAppPickerDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final appsService = context.watch<AppsService>();
    final favoritePackages = appsService.categories
        .where((c) => c.name == 'Favorites' || c.name == '常用应用')
        .expand((c) => c.applications)
        .map((a) => a.packageName)
        .toSet();

    final apps = appsService.applications
        .where((app) => !app.hidden && !favoritePackages.contains(app.packageName))
        .toList()
      ..sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));

    return SidePanelDialog(
      width: 340,
      isRightSide: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            localizations.addToFavorites,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          Expanded(
            child: apps.isEmpty
                ? Center(
                    child: Text(
                      localizations.noApplications,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white70),
                    ),
                  )
                : ListView.builder(
                    itemCount: apps.length,
                    itemBuilder: (context, index) {
                      final app = apps[index];
                      return Card(
                        clipBehavior: Clip.antiAlias,
                        margin: const EdgeInsets.only(bottom: 8),
                        child: ListTile(
                          onTap: () async {
                            await context.read<AppsService>().addToFavorites(app);
                            if (context.mounted) Navigator.of(context).pop();
                          },
                          leading: FutureBuilder<Uint8List>(
                            future: appsService.getAppIcon(app.packageName),
                            builder: (context, snapshot) {
                              if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                                return Image(
                                  image: MemoryImage(snapshot.data!),
                                  width: 32,
                                  height: 32,
                                  fit: BoxFit.contain,
                                );
                              }
                              return const Icon(Icons.android, size: 32);
                            },
                          ),
                          title: Text(
                            app.name,
                            style: Theme.of(context).textTheme.bodyMedium,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
