import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class AppLocalizationsUk extends AppLocalizations {
  AppLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get aboutFlauncher => 'Про LTvLauncher';

  @override
  String get addCategory => 'Додати категорію';

  @override
  String get addSection => 'Додати розділ';

  @override
  String get alphabetical => 'За алфавітом';

  @override
  String get appCardHighlightAnimation => 'Анімація виділення картки застосунку';

  @override
  String get appInfo => 'Інформація про застосунок';

  @override
  String get appKeyClick => 'Звук клацання при натисканні клавіші';

  @override
  String get applications => 'Застосунки';

  @override
  String get autoHideAppBar => 'Автоматично приховувати рядок стану';

  @override
  String get backButtonAction => 'Дія кнопки «Назад»';

  @override
  String get category => 'Категорія';

  @override
  String get categories => 'Категорії';

  @override
  String get columnCount => 'Кількість стовпців';

  @override
  String get date => 'Дата';

  @override
  String get dateAndTimeFormat => 'Формат дати й часу';

  @override
  String get delete => 'Видалити';

  @override
  String get dialogOptionBackButtonActionDoNothing => 'Нічого не робити';

  @override
  String get dialogOptionBackButtonActionShowScreensaver => 'Показати заставку';

  @override
  String get dialogOptionBackButtonActionShowClock => 'Показати годинник';

  @override
  String get dialogTextNoFileExplorer => 'Будь ласка, встановіть файловий менеджер, щоб вибрати зображення.';

  @override
  String get dialogTitleBackButtonAction => 'Виберіть дію кнопки «Назад»';

  @override
  String disambiguateCategoryTitle(String title) {
    return '$title (Категорія)';
  }

  @override
  String formattedDate(String dateString) {
    return 'Формат дати: $dateString';
  }

  @override
  String formattedTime(String timeString) {
    return 'Формат часу: $timeString';
  }

  @override
  String get gradient => 'Градієнт';

  @override
  String get favoriteApps => 'Улюблені застосунки';

  @override
  String get grid => 'Сітка';

  @override
  String get height => 'Висота';

  @override
  String get hide => 'Приховати';

  @override
  String get hiddenApplications => 'Приховані застосунки';

  @override
  String get launcherSections => 'Розділи';

  @override
  String get layout => 'Розташування';

  @override
  String get loading => 'Завантаження';

  @override
  String get manual => 'Вручну';

  @override
  String get modifySection => 'Змінити розділ';

  @override
  String get mustNotBeEmpty => 'Не повинно бути порожнім';

  @override
  String get name => 'Назва';

  @override
  String get newSection => 'Новий розділ';

  @override
  String get noDateFormatSpecified => 'Формат дати не вказано';

  @override
  String get noTimeFormatSpecified => 'Формат часу не вказано';

  @override
  String get nonTvApplications => 'Застосунки не для ТБ';

  @override
  String get open => 'Відкрити';

  @override
  String get orSelectFormatSpecifiers => 'Або виберіть специфікатори формату';

  @override
  String get picture => 'Зображення';

  @override
  String removeFrom(String name) {
    return 'Видалити з $name';
  }

  @override
  String get renameCategory => 'Перейменувати категорію';

  @override
  String get reorder => 'Змінити порядок';

  @override
  String get row => 'Рядок';

  @override
  String get rowHeight => 'Висота рядка';

  @override
  String get save => 'Зберегти';

  @override
  String get spacer => 'Роздільник';

  @override
  String get spacerMaxHeightRequirement => 'Має бути більше 0 і не більше 500';

  @override
  String get statusBar => 'Рядок стану';

  @override
  String get settings => 'Налаштування';

  @override
  String get show => 'Показати';

  @override
  String get showCategoryTitles => 'Показувати назви категорій';

  @override
  String get themes => 'Теми';

  @override
  String get hideHighlightOutlineOnHomescreen => 'Приховати контур виділення на головному екрані';

  @override
  String get appSelectorTransitionAnimation => 'Анімація переходу вибору застосунку';

  @override
  String get sort => 'Сортування';

  @override
  String get systemSettings => 'Системні налаштування';

  @override
  String textAboutDialog(String repoUrl) {
    return 'LTvLauncher — це налаштований лаунчер з відкритим кодом для Android TV, створений на основі FLauncher.\n\nРозроблено LeanBitLab.\nВихідний код доступний за адресою $repoUrl.';
  }

  @override
  String get textEmptyCategory => 'Ця категорія порожня.';

  @override
  String get time => 'Час';

  @override
  String get titleStatusBarSettingsPage => 'Виберіть, що відображати в рядку стану';

  @override
  String get tvApplications => 'Застосунки для ТБ';

  @override
  String get type => 'Тип';

  @override
  String get typeInTheDateFormat => 'Введіть формат дати';

  @override
  String get typeInTheHourFormat => 'Введіть формат часу';

  @override
  String get uninstall => 'Видалити';

  @override
  String get wallpaper => 'Шпалери';

  @override
  String get withEllipsisAddTo => 'Додати до...';

  @override
  String get timeBasedWallpaper => 'Шпалери залежно від часу';

  @override
  String get pickDayWallpaper => 'Вибрати денні шпалери';

  @override
  String get pickNightWallpaper => 'Вибрати нічні шпалери';

  @override
  String get accessibility => 'Спеціальні можливості';

  @override
  String get defaultLauncherIsDefault => 'LTvLauncher є лаунчером за замовчуванням';

  @override
  String get defaultLauncherNotDefault => 'LTvLauncher не є лаунчером за замовчуванням';

  @override
  String get setAsDefaultLauncher => 'Встановити як лаунчер за замовчуванням';

  @override
  String get defaultLauncherDescription => 'Якщо встановлено як лаунчер за замовчуванням, кнопка «Домівка» завжди повертатиме до LTvLauncher. Телевізор також завантажуватиметься одразу в LTvLauncher.';

  @override
  String get inputs => 'Джерела сигналу';

  @override
  String get inputSources => 'Джерела сигналу';

  @override
  String get backupAndRestore => 'Резервне копіювання та відновлення';

  @override
  String get exportBackup => 'Експортувати резервну копію';

  @override
  String get importBackup => 'Імпортувати резервну копію';

  @override
  String exportSuccess(String path) {
    return 'Резервну копію успішно експортовано до $path';
  }

  @override
  String get importSuccess => 'Резервну копію успішно імпортовано';

  @override
  String get importConfirm => 'Ви впевнені, що хочете імпортувати резервну копію? Це замінить поточні налаштування та розташування.';

  @override
  String importError(String error) {
    return 'Не вдалося імпортувати резервну копію: $error';
  }

  @override
  String exportError(String error) {
    return 'Не вдалося експортувати резервну копію: $error';
  }

  @override
  String get shareBackup => 'Поділитися резервною копією';

  @override
  String get shareBackupDescription => 'Поділитися резервною копією з іншими пристроями в локальній мережі';

  @override
  String get stopSharing => 'Зупинити спільний доступ';

  @override
  String get localNetworkSharingActive => 'Спільний доступ у локальній мережі активний!';

  @override
  String get localNetworkSharingInstructions => 'Підключіть інший пристрій до тієї самої мережі Wi-Fi та відкрийте таку адресу у веббраузері:';

  @override
  String get localNetworkSharingDetails => 'Тут ви можете завантажити налаштування/розташування вашого ТБ або вивантажити файл резервної копії назад на цей телевізор.';

  @override
  String failedToStartServer(String error) {
    return 'Не вдалося запустити сервер спільного доступу: $error';
  }

  @override
  String get notificationBell => 'Дзвіночок сповіщень';

  @override
  String get autoHideNotificationBell => 'Автоматично приховувати дзвіночок сповіщень';

  @override
  String get continueWatching => 'Продовжити перегляд';

  @override
  String get showContinueWatchingOnHome => 'Показувати «Продовжити перегляд» на головному екрані';

  @override
  String get permissionDeniedContinueWatching => 'Потрібен дозвіл для показу «Продовжити перегляд»';

  @override
  String get interface => 'Інтерфейс';

  @override
  String get system => 'Система';

  @override
  String get accentColor => 'Акцентний колір';

  @override
  String get miscellaneous => 'Інше';

  @override
  String get brightnessScheduler => 'Розклад яскравості';

  @override
  String get screensaverSettings => 'Налаштування заставки';

  @override
  String get screensaverClockStyle => 'Стиль годинника заставки';

  @override
  String get dataUsagePeriod => 'Період використання даних';

  @override
  String get notificationAccess => 'Доступ до сповіщень';

  @override
  String get granted => 'Надано';

  @override
  String get permissionRequired => 'Потрібен дозвіл';

  @override
  String get systemWidePopupAlert => 'Спливне сповіщення в системі';

  @override
  String get overlayPermissionRequired => 'Потрібен дозвіл на накладання';

  @override
  String get enabled => 'Увімкнено';

  @override
  String get disabled => 'Вимкнено';

  @override
  String get showAppNamesBelowIcons => 'Показувати назви застосунків під іконками';

  @override
  String get dataUsage => 'Використання даних';

  @override
  String get networkIndicator => 'Індикатор мережі';

  @override
  String get homeButtonFix => 'Виправлення кнопки «Домівка» (Google TV)';

  @override
  String get appLanguage => 'Мова';

  @override
  String get systemDefault => 'Системна мова за замовчуванням';

  @override
  String get english => 'Англійська';

  @override
  String get spanish => 'Іспанська';

  @override
  String get ukrainian => 'Українська';

  @override
  String get chinese => 'Китайська';

  @override
  String get french => 'Французька';

  @override
  String get german => 'Німецька';

  @override
  String get japanese => 'Японська';

  @override
  String get portuguese => 'Португальська';

  @override
  String get russian => 'Російська';

  @override
  String get italian => 'Італійська';

  @override
  String get hindi => 'Гінді';

  @override
  String get korean => 'Корейська';

  @override
  String get arabic => 'Арабська';

  @override
  String get turkish => 'Турецька';

  @override
  String get hidePersistentNotifications => 'Приховати постійні сповіщення';

  @override
  String get hidePersistentNotificationsDesc => 'Приховувати фонові та системні сповіщення';

  @override
  String get blockedNotificationApps => 'Заблоковані додатки';

  @override
  String get blockAppNotifications => 'Блокувати сповіщення';

  @override
  String get unblockAppNotifications => 'Розблокувати сповіщення';

  @override
  String get noBlockedApps => 'Немає заблокованих додатків';

  @override
  String get persistentNotification => 'Постійне';

  @override
  String get unblockAll => 'Розблокувати все';

  @override
  String get weather => 'Погода';

  @override
  String get showWeatherWarnings => 'Показувати сповіщення про погоду та дощ';

  @override
  String get temperatureUnit => 'Одиниця температури';

  @override
  String get celsius => 'Цельсій (°C)';

  @override
  String get fahrenheit => 'Фаренгейт (°F)';

  @override
  String get breezyWeatherSetupHint => 'Встановіть Breezy Weather та увімкніть \'Локальний обмін даними\' / \'Gadgetbridge\' у налаштуваннях для перегляду погоди та попереджень про дощ.';

  @override
  String get weatherCity => 'Weather city';

  @override
  String get noApplications => 'No applications available';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'Cancel';

  @override
  String get addToCategory => 'Add to Category';

  @override
  String get setCustomBanner => 'Set Custom Banner';

  @override
  String get clearCustomBanner => 'Clear Custom Banner';

  @override
  String setBannerFailed(String error) {
    return 'Failed to set banner: $error';
  }

  @override
  String clearBannerFailed(String error) {
    return 'Failed to clear banner: $error';
  }

  @override
  String get grantUsagePermission => 'Grant Usage Permission';

  @override
  String get accessibilityPermission => 'Accessibility Permission';

  @override
  String get shareFailed => 'Share Failed';

  @override
  String shareBackupFailed(String error) {
    return 'Failed to share backup: $error';
  }

  @override
  String get exportSuccessTitle => 'Export Success';

  @override
  String get exportFailedTitle => 'Export Failed';

  @override
  String get noBackupFilesFound => 'No backup files found.';

  @override
  String get importFailed => 'Import Failed';

  @override
  String get brightnessAdbPermissionHint => 'To control brightness on this device, you must grant permission via ADB:';

  @override
  String get grantPermission => 'Grant Permission';

  @override
  String get checkStatus => 'Check Status';

  @override
  String get overlayPermission => 'Overlay Permission';

  @override
  String get customName => 'Custom Name';

  @override
  String get lastUsed => 'Last Used';

  @override
  String get clearAll => 'Clear All';

  @override
  String get dismiss => 'Dismiss';

  @override
  String errorLoadingBackups(String error) {
    return 'Error loading backups: $error';
  }

  @override
  String get addToFavorites => 'Add to Fav';

  @override
  String get removeFromFavorites => 'Remove from Fav';

  @override
  String get selectedAccent => 'Selected Accent';

  @override
  String get accessibilityPermissionGuide => 'On this device, the Accessibility settings screen could not be opened automatically.\n\nTo enable Home Button Fix, you can grant permission manually by running this ADB command from a computer connected to the TV:';

  @override
  String get enableScheduler => 'Enable Scheduler';

  @override
  String get brightnessExperimentalNote => 'EXPERIMENTAL: This feature is untested and may be removed in future versions based on user feedback.';

  @override
  String get brightnessSupportNote => 'Note: Some Android TV devices may not support app-level brightness control.';

  @override
  String get developedBy => 'Developed by LeanBitLab';

  @override
  String get close => 'Close';

  @override
  String get sponsorProject => 'Sponsor Project';

  @override
  String get sourceCode => 'Source Code';

  @override
  String get notificationAccessGuide => 'On this device, the Notification Access settings screen could not be opened automatically.\n\nTo enable notifications, you can grant permission manually by running this ADB command from a computer connected to the TV:';

  @override
  String get overlayPermissionGuide => 'On this device, the Overlay Permission settings screen could not be opened automatically.\n\nTo enable overlay popups, you can grant permission manually by running this ADB command from a computer connected to the TV:';

  @override
  String get noInputsDetected => 'No inputs detected';

  @override
  String get notifications => 'Notifications';

  @override
  String get allCaughtUp => 'All caught up!';

  @override
  String get continueWatchingAdbHint => 'ADB grant required for Continue Watching:';

  @override
  String get dataUsageWeekly => 'Weekly: ';

  @override
  String get dataUsageMonthly => 'Monthly: ';

  @override
  String get dataUsageDaily => 'Daily: ';

  @override
  String currentLabel(String value) {
    return 'Current: $value';
  }

  @override
  String get noApplicationsFound => 'No applications found';

  @override
  String get selectAName => 'Select a name';

  @override
  String get customPreset => 'Custom...';

  @override
  String get invalidDateFormat => 'Invalid format';

  @override
  String get selectFormatsBelow => 'Select formats below';

  @override
  String get backupShareText => 'LTvLauncher Backup';

  @override
  String get homeButtonFixHint => 'If you are using Google TV, enable \"Home Button Fix\" under Accessibility settings to make the Home button open this launcher.';

  @override
  String get presetTvApps => 'TV Apps';

  @override
  String get presetNonTvApps => 'Non-TV Apps';

  @override
  String get presetMoviesShows => 'Movies & Shows';

  @override
  String get presetMusic => 'Music';

  @override
  String get presetGames => 'Games';

  @override
  String get presetEntertainment => 'Entertainment';

  @override
  String get presetLiveTv => 'Live TV';

  @override
  String get presetSports => 'Sports';

  @override
  String get presetNews => 'News';

  @override
  String get presetTools => 'Tools';

  @override
  String get presetFavorites => 'Favorites';

  @override
  String get colorRed => 'Red';

  @override
  String get colorCyan => 'Cyan';

  @override
  String get colorIndigo => 'Indigo';

  @override
  String get colorLime => 'Lime';

  @override
  String get colorAmber => 'Amber';

  @override
  String get colorRose => 'Rose';

  @override
  String get colorIceBlue => 'Ice Blue';

  @override
  String get clockStyleMinimal => 'Minimal';

  @override
  String get clockStyleMinimalDesc => 'Thin, elegant font (Default)';

  @override
  String get clockStyleBold => 'Bold';

  @override
  String get clockStyleBoldDesc => 'Thick, highly visible font';

  @override
  String get clockStyleRetro => 'Retro';

  @override
  String get clockStyleRetroDesc => 'Monospaced, retro terminal style';

  @override
  String get clockStyleElegant => 'Elegant';

  @override
  String get clockStyleElegantDesc => 'Classic serif typeface';

  @override
  String get clockStyleNeon => 'Neon';

  @override
  String get clockStyleNeonDesc => 'Ultra-thin, glowing style';

  @override
  String get clockStylePixel => 'Pixel';

  @override
  String get clockStylePixelDesc => 'Bold monospaced, arcade feel';

  @override
  String get clockStyleDigital => 'Digital';

  @override
  String get clockStyleDigitalDesc => 'Clean monospaced display';

  @override
  String get gradGreatWhale => 'Great Whale';

  @override
  String get gradViciousStance => 'Vicious Stance';

  @override
  String get gradTeenNotebook => 'Teen Notebook';

  @override
  String get gradOldHat => 'Old Hat';

  @override
  String get gradBurningSpring => 'Burning Spring';

  @override
  String get gradDesertHump => 'Desert Hump';

  @override
  String get gradFarawayRiver => 'Faraway River';

  @override
  String get gradSaintPetersburg => 'Saint Petersburg';

  @override
  String get gradAfricanField => 'African Field';

  @override
  String get gradGrassShampoo => 'Grass Shampoo';

  @override
  String get gradPitchBlack => 'Pitch Black';

  @override
  String get weatherRain => 'Rain';

  @override
  String get weatherSnow => 'Snow';

  @override
  String get weatherStorm => 'Storm';

  @override
  String get weatherToday => 'today';

  @override
  String get weatherTomorrow => 'tomorrow';

  @override
  String get weatherDayMon => 'Mon';

  @override
  String get weatherDayTue => 'Tue';

  @override
  String get weatherDayWed => 'Wed';

  @override
  String get weatherDayThu => 'Thu';

  @override
  String get weatherDayFri => 'Fri';

  @override
  String get weatherDaySat => 'Sat';

  @override
  String get weatherDaySun => 'Sun';

  @override
  String get noBackupDirectory => 'Could not find any suitable directory for backup';

  @override
  String backupFileNotFound(String path) {
    return 'Backup file not found at $path';
  }

  @override
  String get invalidBackupVersion => 'Invalid backup file version';

  @override
  String get tabHome => 'Home';

  @override
  String get tabApps => 'Apps';

  @override
  String get tabInputs => 'Inputs';

  @override
  String get allApps => 'All Apps';

  @override
  String get cardSize => 'Card Size';

  @override
  String get cardSizeFollow => 'Follow section';

  @override
  String get cardSizeSmall => 'Small';

  @override
  String get cardSizeMedium => 'Medium';

  @override
  String get cardSizeLarge => 'Large';

  @override
  String get featured => 'Featured';

  @override
  String get showFeaturedRow => 'Featured cards';

  @override
  String get showFeaturedRowDescription => 'Show a row of large cards on the home tab';

  @override
  String get more => 'Більше';
}
