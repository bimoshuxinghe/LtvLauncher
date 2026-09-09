import 'package:flauncher/l10n/app_localizations.dart';
import 'package:flauncher/providers/tv_inputs_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// 主屏顶部分页标签栏（首页 / 应用 / 输入源）。
///
/// 遥控器左右键在标签间移动，回车或点击切换页面；
/// 只有在检测到输入源时才显示「输入源」标签。
class LauncherTabBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onSelected;
  final bool autofocus;

  const LauncherTabBar({
    super.key,
    required this.selectedIndex,
    required this.onSelected,
    this.autofocus = false,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final bool hasInputs = context.select<TvInputsService, bool>((service) => service.hasInputs);

    final List<String> labels = [localizations.tabHome, localizations.tabApps];
    final List<IconData> icons = [Icons.home_outlined, Icons.apps];
    if (hasInputs) {
      labels.add(localizations.tabInputs);
      icons.add(Icons.input);
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(labels.length, (index) {
          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: _TabButton(
              label: labels[index],
              icon: icons[index],
              selected: index == selectedIndex,
              autofocus: autofocus && index == selectedIndex,
              onPressed: () => onSelected(index),
            ),
          );
        }),
      ),
    );
  }
}

class _TabButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool selected;
  final bool autofocus;
  final VoidCallback onPressed;

  const _TabButton({
    required this.label,
    required this.icon,
    required this.selected,
    required this.autofocus,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) => TextButton.icon(
        autofocus: autofocus,
        onPressed: onPressed,
        icon: Icon(icon, size: 20),
        label: Text(
          label,
          style: TextStyle(
            fontSize: 18,
            fontWeight: selected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        style: TextButton.styleFrom(
          backgroundColor: selected ? Colors.white.withOpacity(0.18) : Colors.transparent,
          foregroundColor: selected ? Colors.white : Colors.white70,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          side: selected ? const BorderSide(color: Colors.white54, width: 1) : BorderSide.none,
        ),
      );
}
