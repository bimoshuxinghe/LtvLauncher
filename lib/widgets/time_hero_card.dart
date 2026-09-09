import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// 首页右上角大时间卡，与天气卡成对出现。
///
/// 显示当前时间（大字号）、日期与星期。尺寸由父级决定，推荐与天气卡等高。
class TimeHeroCard extends StatefulWidget {
  const TimeHeroCard({super.key});

  @override
  State<TimeHeroCard> createState() => _TimeHeroCardState();
}

class _TimeHeroCardState extends State<TimeHeroCard> {
  Timer? _timer;
  DateTime _now = DateTime.now();
  bool _focused = false;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (mounted) setState(() => _now = DateTime.now());
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FocusableActionDetector(
      onShowFocusHighlight: (value) => setState(() => _focused = value),
      autofocus: false,
      shortcuts: const {
        SingleActivator(LogicalKeyboardKey.select): ActivateIntent(),
        SingleActivator(LogicalKeyboardKey.enter): ActivateIntent(),
        SingleActivator(LogicalKeyboardKey.gameButtonA): ActivateIntent(),
      },
      actions: <Type, Action<Intent>>{
        ActivateIntent: CallbackAction<ActivateIntent>(
          onInvoke: (_) {
            // 时间卡按下暂无特殊动作，可后续扩展为打开时钟/日历
            return null;
          },
        ),
      },
      child: LayoutBuilder(
        builder: (context, constraints) {
          final double w = constraints.maxWidth;
          final double h = constraints.maxHeight;
          final ThemeData theme = Theme.of(context);
          final Color accent = theme.colorScheme.primary;

          final String time = '${_now.hour.toString().padLeft(2, '0')}:${_now.minute.toString().padLeft(2, '0')}';
          final String date = '${_now.month}月${_now.day}日';
          final String weekday = _weekdayName(_now.weekday);

          return AnimatedScale(
            scale: _focused ? 1.03 : 1.0,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOutCubic,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Colors.black.withOpacity(_focused ? 0.55 : 0.38),
                border: Border.all(
                  color: _focused ? accent : Colors.white.withOpacity(0.10),
                  width: _focused ? 2.5 : 1.0,
                ),
                boxShadow: [
                  BoxShadow(
                    color: _focused
                        ? accent.withOpacity(0.35)
                        : Colors.black.withOpacity(0.35),
                    blurRadius: _focused ? 20 : 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(w * 0.08, h * 0.10, w * 0.08, h * 0.10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          time,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: h * 0.45,
                            fontWeight: FontWeight.w700,
                            height: 1.0,
                            shadows: const [
                              Shadow(color: Colors.black54, blurRadius: 12, offset: Offset(0, 2)),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: h * 0.06),
                      Text(
                        '$date  $weekday',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.85),
                          fontSize: h * 0.16,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  String _weekdayName(int weekday) {
    const names = ['周一', '周二', '周三', '周四', '周五', '周六', '周日'];
    return names[weekday - 1];
  }
}
