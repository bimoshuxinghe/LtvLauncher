/*
 * 卡片尺寸设置页
 *
 * 允许用户统一覆盖所有分区的卡片大小；默认「跟随分区设置」保持原有行为。
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flauncher/l10n/app_localizations.dart';

import '../../providers/settings_service.dart';

class CardSizePage extends StatelessWidget {
  static const String routeName = "card_size_panel";

  const CardSizePage({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;

    return Selector<SettingsService, CardSize>(
      selector: (_, settingsService) => settingsService.cardSize,
      builder: (context, currentSize, _) {
        final settingsService = context.read<SettingsService>();

        final List<(CardSize, String)> options = [
          (CardSize.follow, localizations.cardSizeFollow),
          (CardSize.small, localizations.cardSizeSmall),
          (CardSize.medium, localizations.cardSizeMedium),
          (CardSize.large, localizations.cardSizeLarge),
        ];

        return Column(
          children: [
            Text(localizations.cardSize, style: Theme.of(context).textTheme.titleLarge),
            const Divider(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: options
                      .map((option) => _CardSizeRadioTile(
                            title: option.$2,
                            value: option.$1,
                            groupValue: currentSize,
                            onChanged: (value) => settingsService.setCardSize(value),
                            autofocus: currentSize == option.$1,
                          ))
                      .toList(),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _CardSizeRadioTile extends StatefulWidget {
  final String title;
  final CardSize value;
  final CardSize groupValue;
  final ValueChanged<CardSize> onChanged;
  final bool autofocus;

  const _CardSizeRadioTile({
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.autofocus = false,
  });

  @override
  State<_CardSizeRadioTile> createState() => _CardSizeRadioTileState();
}

class _CardSizeRadioTileState extends State<_CardSizeRadioTile> {
  bool _hasFocus = false;

  @override
  Widget build(BuildContext context) {
    final isSelected = widget.value == widget.groupValue;
    final primaryColor = Theme.of(context).colorScheme.primary;

    return RepaintBoundary(
      child: Actions(
        actions: <Type, Action<Intent>>{
          ActivateIntent: CallbackAction<ActivateIntent>(onInvoke: (_) {
            widget.onChanged(widget.value);
            return null;
          }),
          ButtonActivateIntent: CallbackAction<ButtonActivateIntent>(onInvoke: (_) {
            widget.onChanged(widget.value);
            return null;
          }),
        },
        child: Focus(
          autofocus: widget.autofocus,
          onFocusChange: (hasFocus) {
            setState(() {
              _hasFocus = hasFocus;
            });
            if (hasFocus) {
              Scrollable.ensureVisible(
                context,
                alignment: 0.5,
                duration: const Duration(milliseconds: 100),
                curve: Curves.easeOut,
              );
            }
          },
          child: InkWell(
            onTap: () => widget.onChanged(widget.value),
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: _hasFocus ? Colors.white.withOpacity(0.05) : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
                border: _hasFocus
                    ? Border.all(color: primaryColor, width: 2)
                    : Border.all(color: Colors.transparent, width: 2),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                            color: isSelected ? Colors.white : Colors.white70,
                          ),
                    ),
                  ),
                  if (isSelected)
                    Icon(Icons.check_circle, color: primaryColor)
                  else
                    const Icon(Icons.circle_outlined, color: Colors.white38),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
