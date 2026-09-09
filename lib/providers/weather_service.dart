import 'dart:async';
import 'dart:convert';
import 'dart:developer' as developer;
import 'dart:io';

import 'package:flauncher/flauncher_channel.dart';
import 'package:flauncher/models/weather_data.dart';
import 'package:flauncher/providers/settings_service.dart';
import 'package:flutter/foundation.dart';

/// 国内天气服务（中国天气网）。
///
/// 默认使用北京城市代码（101010100），用户可在设置里切换其它预设城市。
/// 每 30 分钟自动刷新一次，也支持手动 [refresh]。
class WeatherService extends ChangeNotifier {
  final FLauncherChannel _channel;
  final SettingsService _settingsService;
  Timer? _refreshTimer;
  StreamSubscription<dynamic>? _subscription;

  WeatherData? _weatherData;
  bool _isBreezyInstalled = false;
  bool _initialized = false;
  String? _lastError;

  WeatherService(this._channel, this._settingsService) {
    _init();
  }

  WeatherData? get weatherData => _weatherData;
  bool get isBreezyInstalled => _isBreezyInstalled;
  bool get initialized => _initialized;
  bool get hasWeather => _weatherData != null;
  String? get lastError => _lastError;

  Future<void> _init() async {
    try {
      _isBreezyInstalled = await _channel.isBreezyWeatherInstalled();
      // 兼容：如果设备上仍安装了 Breezy Weather，先尝试读取其数据兜底
      final latestJson = await _channel.getLatestWeatherData();
      if (latestJson != null && latestJson.isNotEmpty) {
        _processWeatherJson(latestJson);
      }

      _subscription = _channel.addWeatherChangedListener((event) {
        if (event is String && event.isNotEmpty) {
          _processWeatherJson(event);
        }
      });

      // 立即拉取国内天气
      await refresh();

      // 每 30 分钟刷新一次
      _refreshTimer = Timer.periodic(const Duration(minutes: 30), (_) {
        refresh();
      });

      // 监听城市代码变化，变化后立即刷新
      _settingsService.addListener(_onSettingsChanged);
    } catch (e, stack) {
      developer.log("Error initializing WeatherService", error: e, stackTrace: stack);
      _lastError = e.toString();
    } finally {
      _initialized = true;
      notifyListeners();
    }
  }

  void _onSettingsChanged() {
    refresh();
  }

  void _processWeatherJson(String jsonString) {
    try {
      _weatherData = WeatherData.fromJsonString(jsonString);
      _lastError = null;
      notifyListeners();
    } catch (e, stack) {
      developer.log("Failed to parse weather JSON", error: e, stackTrace: stack);
    }
  }

  Future<bool> openBreezyWeather() async {
    try {
      return await _channel.openBreezyWeather();
    } catch (e) {
      return false;
    }
  }

  Future<void> refresh() async {
    try {
      _isBreezyInstalled = await _channel.isBreezyWeatherInstalled();
      final data = await _fetchChinaWeather(_settingsService.weatherCityCode);
      if (data != null) {
        _weatherData = data;
        _lastError = null;
      }
    } catch (e, stack) {
      developer.log("Failed to fetch Chinese weather", error: e, stackTrace: stack);
      _lastError = e.toString();
    } finally {
      notifyListeners();
    }
  }

  /// 从中国天气网拉取实况天气。
  ///
  /// 接口示例（需带 Referer）：
  ///   http://d1.weather.com.cn/sk_2d/101010100.html?_={timestamp}
  /// 返回 `var dataSK = {...}` 的 JSONP 格式。
  static Future<WeatherData?> _fetchChinaWeather(String cityCode) async {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final url = Uri.parse('http://d1.weather.com.cn/sk_2d/$cityCode.html?_=$timestamp');

    final client = HttpClient();
    try {
      final request = await client.getUrl(url);
      request.headers.set('Referer', 'http://www.weather.com.cn/');
      request.headers.set('User-Agent', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36');
      final response = await request.close();

      if (response.statusCode != 200) {
        throw HttpException('HTTP ${response.statusCode}', uri: url);
      }

      final bytes = await response.expand((e) => e).toList();
      final body = utf8.decode(bytes);

      // 返回体形如：var dataSK = {...}
      final start = body.indexOf('{');
      final end = body.lastIndexOf('}');
      if (start == -1 || end == -1 || end <= start) {
        throw FormatException('Unexpected weather response format');
      }

      final json = jsonDecode(body.substring(start, end + 1)) as Map<String, dynamic>;
      return _parseChinaWeather(cityCode, json);
    } finally {
      client.close();
    }
  }

  static WeatherData _parseChinaWeather(String cityCode, Map<String, dynamic> json) {
    final cityName = json['cityname'] as String? ?? json['city'] as String? ?? cityCode;
    final tempString = json['temp']?.toString();
    final temp = tempString != null ? int.tryParse(tempString) : null;
    final weather = json['weather'] as String?;
    final weatherCode = json['weathercode'] as String?;

    // 把中国天气网天气描述映射到一个伪 conditionCode，用于图标选择兜底
    final int conditionCode = _mapWeatherCode(weather, weatherCode);

    return WeatherData(
      location: cityName,
      currentTemp: temp,
      currentCondition: weather,
      currentConditionCode: conditionCode,
      currentHumidity: _parseHumidity(json['SD']?.toString()),
      windSpeed: _parseWindSpeed(json['WS']?.toString()),
      forecasts: const [],
    );
  }

  static int _parseHumidity(String? value) {
    if (value == null) return 0;
    final digits = RegExp(r'\d+').stringMatch(value);
    return digits != null ? int.tryParse(digits) ?? 0 : 0;
  }

  static double _parseWindSpeed(String? value) {
    if (value == null) return 0.0;
    // 示例："3级" 或 "3-4级"
    final match = RegExp(r'(\d+)').firstMatch(value);
    if (match == null) return 0.0;
    return double.tryParse(match.group(1)!) ?? 0.0;
  }

  /// 把中国天气现象映射到 WeatherData 能识别的伪代码。
  /// 图标优先按中文描述匹配，这些代码仅用于兜底分支。
  static int _mapWeatherCode(String? weather, String? weatherCode) {
    if (weather == null) return 801;
    final w = weather.toLowerCase();
    if (w.contains('晴')) return 800;
    if (w.contains('多云')) return 801;
    if (w.contains('阴')) return 803;
    if (w.contains('雨') || w.contains('雨夹雪')) return 500;
    if (w.contains('雪') || w.contains('冰雹')) return 600;
    if (w.contains('雷') || w.contains('暴')) return 200;
    if (w.contains('雾') || w.contains('霾')) return 741;
    if (weatherCode != null && weatherCode.startsWith('d')) {
      return 800; // 日间默认晴
    }
    return 801;
  }

  @override
  void dispose() {
    _subscription?.cancel();
    _refreshTimer?.cancel();
    _settingsService.removeListener(_onSettingsChanged);
    super.dispose();
  }
}
