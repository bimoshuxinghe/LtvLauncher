import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get aboutFlauncher => '关于 LTvLauncher';

  @override
  String get addCategory => '添加类别';

  @override
  String get addSection => '添加分区';

  @override
  String get alphabetical => '按字母顺序';

  @override
  String get appCardHighlightAnimation => '应用卡片高亮动画';

  @override
  String get appInfo => '应用信息';

  @override
  String get appKeyClick => '按键提示音';

  @override
  String get applications => '应用';

  @override
  String get autoHideAppBar => '自动隐藏顶栏';

  @override
  String get backButtonAction => '返回键行为';

  @override
  String get category => '类别';

  @override
  String get categories => '类别';

  @override
  String get columnCount => '列数';

  @override
  String get date => '日期';

  @override
  String get dateAndTimeFormat => '日期和时间格式';

  @override
  String get delete => '删除';

  @override
  String get dialogOptionBackButtonActionDoNothing => '无操作';

  @override
  String get dialogOptionBackButtonActionShowScreensaver => '显示屏保';

  @override
  String get dialogOptionBackButtonActionShowClock => '显示时钟';

  @override
  String get dialogTextNoFileExplorer => '请安装文件管理器以选择图片。';

  @override
  String get dialogTitleBackButtonAction => '选择返回键行为';

  @override
  String disambiguateCategoryTitle(String title) {
    return '$title（类别）';
  }

  @override
  String formattedDate(String dateString) {
    return '格式化日期：$dateString';
  }

  @override
  String formattedTime(String timeString) {
    return '格式化时间：$timeString';
  }

  @override
  String get gradient => '渐变';

  @override
  String get favoriteApps => '收藏应用';

  @override
  String get grid => '网格';

  @override
  String get height => '高度';

  @override
  String get hide => '隐藏';

  @override
  String get hiddenApplications => '已隐藏应用';

  @override
  String get launcherSections => '分区';

  @override
  String get layout => '布局';

  @override
  String get loading => '加载中';

  @override
  String get manual => '手动';

  @override
  String get modifySection => '修改分区';

  @override
  String get mustNotBeEmpty => '不能为空';

  @override
  String get name => '名称';

  @override
  String get newSection => '新建分区';

  @override
  String get noDateFormatSpecified => '未指定日期格式';

  @override
  String get noTimeFormatSpecified => '未指定时间格式';

  @override
  String get nonTvApplications => '非电视应用';

  @override
  String get open => '打开';

  @override
  String get orSelectFormatSpecifiers => '或选择格式说明符';

  @override
  String get picture => '图片';

  @override
  String removeFrom(String name) {
    return '从$name中移除';
  }

  @override
  String get renameCategory => '重命名类别';

  @override
  String get reorder => '重新排序';

  @override
  String get row => '行';

  @override
  String get rowHeight => '行高';

  @override
  String get save => '保存';

  @override
  String get spacer => '间隔';

  @override
  String get spacerMaxHeightRequirement => '必须大于 0 且小于等于 500';

  @override
  String get statusBar => '状态栏';

  @override
  String get settings => '设置';

  @override
  String get show => '显示';

  @override
  String get showCategoryTitles => '显示类别标题';

  @override
  String get themes => '主题';

  @override
  String get hideHighlightOutlineOnHomescreen => '在主屏幕隐藏高亮边框';

  @override
  String get appSelectorTransitionAnimation => '应用选择器转场动画';

  @override
  String get sort => '排序';

  @override
  String get systemSettings => '系统设置';

  @override
  String textAboutDialog(String repoUrl) {
    return 'LTvLauncher 是一款基于 FLauncher 定制的开源 Android TV 桌面启动器。\n\n由 LeanBitLab 开发。\n源代码可在 $repoUrl 获取。';
  }

  @override
  String get textEmptyCategory => '此类别为空。';

  @override
  String get time => '时间';

  @override
  String get titleStatusBarSettingsPage => '选择状态栏中显示的内容';

  @override
  String get tvApplications => '电视应用';

  @override
  String get type => '类型';

  @override
  String get typeInTheDateFormat => '输入日期格式';

  @override
  String get typeInTheHourFormat => '输入时间格式';

  @override
  String get uninstall => '卸载';

  @override
  String get wallpaper => '壁纸';

  @override
  String get withEllipsisAddTo => '添加到…';

  @override
  String get timeBasedWallpaper => '按时间切换壁纸';

  @override
  String get pickDayWallpaper => '选择日间壁纸';

  @override
  String get pickNightWallpaper => '选择夜间壁纸';

  @override
  String get accessibility => '无障碍';

  @override
  String get defaultLauncherIsDefault => 'LTvLauncher 是默认桌面';

  @override
  String get defaultLauncherNotDefault => 'LTvLauncher 不是默认桌面';

  @override
  String get setAsDefaultLauncher => '设为默认桌面';

  @override
  String get defaultLauncherDescription => '设为默认桌面后，按 Home 键将始终返回 LTvLauncher。电视开机也会直接进入 LTvLauncher。';

  @override
  String get inputs => '输入源';

  @override
  String get inputSources => '输入源';

  @override
  String get backupAndRestore => '备份与恢复';

  @override
  String get exportBackup => '导出备份';

  @override
  String get importBackup => '导入备份';

  @override
  String exportSuccess(String path) {
    return '备份已成功导出到 $path';
  }

  @override
  String get importSuccess => '备份导入成功';

  @override
  String get importConfirm => '确定要导入备份吗？这将会覆盖你当前的设置和布局。';

  @override
  String importError(String error) {
    return '导入备份失败：$error';
  }

  @override
  String exportError(String error) {
    return '导出备份失败：$error';
  }

  @override
  String get shareBackup => '共享备份';

  @override
  String get shareBackupDescription => '与局域网中的其他设备共享备份';

  @override
  String get stopSharing => '停止共享';

  @override
  String get localNetworkSharingActive => '局域网共享已开启！';

  @override
  String get localNetworkSharingInstructions => '将另一台设备连接到同一 Wi-Fi 网络，并在浏览器中打开以下地址：';

  @override
  String get localNetworkSharingDetails => '你可以在此下载电视的设置/布局，或将备份文件上传回这台电视。';

  @override
  String failedToStartServer(String error) {
    return '启动共享服务失败：$error';
  }

  @override
  String get notificationBell => '通知铃铛';

  @override
  String get autoHideNotificationBell => '自动隐藏通知铃铛';

  @override
  String get continueWatching => '继续观看';

  @override
  String get showContinueWatchingOnHome => '在主页显示「继续观看」';

  @override
  String get permissionDeniedContinueWatching => '显示「继续观看」需要权限';

  @override
  String get interface => '界面';

  @override
  String get system => '系统';

  @override
  String get accentColor => '强调色';

  @override
  String get miscellaneous => '其他';

  @override
  String get brightnessScheduler => '亮度定时';

  @override
  String get screensaverSettings => '屏保设置';

  @override
  String get screensaverClockStyle => '屏保时钟样式';

  @override
  String get dataUsagePeriod => '数据使用周期';

  @override
  String get notificationAccess => '通知访问权限';

  @override
  String get granted => '已授予';

  @override
  String get permissionRequired => '需要权限';

  @override
  String get systemWidePopupAlert => '全局弹窗提醒';

  @override
  String get overlayPermissionRequired => '需要悬浮窗权限';

  @override
  String get enabled => '已启用';

  @override
  String get disabled => '已禁用';

  @override
  String get showAppNamesBelowIcons => '在图标下方显示应用名称';

  @override
  String get dataUsage => '数据使用';

  @override
  String get networkIndicator => '网络指示器';

  @override
  String get homeButtonFix => 'Home 键修复（Google TV）';

  @override
  String get appLanguage => '语言';

  @override
  String get systemDefault => '跟随系统';

  @override
  String get english => '英语';

  @override
  String get spanish => '西班牙语';

  @override
  String get ukrainian => '乌克兰语';

  @override
  String get chinese => '中文';

  @override
  String get french => '法语';

  @override
  String get german => '德语';

  @override
  String get japanese => '日语';

  @override
  String get portuguese => '葡萄牙语';

  @override
  String get russian => '俄语';

  @override
  String get italian => '意大利语';

  @override
  String get hindi => '印地语';

  @override
  String get korean => '韩语';

  @override
  String get arabic => '阿拉伯语';

  @override
  String get turkish => '土耳其语';

  @override
  String get hidePersistentNotifications => '隐藏常驻通知';

  @override
  String get hidePersistentNotificationsDesc => '隐藏后台服务和系统常驻通知';

  @override
  String get blockedNotificationApps => '已屏蔽的应用';

  @override
  String get blockAppNotifications => '屏蔽通知';

  @override
  String get unblockAppNotifications => '取消屏蔽通知';

  @override
  String get noBlockedApps => '暂无已屏蔽的应用';

  @override
  String get persistentNotification => '常驻';

  @override
  String get unblockAll => '全部取消屏蔽';

  @override
  String get weather => '天气';

  @override
  String get showWeatherWarnings => '显示降雨及天气预警';

  @override
  String get temperatureUnit => '温度单位';

  @override
  String get celsius => '摄氏度 (°C)';

  @override
  String get fahrenheit => '华氏度 (°F)';

  @override
  String get breezyWeatherSetupHint => '安装 Breezy Weather 并在其设置中开启「本地数据共享」/「Gadgetbridge」以显示天气和降雨预警。';

  @override
  String get ok => '确定';

  @override
  String get cancel => '取消';

  @override
  String get addToCategory => '添加到类别';

  @override
  String get setCustomBanner => '设置自定义横幅';

  @override
  String get clearCustomBanner => '清除自定义横幅';

  @override
  String setBannerFailed(String error) {
    return '设置横幅失败：$error';
  }

  @override
  String clearBannerFailed(String error) {
    return '清除横幅失败：$error';
  }

  @override
  String get grantUsagePermission => '授予用量访问权限';

  @override
  String get accessibilityPermission => '无障碍权限';

  @override
  String get shareFailed => '分享失败';

  @override
  String shareBackupFailed(String error) {
    return '分享备份失败：$error';
  }

  @override
  String get exportSuccessTitle => '导出成功';

  @override
  String get exportFailedTitle => '导出失败';

  @override
  String get noBackupFilesFound => '未找到备份文件。';

  @override
  String get importFailed => '导入失败';

  @override
  String get brightnessAdbPermissionHint => '要在该设备上调节亮度，必须通过 ADB 授予权限：';

  @override
  String get grantPermission => '授予权限';

  @override
  String get checkStatus => '检查状态';

  @override
  String get overlayPermission => '悬浮窗权限';

  @override
  String get customName => '自定义名称';

  @override
  String get lastUsed => '最近使用';

  @override
  String get clearAll => '全部清除';

  @override
  String get dismiss => '忽略';

  @override
  String errorLoadingBackups(String error) {
    return '加载备份失败：$error';
  }

  @override
  String get addToFavorites => '添加到收藏';

  @override
  String get removeFromFavorites => '从收藏移除';

  @override
  String get selectedAccent => '已选强调色';

  @override
  String get accessibilityPermissionGuide => '无法在此设备上自动打开无障碍设置界面。\n\n如需启用 Home 键修复，可在连接到电视的电脑上执行以下 ADB 命令手动授予权限：';

  @override
  String get enableScheduler => '启用定时';

  @override
  String get brightnessExperimentalNote => '实验性功能：该功能尚未经过充分测试，后续可能会根据用户反馈移除。';

  @override
  String get brightnessSupportNote => '注意：部分 Android TV 设备可能不支持应用级亮度调节。';

  @override
  String get developedBy => '由 LeanBitLab 开发';

  @override
  String get close => '关闭';

  @override
  String get sponsorProject => '赞助项目';

  @override
  String get sourceCode => '源代码';

  @override
  String get notificationAccessGuide => '无法在此设备上自动打开通知访问权限设置界面。\n\n如需启用通知功能，可在连接到电视的电脑上执行以下 ADB 命令手动授予权限：';

  @override
  String get overlayPermissionGuide => '无法在此设备上自动打开悬浮窗权限设置界面。\n\n如需启用悬浮窗提醒，可在连接到电视的电脑上执行以下 ADB 命令手动授予权限：';

  @override
  String get noInputsDetected => '未检测到输入源';

  @override
  String get notifications => '通知';

  @override
  String get allCaughtUp => '暂无新通知';

  @override
  String get continueWatchingAdbHint => '「继续观看」需要通过 ADB 授权：';

  @override
  String get dataUsageWeekly => '本周：';

  @override
  String get dataUsageMonthly => '本月：';

  @override
  String get dataUsageDaily => '今日：';

  @override
  String currentLabel(String value) {
    return '当前：$value';
  }

  @override
  String get noApplicationsFound => '未找到应用';

  @override
  String get selectAName => '选择名称';

  @override
  String get customPreset => '自定义…';

  @override
  String get invalidDateFormat => '格式无效';

  @override
  String get selectFormatsBelow => '请在下方选择格式';

  @override
  String get backupShareText => 'LTvLauncher 备份';

  @override
  String get homeButtonFixHint => '如果你使用的是 Google TV，请在「无障碍」设置中启用「Home 键修复」，按 Home 键才会打开本桌面。';

  @override
  String get presetTvApps => '电视应用';

  @override
  String get presetNonTvApps => '非电视应用';

  @override
  String get presetMoviesShows => '影视';

  @override
  String get presetMusic => '音乐';

  @override
  String get presetGames => '游戏';

  @override
  String get presetEntertainment => '娱乐';

  @override
  String get presetLiveTv => '直播电视';

  @override
  String get presetSports => '体育';

  @override
  String get presetNews => '新闻';

  @override
  String get presetTools => '工具';

  @override
  String get presetFavorites => '收藏';

  @override
  String get colorRed => '红色';

  @override
  String get colorCyan => '青色';

  @override
  String get colorIndigo => '靛蓝';

  @override
  String get colorLime => '青柠';

  @override
  String get colorAmber => '琥珀';

  @override
  String get colorRose => '玫红';

  @override
  String get colorIceBlue => '冰蓝';

  @override
  String get clockStyleMinimal => '极简';

  @override
  String get clockStyleMinimalDesc => '纤细优雅的字体（默认）';

  @override
  String get clockStyleBold => '粗体';

  @override
  String get clockStyleBoldDesc => '粗厚醒目的字体';

  @override
  String get clockStyleRetro => '复古';

  @override
  String get clockStyleRetroDesc => '等宽字体，复古终端风';

  @override
  String get clockStyleElegant => '优雅';

  @override
  String get clockStyleElegantDesc => '经典衬线字体';

  @override
  String get clockStyleNeon => '霓虹';

  @override
  String get clockStyleNeonDesc => '极细发光风格';

  @override
  String get clockStylePixel => '像素';

  @override
  String get clockStylePixelDesc => '粗体等宽，街机风格';

  @override
  String get clockStyleDigital => '数字';

  @override
  String get clockStyleDigitalDesc => '简洁等宽显示';

  @override
  String get gradGreatWhale => '巨鲸';

  @override
  String get gradViciousStance => '凛然';

  @override
  String get gradTeenNotebook => '青春笔记';

  @override
  String get gradOldHat => '旧草帽';

  @override
  String get gradBurningSpring => '炽春';

  @override
  String get gradDesertHump => '沙丘';

  @override
  String get gradFarawayRiver => '远河';

  @override
  String get gradSaintPetersburg => '圣彼得堡';

  @override
  String get gradAfricanField => '非洲原野';

  @override
  String get gradGrassShampoo => '青草';

  @override
  String get gradPitchBlack => '纯黑';

  @override
  String get weatherRain => '降雨';

  @override
  String get weatherSnow => '降雪';

  @override
  String get weatherStorm => '风暴';

  @override
  String get weatherToday => '今天';

  @override
  String get weatherTomorrow => '明天';

  @override
  String get weatherDayMon => '周一';

  @override
  String get weatherDayTue => '周二';

  @override
  String get weatherDayWed => '周三';

  @override
  String get weatherDayThu => '周四';

  @override
  String get weatherDayFri => '周五';

  @override
  String get weatherDaySat => '周六';

  @override
  String get weatherDaySun => '周日';

  @override
  String get noBackupDirectory => '找不到可用于存放备份的目录';

  @override
  String backupFileNotFound(String path) {
    return '在 $path 未找到备份文件';
  }

  @override
  String get invalidBackupVersion => '备份文件版本无效';

  @override
  String get tabHome => '首页';

  @override
  String get tabApps => '应用';

  @override
  String get tabInputs => '输入源';

  @override
  String get allApps => '全部应用';

  @override
  String get cardSize => '卡片尺寸';

  @override
  String get cardSizeFollow => '跟随分区设置';

  @override
  String get cardSizeSmall => '小';

  @override
  String get cardSizeMedium => '中';

  @override
  String get cardSizeLarge => '大';

  @override
  String get featured => '精选';

  @override
  String get showFeaturedRow => '首页大卡片';

  @override
  String get showFeaturedRowDescription => '在首页顶部显示一行大尺寸卡片';
}
