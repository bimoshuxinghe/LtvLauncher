import 'package:flauncher/l10n/app_localizations.dart';
import 'package:flauncher/models/tv_input.dart';
import 'package:flauncher/providers/tv_inputs_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// 「输入源」分页：以网格展示 HDMI / 天线 / AV 等输入源，点击直接切换。
class TvInputsPage extends StatelessWidget {
  const TvInputsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final List<TvInput> inputs = context.watch<TvInputsService>().inputs;

    if (inputs.isEmpty) {
      return Center(
        child: Text(
          localizations.noInputsDetected,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 16 / 9,
      ),
      itemCount: inputs.length,
      itemBuilder: (context, index) => _InputCard(
        input: inputs[index],
        autofocus: index == 0,
      ),
    );
  }
}

class _InputCard extends StatelessWidget {
  final TvInput input;
  final bool autofocus;

  const _InputCard({required this.input, this.autofocus = false});

  @override
  Widget build(BuildContext context) {
    final service = context.read<TvInputsService>();

    return Card(
      color: Colors.white.withOpacity(0.08),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        autofocus: autofocus,
        borderRadius: BorderRadius.circular(12),
        onTap: () => service.switchInput(input.id),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(_iconFor(input.type), size: 36),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                input.label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _iconFor(TvInputType type) {
    switch (type) {
      case TvInputType.hdmi:
        return Icons.settings_input_hdmi;
      case TvInputType.tuner:
        return Icons.tv;
      case TvInputType.av:
        return Icons.settings_input_component;
      case TvInputType.other:
        return Icons.input;
    }
  }
}
