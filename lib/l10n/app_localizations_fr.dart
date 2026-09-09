import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get aboutFlauncher => 'À propos de LTvLauncher';

  @override
  String get addCategory => 'Ajouter une catégorie';

  @override
  String get addSection => 'Ajouter une section';

  @override
  String get alphabetical => 'Alphabétique';

  @override
  String get appCardHighlightAnimation => 'Animation de surbrillance de la carte d\'application';

  @override
  String get appInfo => 'Infos sur l\'application';

  @override
  String get appKeyClick => 'Son de clic lors de l\'appui sur une touche';

  @override
  String get applications => 'Applications';

  @override
  String get autoHideAppBar => 'Masquer automatiquement la barre d\'état';

  @override
  String get backButtonAction => 'Action du bouton retour';

  @override
  String get category => 'Catégorie';

  @override
  String get categories => 'Catégories';

  @override
  String get columnCount => 'Nombre de colonnes';

  @override
  String get date => 'Date';

  @override
  String get dateAndTimeFormat => 'Format de la date et de l\'heure';

  @override
  String get delete => 'Supprimer';

  @override
  String get dialogOptionBackButtonActionDoNothing => 'Ne rien faire';

  @override
  String get dialogOptionBackButtonActionShowScreensaver => 'Afficher l\'écran de veille';

  @override
  String get dialogOptionBackButtonActionShowClock => 'Afficher l\'horloge';

  @override
  String get dialogTextNoFileExplorer => 'Veuillez installer un explorateur de fichiers pour sélectionner une image.';

  @override
  String get dialogTitleBackButtonAction => 'Choisir l\'action du bouton retour';

  @override
  String disambiguateCategoryTitle(String title) {
    return '$title (Catégorie)';
  }

  @override
  String formattedDate(String dateString) {
    return 'Date formatée : $dateString';
  }

  @override
  String formattedTime(String timeString) {
    return 'Heure formatée : $timeString';
  }

  @override
  String get gradient => 'Dégradé';

  @override
  String get favoriteApps => 'Applications favorites';

  @override
  String get grid => 'Grille';

  @override
  String get height => 'Hauteur';

  @override
  String get hide => 'Masquer';

  @override
  String get hiddenApplications => 'Applications masquées';

  @override
  String get launcherSections => 'Sections';

  @override
  String get layout => 'Disposition';

  @override
  String get loading => 'Chargement';

  @override
  String get manual => 'Manuel';

  @override
  String get modifySection => 'Modifier la section';

  @override
  String get mustNotBeEmpty => 'Ne doit pas être vide';

  @override
  String get name => 'Nom';

  @override
  String get newSection => 'Nouvelle section';

  @override
  String get noDateFormatSpecified => 'Aucun format de date spécifié';

  @override
  String get noTimeFormatSpecified => 'Aucun format d\'heure spécifié';

  @override
  String get nonTvApplications => 'Applications non TV';

  @override
  String get open => 'Ouvrir';

  @override
  String get orSelectFormatSpecifiers => 'Ou sélectionner les spécificateurs de format';

  @override
  String get picture => 'Image';

  @override
  String removeFrom(String name) {
    return 'Retirer de $name';
  }

  @override
  String get renameCategory => 'Renommer la catégorie';

  @override
  String get reorder => 'Réorganiser';

  @override
  String get row => 'Ligne';

  @override
  String get rowHeight => 'Hauteur de ligne';

  @override
  String get save => 'Enregistrer';

  @override
  String get spacer => 'Espace';

  @override
  String get spacerMaxHeightRequirement => 'Doit être supérieur à 0 et inférieur ou égal à 500';

  @override
  String get statusBar => 'Barre d\'état';

  @override
  String get settings => 'Paramètres';

  @override
  String get show => 'Afficher';

  @override
  String get showCategoryTitles => 'Afficher les titres des catégories';

  @override
  String get themes => 'Thèmes';

  @override
  String get hideHighlightOutlineOnHomescreen => 'Masquer le contour de surbrillance sur l\'écran d\'accueil';

  @override
  String get appSelectorTransitionAnimation => 'Animation de transition du sélecteur d\'application';

  @override
  String get sort => 'Trier';

  @override
  String get systemSettings => 'Paramètres système';

  @override
  String textAboutDialog(String repoUrl) {
    return 'LTvLauncher est un lanceur open-source personnalisé pour Android TV, basé sur FLauncher.\n\nDéveloppé par LeanBitLab.\nCode source disponible sur $repoUrl.';
  }

  @override
  String get textEmptyCategory => 'Cette catégorie est vide.';

  @override
  String get time => 'Heure';

  @override
  String get titleStatusBarSettingsPage => 'Choisir ce qu\'il faut afficher dans la barre d\'état';

  @override
  String get tvApplications => 'Applications TV';

  @override
  String get type => 'Type';

  @override
  String get typeInTheDateFormat => 'Saisir le format de date';

  @override
  String get typeInTheHourFormat => 'Saisir le format de l\'heure';

  @override
  String get uninstall => 'Désinstaller';

  @override
  String get wallpaper => 'Fond d\'écran';

  @override
  String get withEllipsisAddTo => 'Ajouter à...';

  @override
  String get timeBasedWallpaper => 'Fond d\'écran basé sur l\'heure';

  @override
  String get pickDayWallpaper => 'Choisir le fond d\'écran de jour';

  @override
  String get pickNightWallpaper => 'Choisir le fond d\'écran de nuit';

  @override
  String get accessibility => 'Accessibilité';

  @override
  String get defaultLauncherIsDefault => 'LTvLauncher est le lanceur par défaut';

  @override
  String get defaultLauncherNotDefault => 'LTvLauncher n\'est pas le lanceur par défaut';

  @override
  String get setAsDefaultLauncher => 'Définir comme lanceur par défaut';

  @override
  String get defaultLauncherDescription => 'Lorsqu\'il est défini comme lanceur par défaut, le bouton Accueil reviendra toujours à LTvLauncher. La TV démarrera également directement sur LTvLauncher.';

  @override
  String get inputs => 'Entrées';

  @override
  String get inputSources => 'Sources d\'entrée';

  @override
  String get backupAndRestore => 'Sauvegarde et restauration';

  @override
  String get exportBackup => 'Exporter la sauvegarde';

  @override
  String get importBackup => 'Importer la sauvegarde';

  @override
  String exportSuccess(String path) {
    return 'Sauvegarde exportée avec succès vers $path';
  }

  @override
  String get importSuccess => 'Sauvegarde importée avec succès';

  @override
  String get importConfirm => 'Voulez-vous vraiment importer la sauvegarde ? Cela remplacera vos paramètres et votre disposition actuels.';

  @override
  String importError(String error) {
    return 'Échec de l\'importation de la sauvegarde : $error';
  }

  @override
  String exportError(String error) {
    return 'Échec de l\'exportation de la sauvegarde : $error';
  }

  @override
  String get shareBackup => 'Partager la sauvegarde';

  @override
  String get shareBackupDescription => 'Partager la sauvegarde avec d\'autres appareils sur le réseau local';

  @override
  String get stopSharing => 'Arrêter le partage';

  @override
  String get localNetworkSharingActive => 'Le partage sur le réseau local est actif !';

  @override
  String get localNetworkSharingInstructions => 'Connectez un autre appareil au même réseau Wi-Fi et ouvrez l\'URL suivante dans un navigateur Web :';

  @override
  String get localNetworkSharingDetails => 'Ici, vous pouvez télécharger les paramètres/disposition de votre TV ou importer un fichier de sauvegarde vers cette TV.';

  @override
  String failedToStartServer(String error) {
    return 'Échec du démarrage du serveur de partage : $error';
  }

  @override
  String get notificationBell => 'Cloche de notification';

  @override
  String get autoHideNotificationBell => 'Masquer automatiquement la cloche de notification';

  @override
  String get continueWatching => 'Continuer à regarder';

  @override
  String get showContinueWatchingOnHome => 'Afficher Continuer à regarder sur l\'accueil';

  @override
  String get permissionDeniedContinueWatching => 'Autorisation requise pour afficher Continuer à regarder';

  @override
  String get interface => 'Interface';

  @override
  String get system => 'Système';

  @override
  String get accentColor => 'Couleur d\'accentuation';

  @override
  String get miscellaneous => 'Divers';

  @override
  String get brightnessScheduler => 'Planificateur de luminosité';

  @override
  String get screensaverSettings => 'Paramètres de l\'écran de veille';

  @override
  String get screensaverClockStyle => 'Style d\'horloge de l\'écran de veille';

  @override
  String get dataUsagePeriod => 'Période d\'utilisation des données';

  @override
  String get notificationAccess => 'Accès aux notifications';

  @override
  String get granted => 'Accordé';

  @override
  String get permissionRequired => 'Autorisation requise';

  @override
  String get systemWidePopupAlert => 'Alerte contextuelle à l\'échelle du système';

  @override
  String get overlayPermissionRequired => 'Autorisation de superposition requise';

  @override
  String get enabled => 'Activé';

  @override
  String get disabled => 'Désactivé';

  @override
  String get showAppNamesBelowIcons => 'Afficher les noms des applications sous les icônes';

  @override
  String get dataUsage => 'Utilisation des données';

  @override
  String get networkIndicator => 'Indicateur réseau';

  @override
  String get homeButtonFix => 'Correction du bouton Accueil (Google TV)';

  @override
  String get appLanguage => 'Langue';

  @override
  String get systemDefault => 'Système par défaut';

  @override
  String get english => 'Anglais';

  @override
  String get spanish => 'Espagnol';

  @override
  String get ukrainian => 'Ukrainien';

  @override
  String get chinese => 'Chinois';

  @override
  String get french => 'Français';

  @override
  String get german => 'Allemand';

  @override
  String get japanese => 'Japonais';

  @override
  String get portuguese => 'Portugais';

  @override
  String get russian => 'Russe';

  @override
  String get italian => 'Italien';

  @override
  String get hindi => 'Hindi';

  @override
  String get korean => 'Coréen';

  @override
  String get arabic => 'Arabe';

  @override
  String get turkish => 'Turc';

  @override
  String get hidePersistentNotifications => 'Masquer les notifications persistantes';

  @override
  String get hidePersistentNotificationsDesc => 'Masquer les notifications des services d\'arrière-plan et du système';

  @override
  String get blockedNotificationApps => 'Applications bloquées';

  @override
  String get blockAppNotifications => 'Bloquer les notifications';

  @override
  String get unblockAppNotifications => 'Débloquer les notifications';

  @override
  String get noBlockedApps => 'Aucune application bloquée';

  @override
  String get persistentNotification => 'Persistante';

  @override
  String get unblockAll => 'Tout débloquer';

  @override
  String get weather => 'Météo';

  @override
  String get showWeatherWarnings => 'Afficher les alertes météo et pluie';

  @override
  String get temperatureUnit => 'Unité de température';

  @override
  String get celsius => 'Celsius (°C)';

  @override
  String get fahrenheit => 'Fahrenheit (°F)';

  @override
  String get breezyWeatherSetupHint => 'Installez Breezy Weather et activez le \'Partage local des données\' / \'Gadgetbridge\' dans ses paramètres pour afficher la météo et les alertes de pluie.';

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
  String get more => 'Plus';
}
