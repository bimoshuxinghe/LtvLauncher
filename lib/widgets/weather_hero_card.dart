import 'dart:async';

import 'package:flauncher/models/weather_data.dart';
import 'package:flauncher/providers/settings_service.dart';
import 'package:flauncher/providers/weather_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

/// 艾蒙顿桌面风格的首页大卡（对应其 view_home_page_card：592×333）。
///
/// 有天气数据时显示：左侧超大温度数字 + 天气描述 + 城市，右侧大天气图标；
/// 没有天气数据时降级为时钟卡（大号时间 + 日期）。
/// 尺寸由父级决定，推荐宽 = 屏宽 31%（592/1920），高 = 宽 × 9/16。
class WeatherHeroCard extends StatefulWidget {
  const WeatherHeroCard({super.key});

  @override
  State<WeatherHeroCard> createState() => _WeatherHeroCardState();
}

class _WeatherHeroCardState extends State<WeatherHeroCard> {
  Timer? _clockTimer;
  DateTime _now = DateTime.now();
  bool _focused = false;

  @override
  void initState() {
    super.initState();
    // 时钟兜底显示需要每分钟刷新
    _clockTimer = Timer.periodic(const Duration(seconds: 30), (_) {
      if (mounted) setState(() => _now = DateTime.now());
    });
  }

  @override
  void dispose() {
    _clockTimer?.cancel();
    super.dispose();
  }

  void _openWeatherSettings(BuildContext context) {
    // 选中天气卡时打开状态栏设置（可切换城市）
    // 这里仅留下回调位，实际通过设置页切换天气城市
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherService>(
      builder: (context, weatherService, _) {
        final WeatherData? weather = weatherService.weatherData;

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
              onInvoke: (_) => _openWeatherSettings(context),
            ),
          },
          child: GestureDetector(
            onTap: () => _openWeatherSettings(context),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final double w = constraints.maxWidth;
                final double h = constraints.maxHeight;
                final ThemeData theme = Theme.of(context);
                final Color accent = theme.colorScheme.primary;

                return AnimatedScale(
                  scale: _focused ? 1.04 : 1.0,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeOutCubic,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      // 仿截图：蓝色半透明渐变底
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          const Color(0xFF1E88E5).withOpacity(_focused ? 0.85 : 0.72),
                          const Color(0xFF0D47A1).withOpacity(_focused ? 0.75 : 0.62),
                        ],
                      ),
                      border: Border.all(
                        color: _focused ? accent : Colors.white.withOpacity(0.20),
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
                        padding: EdgeInsets.fromLTRB(w * 0.05, h * 0.08, w * 0.05, h * 0.08),
                        child: weather != null
                            ? _weatherContent(context, weather, w, h)
                            : _clockContent(context, w, h),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  /// 天气卡：左上大号温度 + 描述，右上大图标，底部城市行
  Widget _weatherContent(BuildContext context, WeatherData weather, double w, double h) {
    final SettingsService settings = context.read<SettingsService>();
    final String temp = weather.formatTemperature(useFahrenheit: settings.useFahrenheit);
    final IconData icon = weather.getConditionIcon();

    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 大号温度（艾蒙顿 textSize 100 ≈ 卡高的 30%）
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                temp,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: h * 0.30,
                  fontWeight: FontWeight.w700,
                  height: 1.0,
                  shadows: const [
                    Shadow(color: Colors.black54, blurRadius: 12, offset: Offset(0, 2)),
                  ],
                ),
              ),
            ),
            SizedBox(height: h * 0.02),
            // 天气描述（如「阴，多云」）
            if (weather.currentCondition != null && weather.currentCondition!.isNotEmpty)
              Text(
                weather.currentCondition!,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.85),
                  fontSize: h * 0.115,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            const Spacer(),
            // 底部：定位图标 + 城市
            Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  size: h * 0.11,
                  color: Colors.white.withOpacity(0.6),
                ),
                SizedBox(width: w * 0.02),
                Expanded(
                  child: Text(
                    weather.location ?? '',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontSize: h * 0.10,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
        // 右侧大天气图标（艾蒙顿 200×200 ≈ 卡宽 34%）
        Positioned(
          right: 0,
          top: h * 0.16,
          child: Icon(
            icon,
            size: w * 0.34,
            color: Colors.white.withOpacity(0.92),
          ),
        ),
      ],
    );
  }

  /// 无天气数据时：时钟卡兜底
  Widget _clockContent(BuildContext context, double w, double h) {
    final String time = '${_now.hour.toString().padLeft(2, '0')}:${_now.minute.toString().padLeft(2, '0')}';
    final String date = '${_now.month}/${_now.day}  ${_weekday(context)}';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          time,
          style: TextStyle(
            color: Colors.white,
            fontSize: h * 0.30,
            fontWeight: FontWeight.w700,
            height: 1.0,
            shadows: const [
              Shadow(color: Colors.black54, blurRadius: 12, offset: Offset(0, 2)),
            ],
          ),
        ),
        SizedBox(height: h * 0.03),
        Text(
          date,
          style: TextStyle(
            color: Colors.white.withOpacity(0.8),
            fontSize: h * 0.115,
            fontWeight: FontWeight.w500,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  String _weekday(BuildContext context) {
    const names = ['周一', '周二', '周三', '周四', '周五', '周六', '周日'];
    return names[_now.weekday - 1];
  }
}
