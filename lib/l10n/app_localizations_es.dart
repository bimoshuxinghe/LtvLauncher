import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get aboutFlauncher => 'Acerca de LTvLauncher';

  @override
  String get addCategory => 'Agregar categoría';

  @override
  String get addSection => 'Agregar sección';

  @override
  String get alphabetical => 'Alfabético';

  @override
  String get appCardHighlightAnimation => 'Resaltar aplicaciones';

  @override
  String get appInfo => 'Datos de la aplicación';

  @override
  String get appKeyClick => 'Sonido al presionar una tecla';

  @override
  String get applications => 'Aplicaciones';

  @override
  String get autoHideAppBar => 'Ocultar barra de estado automáticamente';

  @override
  String get backButtonAction => 'Acción del botón \'Atrás\'';

  @override
  String get category => 'Categoría';

  @override
  String get categories => 'Categorías';

  @override
  String get columnCount => 'Cantidad de columnas';

  @override
  String get date => 'Fecha';

  @override
  String get dateAndTimeFormat => 'Formato de fecha y hora';

  @override
  String get delete => 'Eliminar';

  @override
  String get dialogOptionBackButtonActionDoNothing => 'Nada';

  @override
  String get dialogOptionBackButtonActionShowScreensaver => 'Mostrar salvapantallas';

  @override
  String get dialogOptionBackButtonActionShowClock => 'Mostrar reloj';

  @override
  String get dialogTextNoFileExplorer => 'Por favor, instale un gestor de archivos para seleccionar una imagen.';

  @override
  String get dialogTitleBackButtonAction => 'Elegir la acción del botón \'Atrás\'';

  @override
  String disambiguateCategoryTitle(String title) {
    return '$title (Categoría)';
  }

  @override
  String formattedDate(String dateString) {
    return 'Fecha con formato: $dateString';
  }

  @override
  String formattedTime(String timeString) {
    return 'Hora con formato: $timeString';
  }

  @override
  String get gradient => 'Gradiente';

  @override
  String get favoriteApps => 'Apps Favoritas';

  @override
  String get grid => 'Cuadrícula';

  @override
  String get height => 'Altura';

  @override
  String get hide => 'Ocultar';

  @override
  String get hiddenApplications => 'Aplicaciones ocultas';

  @override
  String get launcherSections => 'Secciones';

  @override
  String get layout => 'Distribución';

  @override
  String get loading => 'Cargando';

  @override
  String get manual => 'Manual';

  @override
  String get modifySection => 'Modificar sección';

  @override
  String get mustNotBeEmpty => 'No debe estar vacío';

  @override
  String get name => 'Nombre';

  @override
  String get newSection => 'Nueva sección';

  @override
  String get noDateFormatSpecified => 'Sin formato de fecha';

  @override
  String get noTimeFormatSpecified => 'Sin formato de hora';

  @override
  String get nonTvApplications => 'Otras aplicaciones';

  @override
  String get open => 'Abrir';

  @override
  String get orSelectFormatSpecifiers => 'O seleccione especificadores de formato';

  @override
  String get picture => 'Imagen';

  @override
  String removeFrom(String name) {
    return 'Eliminar de $name';
  }

  @override
  String get renameCategory => 'Renombrar categoría';

  @override
  String get reorder => 'Reordenar';

  @override
  String get row => 'Fila';

  @override
  String get rowHeight => 'Altura de fila';

  @override
  String get save => 'Guardar';

  @override
  String get spacer => 'Espaciador';

  @override
  String get spacerMaxHeightRequirement => 'Debe ser mayor a cero y menor o igual a 500';

  @override
  String get statusBar => 'Barra de estado';

  @override
  String get settings => 'Ajustes';

  @override
  String get show => 'Mostrar';

  @override
  String get showCategoryTitles => 'Mostrar títulos de categorías';

  @override
  String get themes => 'Temas';

  @override
  String get hideHighlightOutlineOnHomescreen => 'Ocultar el contorno de resaltado en la pantalla de inicio';

  @override
  String get appSelectorTransitionAnimation => 'Animación de transición del selector de aplicaciones';

  @override
  String get sort => 'Orden';

  @override
  String get systemSettings => 'Ajustes del sistema';

  @override
  String textAboutDialog(String repoUrl) {
    return 'LTvLauncher es un lanzador de código abierto personalizado para Android TV, basado en FLauncher.\n\nDesarrollado por LeanBitLab.\nCódigo fuente disponible en $repoUrl.';
  }

  @override
  String get textEmptyCategory => 'Esta categoría está vacía.';

  @override
  String get time => 'Hora';

  @override
  String get titleStatusBarSettingsPage => 'Elija la información a mostrar en la barra de estado';

  @override
  String get tvApplications => 'Aplicaciones del televisor';

  @override
  String get type => 'Tipo';

  @override
  String get typeInTheDateFormat => 'Escriba el formato de fecha';

  @override
  String get typeInTheHourFormat => 'Escriba el formato de hora';

  @override
  String get uninstall => 'Desinstalar';

  @override
  String get wallpaper => 'Fondo de pantalla';

  @override
  String get withEllipsisAddTo => 'Añadir a...';

  @override
  String get timeBasedWallpaper => 'Fondo de pantalla según hora';

  @override
  String get pickDayWallpaper => 'Elegir fondo de pantalla diurno';

  @override
  String get pickNightWallpaper => 'Elegir fondo de pantalla nocturno';

  @override
  String get accessibility => 'Accesibilidad';

  @override
  String get defaultLauncherIsDefault => 'LTvLauncher es el lanzador predeterminado';

  @override
  String get defaultLauncherNotDefault => 'LTvLauncher no es el lanzador predeterminado';

  @override
  String get setAsDefaultLauncher => 'Establecer como lanzador predeterminado';

  @override
  String get defaultLauncherDescription => 'Cuando se establece como lanzador predeterminado, el botón de inicio siempre regresará a LTvLauncher. El TV también iniciará directamente en LTvLauncher.';

  @override
  String get inputs => 'Entradas';

  @override
  String get inputSources => 'Fuentes de Entrada';

  @override
  String get backupAndRestore => 'Copia de seguridad y restauración';

  @override
  String get exportBackup => 'Exportar copia de seguridad';

  @override
  String get importBackup => 'Importar copia de seguridad';

  @override
  String exportSuccess(String path) {
    return 'Copia de seguridad exportada con éxito a $path';
  }

  @override
  String get importSuccess => 'Copia de seguridad importada con éxito';

  @override
  String get importConfirm => '¿Está seguro de que desea importar la copia de seguridad? Esto sobrescribirá su configuración y diseño actuales.';

  @override
  String importError(String error) {
    return 'Error al importar la copia de seguridad: $error';
  }

  @override
  String exportError(String error) {
    return 'Error al exportar la copia de seguridad: $error';
  }

  @override
  String get shareBackup => 'Compartir copia';

  @override
  String get shareBackupDescription => 'Comparta la copia de seguridad con otros dispositivos en la red local';

  @override
  String get stopSharing => 'Detener uso compartido';

  @override
  String get localNetworkSharingActive => '¡El uso compartido en red local está activo!';

  @override
  String get localNetworkSharingInstructions => 'Conecte otro dispositivo a la misma red Wi-Fi y abra la siguiente URL en un navegador web:';

  @override
  String get localNetworkSharingDetails => 'Aquí puede descargar la configuración/diseño de su TV o subir un archivo de copia de seguridad a esta TV.';

  @override
  String failedToStartServer(String error) {
    return 'Error al iniciar el servidor de uso compartido: $error';
  }

  @override
  String get notificationBell => 'Campana de notificaciones';

  @override
  String get autoHideNotificationBell => 'Ocultar campana de notificaciones automáticamente';

  @override
  String get continueWatching => 'Continuar viendo';

  @override
  String get showContinueWatchingOnHome => 'Mostrar Continuar viendo en Inicio';

  @override
  String get permissionDeniedContinueWatching => 'Se requiere permiso para mostrar Continuar viendo';

  @override
  String get interface => 'Interfaz';

  @override
  String get system => 'Sistema';

  @override
  String get accentColor => 'Color de acento';

  @override
  String get miscellaneous => 'Miscelánea';

  @override
  String get brightnessScheduler => 'Programador de brillo';

  @override
  String get screensaverSettings => 'Ajustes del salvapantallas';

  @override
  String get screensaverClockStyle => 'Estilo de reloj del salvapantallas';

  @override
  String get dataUsagePeriod => 'Período de uso de datos';

  @override
  String get notificationAccess => 'Acceso a notificaciones';

  @override
  String get granted => 'Concedido';

  @override
  String get permissionRequired => 'Permiso requerido';

  @override
  String get systemWidePopupAlert => 'Alerta emergente del sistema';

  @override
  String get overlayPermissionRequired => 'Permiso de superposición requerido';

  @override
  String get enabled => 'Habilitado';

  @override
  String get disabled => 'Deshabilitado';

  @override
  String get showAppNamesBelowIcons => 'Mostrar nombres debajo de los iconos';

  @override
  String get dataUsage => 'Uso de datos';

  @override
  String get networkIndicator => 'Indicador de red';

  @override
  String get homeButtonFix => 'Corrección del botón Inicio (Google TV)';

  @override
  String get appLanguage => 'Idioma';

  @override
  String get systemDefault => 'Predeterminado del sistema';

  @override
  String get english => 'Inglés';

  @override
  String get spanish => 'Español';

  @override
  String get ukrainian => 'Ucraniano';

  @override
  String get chinese => 'Chino';

  @override
  String get french => 'Francés';

  @override
  String get german => 'Alemán';

  @override
  String get japanese => 'Japonés';

  @override
  String get portuguese => 'Portugués';

  @override
  String get russian => 'Ruso';

  @override
  String get italian => 'Italiano';

  @override
  String get hindi => 'Hindi';

  @override
  String get korean => 'Coreano';

  @override
  String get arabic => 'Árabe';

  @override
  String get turkish => 'Turco';

  @override
  String get hidePersistentNotifications => 'Ocultar notificaciones persistentes';

  @override
  String get hidePersistentNotificationsDesc => 'Ocultar notificaciones de servicios en segundo plano y del sistema';

  @override
  String get blockedNotificationApps => 'Aplicaciones bloqueadas';

  @override
  String get blockAppNotifications => 'Bloquear notificaciones';

  @override
  String get unblockAppNotifications => 'Desbloquear notificaciones';

  @override
  String get noBlockedApps => 'No hay aplicaciones bloqueadas';

  @override
  String get persistentNotification => 'Persistente';

  @override
  String get unblockAll => 'Desbloquear todo';

  @override
  String get weather => 'Clima';

  @override
  String get showWeatherWarnings => 'Mostrar alertas de lluvia y clima';

  @override
  String get temperatureUnit => 'Unidad de temperatura';

  @override
  String get celsius => 'Celsius (°C)';

  @override
  String get fahrenheit => 'Fahrenheit (°F)';

  @override
  String get breezyWeatherSetupHint => 'Instala Breezy Weather y activa \'Compartir datos locales\' / \'Gadgetbridge\' en sus ajustes para ver el clima y avisos de lluvia.';

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
  String get more => 'Más';
}
