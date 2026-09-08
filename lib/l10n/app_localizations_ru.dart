import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get aboutFlauncher => 'О программе LTvLauncher';

  @override
  String get addCategory => 'Добавить категорию';

  @override
  String get addSection => 'Добавить раздел';

  @override
  String get alphabetical => 'По алфавиту';

  @override
  String get appCardHighlightAnimation => 'Анимация выделения карточки приложения';

  @override
  String get appInfo => 'Информация о приложении';

  @override
  String get appKeyClick => 'Звук нажатия клавиши';

  @override
  String get applications => 'Приложения';

  @override
  String get autoHideAppBar => 'Автоскрытие строки состояния';

  @override
  String get backButtonAction => 'Действие кнопки назад';

  @override
  String get category => 'Категория';

  @override
  String get categories => 'Категории';

  @override
  String get columnCount => 'Количество столбцов';

  @override
  String get date => 'Дата';

  @override
  String get dateAndTimeFormat => 'Формат даты и времени';

  @override
  String get delete => 'Удалить';

  @override
  String get dialogOptionBackButtonActionDoNothing => 'Ничего не делать';

  @override
  String get dialogOptionBackButtonActionShowScreensaver => 'Показать заставку';

  @override
  String get dialogOptionBackButtonActionShowClock => 'Показать часы';

  @override
  String get dialogTextNoFileExplorer => 'Пожалуйста, установите файловый менеджер, чтобы выбрать изображение.';

  @override
  String get dialogTitleBackButtonAction => 'Выберите действие кнопки назад';

  @override
  String disambiguateCategoryTitle(String title) {
    return '$title (Категория)';
  }

  @override
  String formattedDate(String dateString) {
    return 'Форматированная дата: $dateString';
  }

  @override
  String formattedTime(String timeString) {
    return 'Форматированное время: $timeString';
  }

  @override
  String get gradient => 'Градиент';

  @override
  String get favoriteApps => 'Избранные приложения';

  @override
  String get grid => 'Сетка';

  @override
  String get height => 'Высота';

  @override
  String get hide => 'Скрыть';

  @override
  String get hiddenApplications => 'Скрытые приложения';

  @override
  String get launcherSections => 'Разделы';

  @override
  String get layout => 'Макет';

  @override
  String get loading => 'Загрузка';

  @override
  String get manual => 'Вручную';

  @override
  String get modifySection => 'Изменить раздел';

  @override
  String get mustNotBeEmpty => 'Не должно быть пустым';

  @override
  String get name => 'Имя';

  @override
  String get newSection => 'Новый раздел';

  @override
  String get noDateFormatSpecified => 'Формат даты не указан';

  @override
  String get noTimeFormatSpecified => 'Формат времени не указан';

  @override
  String get nonTvApplications => 'Приложения не для ТВ';

  @override
  String get open => 'Открыть';

  @override
  String get orSelectFormatSpecifiers => 'Или выберите спецификаторы формата';

  @override
  String get picture => 'Изображение';

  @override
  String removeFrom(String name) {
    return 'Удалить из $name';
  }

  @override
  String get renameCategory => 'Переименовать категорию';

  @override
  String get reorder => 'Изменить порядок';

  @override
  String get row => 'Строка';

  @override
  String get rowHeight => 'Высота строки';

  @override
  String get save => 'Сохранить';

  @override
  String get spacer => 'Разделитель';

  @override
  String get spacerMaxHeightRequirement => 'Должно быть больше 0 и меньше или равно 500';

  @override
  String get statusBar => 'Строка состояния';

  @override
  String get settings => 'Настройки';

  @override
  String get show => 'Показать';

  @override
  String get showCategoryTitles => 'Показывать заголовки категорий';

  @override
  String get themes => 'Темы';

  @override
  String get hideHighlightOutlineOnHomescreen => 'Скрыть контур выделения на главном экране';

  @override
  String get appSelectorTransitionAnimation => 'Анимация перехода селектора приложений';

  @override
  String get sort => 'Сортировать';

  @override
  String get systemSettings => 'Системные настройки';

  @override
  String textAboutDialog(String repoUrl) {
    return 'LTvLauncher — это настраиваемый лаунчер с открытым исходным кодом для Android TV, основанный на FLauncher.\n\nРазработан LeanBitLab.\nИсходный код доступен по адресу $repoUrl.';
  }

  @override
  String get textEmptyCategory => 'Эта категория пуста.';

  @override
  String get time => 'Время';

  @override
  String get titleStatusBarSettingsPage => 'Выберите, что отображать в строке состояния';

  @override
  String get tvApplications => 'ТВ-приложения';

  @override
  String get type => 'Тип';

  @override
  String get typeInTheDateFormat => 'Введите формат даты';

  @override
  String get typeInTheHourFormat => 'Введите формат времени';

  @override
  String get uninstall => 'Удалить';

  @override
  String get wallpaper => 'Обои';

  @override
  String get withEllipsisAddTo => 'Добавить в...';

  @override
  String get timeBasedWallpaper => 'Обои в зависимости от времени';

  @override
  String get pickDayWallpaper => 'Выбрать дневные обои';

  @override
  String get pickNightWallpaper => 'Выбрать ночные обои';

  @override
  String get accessibility => 'Специальные возможности';

  @override
  String get defaultLauncherIsDefault => 'LTvLauncher является лаунчером по умолчанию';

  @override
  String get defaultLauncherNotDefault => 'LTvLauncher не является лаунчером по умолчанию';

  @override
  String get setAsDefaultLauncher => 'Установить как лаунчер по умолчанию';

  @override
  String get defaultLauncherDescription => 'При установке в качестве лаунчера по умолчанию кнопка «Домой» всегда будет возвращать к LTvLauncher. ТВ также будет загружаться напрямую в LTvLauncher.';

  @override
  String get inputs => 'Входы';

  @override
  String get inputSources => 'Источники ввода';

  @override
  String get backupAndRestore => 'Резервное копирование и восстановление';

  @override
  String get exportBackup => 'Экспорт резервной копии';

  @override
  String get importBackup => 'Импорт резервной копии';

  @override
  String exportSuccess(String path) {
    return 'Резервная копия успешно экспортирована в $path';
  }

  @override
  String get importSuccess => 'Резервная копия успешно импортирована';

  @override
  String get importConfirm => 'Вы уверены, что хотите импортировать резервную копию? Это перезапишет ваши текущие настройки и макет.';

  @override
  String importError(String error) {
    return 'Не удалось импортировать резервную копию: $error';
  }

  @override
  String exportError(String error) {
    return 'Не удалось экспортировать резервную копию: $error';
  }

  @override
  String get shareBackup => 'Поделиться резервной копией';

  @override
  String get shareBackupDescription => 'Поделиться резервной копией с другими устройствами в локальной сети';

  @override
  String get stopSharing => 'Остановить доступ';

  @override
  String get localNetworkSharingActive => 'Доступ в локальной сети активен!';

  @override
  String get localNetworkSharingInstructions => 'Подключите другое устройство к той же сети Wi-Fi и откройте следующий URL-адрес в веб-браузере:';

  @override
  String get localNetworkSharingDetails => 'Здесь вы можете скачать настройки/макет вашего ТВ или загрузить файл резервной копии обратно на этот ТВ.';

  @override
  String failedToStartServer(String error) {
    return 'Не удалось запустить сервер общего доступа: $error';
  }

  @override
  String get notificationBell => 'Колокольчик уведомлений';

  @override
  String get autoHideNotificationBell => 'Автоскрытие колокольчика уведомлений';

  @override
  String get continueWatching => 'Продолжить просмотр';

  @override
  String get showContinueWatchingOnHome => 'Показывать «Продолжить просмотр» на главном экране';

  @override
  String get permissionDeniedContinueWatching => 'Требуется разрешение для показа «Продолжить просмотр»';

  @override
  String get interface => 'Интерфейс';

  @override
  String get system => 'Система';

  @override
  String get accentColor => 'Акцентный цвет';

  @override
  String get miscellaneous => 'Разное';

  @override
  String get brightnessScheduler => 'Планировщик яркости';

  @override
  String get screensaverSettings => 'Настройки заставки';

  @override
  String get screensaverClockStyle => 'Стиль часов заставки';

  @override
  String get dataUsagePeriod => 'Период использования данных';

  @override
  String get notificationAccess => 'Доступ к уведомлениям';

  @override
  String get granted => 'Предоставлено';

  @override
  String get permissionRequired => 'Требуется разрешение';

  @override
  String get systemWidePopupAlert => 'Системное всплывающее предупреждение';

  @override
  String get overlayPermissionRequired => 'Требуется разрешение на наложение';

  @override
  String get enabled => 'Включено';

  @override
  String get disabled => 'Отключено';

  @override
  String get showAppNamesBelowIcons => 'Показывать названия приложений под значками';

  @override
  String get dataUsage => 'Использование данных';

  @override
  String get networkIndicator => 'Индикатор сети';

  @override
  String get homeButtonFix => 'Исправление кнопки «Домой» (Google TV)';

  @override
  String get appLanguage => 'Язык';

  @override
  String get systemDefault => 'Системный по умолчанию';

  @override
  String get english => 'Английский';

  @override
  String get spanish => 'Испанский';

  @override
  String get ukrainian => 'Украинский';

  @override
  String get chinese => 'Китайский';

  @override
  String get french => 'Французский';

  @override
  String get german => 'Немецкий';

  @override
  String get japanese => 'Японский';

  @override
  String get portuguese => 'Португальский';

  @override
  String get russian => 'Русский';

  @override
  String get italian => 'Итальянский';

  @override
  String get hindi => 'Хинди';

  @override
  String get korean => 'Корейский';

  @override
  String get arabic => 'Арабский';

  @override
  String get turkish => 'Турецкий';

  @override
  String get hidePersistentNotifications => 'Скрыть постоянные уведомления';

  @override
  String get hidePersistentNotificationsDesc => 'Скрывать фоновые и системные уведомления';

  @override
  String get blockedNotificationApps => 'Заблокированные приложения';

  @override
  String get blockAppNotifications => 'Блокировать уведомления';

  @override
  String get unblockAppNotifications => 'Разблокировать уведомления';

  @override
  String get noBlockedApps => 'Нет заблокированных приложений';

  @override
  String get persistentNotification => 'Постоянное';

  @override
  String get unblockAll => 'Разблокировать все';

  @override
  String get weather => 'Погода';

  @override
  String get showWeatherWarnings => 'Показывать предупреждения о погоде и дожде';

  @override
  String get temperatureUnit => 'Единица температуры';

  @override
  String get celsius => 'Цельсий (°C)';

  @override
  String get fahrenheit => 'Фаренгейт (°F)';

  @override
  String get breezyWeatherSetupHint => 'Установите Breezy Weather и включите \'Локальный обмен данными\' / \'Gadgetbridge\' в его настройках для отображения погоды и предупреждений.';

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
}
