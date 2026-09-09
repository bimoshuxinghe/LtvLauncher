import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_uk.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('hi'),
    Locale('it'),
    Locale('ja'),
    Locale('ko'),
    Locale('pt'),
    Locale('ru'),
    Locale('tr'),
    Locale('uk'),
    Locale('zh')
  ];

  /// No description provided for @aboutFlauncher.
  ///
  /// In en, this message translates to:
  /// **'About LTvLauncher'**
  String get aboutFlauncher;

  /// No description provided for @addCategory.
  ///
  /// In en, this message translates to:
  /// **'Add category'**
  String get addCategory;

  /// No description provided for @addSection.
  ///
  /// In en, this message translates to:
  /// **'Add section'**
  String get addSection;

  /// No description provided for @alphabetical.
  ///
  /// In en, this message translates to:
  /// **'Alphabetical'**
  String get alphabetical;

  /// No description provided for @appCardHighlightAnimation.
  ///
  /// In en, this message translates to:
  /// **'App card highlight animation'**
  String get appCardHighlightAnimation;

  /// No description provided for @appInfo.
  ///
  /// In en, this message translates to:
  /// **'Application info'**
  String get appInfo;

  /// No description provided for @appKeyClick.
  ///
  /// In en, this message translates to:
  /// **'Click sound on key press'**
  String get appKeyClick;

  /// No description provided for @applications.
  ///
  /// In en, this message translates to:
  /// **'Applications'**
  String get applications;

  /// No description provided for @autoHideAppBar.
  ///
  /// In en, this message translates to:
  /// **'Automatically hide status bar'**
  String get autoHideAppBar;

  /// No description provided for @backButtonAction.
  ///
  /// In en, this message translates to:
  /// **'Back button action'**
  String get backButtonAction;

  /// No description provided for @category.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get category;

  /// No description provided for @categories.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get categories;

  /// No description provided for @columnCount.
  ///
  /// In en, this message translates to:
  /// **'Column count'**
  String get columnCount;

  /// No description provided for @date.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get date;

  /// No description provided for @dateAndTimeFormat.
  ///
  /// In en, this message translates to:
  /// **'Date and time format'**
  String get dateAndTimeFormat;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @dialogOptionBackButtonActionDoNothing.
  ///
  /// In en, this message translates to:
  /// **'Do nothing'**
  String get dialogOptionBackButtonActionDoNothing;

  /// No description provided for @dialogOptionBackButtonActionShowScreensaver.
  ///
  /// In en, this message translates to:
  /// **'Show screensaver'**
  String get dialogOptionBackButtonActionShowScreensaver;

  /// No description provided for @dialogOptionBackButtonActionShowClock.
  ///
  /// In en, this message translates to:
  /// **'Show clock'**
  String get dialogOptionBackButtonActionShowClock;

  /// No description provided for @dialogTextNoFileExplorer.
  ///
  /// In en, this message translates to:
  /// **'Please install a file explorer in order to pick a picture.'**
  String get dialogTextNoFileExplorer;

  /// No description provided for @dialogTitleBackButtonAction.
  ///
  /// In en, this message translates to:
  /// **'Choose the back button action'**
  String get dialogTitleBackButtonAction;

  /// No description provided for @disambiguateCategoryTitle.
  ///
  /// In en, this message translates to:
  /// **'{title} (Category)'**
  String disambiguateCategoryTitle(String title);

  /// No description provided for @formattedDate.
  ///
  /// In en, this message translates to:
  /// **'Formatted date: {dateString}'**
  String formattedDate(String dateString);

  /// No description provided for @formattedTime.
  ///
  /// In en, this message translates to:
  /// **'Formatted time: {timeString}'**
  String formattedTime(String timeString);

  /// No description provided for @gradient.
  ///
  /// In en, this message translates to:
  /// **'Gradient'**
  String get gradient;

  /// No description provided for @favoriteApps.
  ///
  /// In en, this message translates to:
  /// **'Favorite Apps'**
  String get favoriteApps;

  /// No description provided for @grid.
  ///
  /// In en, this message translates to:
  /// **'Grid'**
  String get grid;

  /// No description provided for @height.
  ///
  /// In en, this message translates to:
  /// **'Height'**
  String get height;

  /// No description provided for @hide.
  ///
  /// In en, this message translates to:
  /// **'Hide'**
  String get hide;

  /// No description provided for @hiddenApplications.
  ///
  /// In en, this message translates to:
  /// **'Hidden Apps'**
  String get hiddenApplications;

  /// No description provided for @launcherSections.
  ///
  /// In en, this message translates to:
  /// **'Sections'**
  String get launcherSections;

  /// No description provided for @layout.
  ///
  /// In en, this message translates to:
  /// **'Layout'**
  String get layout;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading'**
  String get loading;

  /// No description provided for @manual.
  ///
  /// In en, this message translates to:
  /// **'Manual'**
  String get manual;

  /// No description provided for @modifySection.
  ///
  /// In en, this message translates to:
  /// **'Modify section'**
  String get modifySection;

  /// No description provided for @mustNotBeEmpty.
  ///
  /// In en, this message translates to:
  /// **'Must not be empty'**
  String get mustNotBeEmpty;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @newSection.
  ///
  /// In en, this message translates to:
  /// **'New section'**
  String get newSection;

  /// No description provided for @noDateFormatSpecified.
  ///
  /// In en, this message translates to:
  /// **'No date format specified'**
  String get noDateFormatSpecified;

  /// No description provided for @noTimeFormatSpecified.
  ///
  /// In en, this message translates to:
  /// **'No time format specified'**
  String get noTimeFormatSpecified;

  /// No description provided for @nonTvApplications.
  ///
  /// In en, this message translates to:
  /// **'Non-TV Apps'**
  String get nonTvApplications;

  /// No description provided for @open.
  ///
  /// In en, this message translates to:
  /// **'Open'**
  String get open;

  /// No description provided for @orSelectFormatSpecifiers.
  ///
  /// In en, this message translates to:
  /// **'Or select format specifiers'**
  String get orSelectFormatSpecifiers;

  /// No description provided for @picture.
  ///
  /// In en, this message translates to:
  /// **'Picture'**
  String get picture;

  /// No description provided for @removeFrom.
  ///
  /// In en, this message translates to:
  /// **'Remove from {name}'**
  String removeFrom(String name);

  /// No description provided for @renameCategory.
  ///
  /// In en, this message translates to:
  /// **'Rename category'**
  String get renameCategory;

  /// No description provided for @reorder.
  ///
  /// In en, this message translates to:
  /// **'Reorder'**
  String get reorder;

  /// No description provided for @row.
  ///
  /// In en, this message translates to:
  /// **'Row'**
  String get row;

  /// No description provided for @rowHeight.
  ///
  /// In en, this message translates to:
  /// **'Row height'**
  String get rowHeight;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @spacer.
  ///
  /// In en, this message translates to:
  /// **'Spacer'**
  String get spacer;

  /// No description provided for @spacerMaxHeightRequirement.
  ///
  /// In en, this message translates to:
  /// **'Must be greater than 0 and less than or equal to 500'**
  String get spacerMaxHeightRequirement;

  /// No description provided for @statusBar.
  ///
  /// In en, this message translates to:
  /// **'Status bar'**
  String get statusBar;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @show.
  ///
  /// In en, this message translates to:
  /// **'Show'**
  String get show;

  /// No description provided for @showCategoryTitles.
  ///
  /// In en, this message translates to:
  /// **'Show category titles'**
  String get showCategoryTitles;

  /// No description provided for @themes.
  ///
  /// In en, this message translates to:
  /// **'Themes'**
  String get themes;

  /// No description provided for @hideHighlightOutlineOnHomescreen.
  ///
  /// In en, this message translates to:
  /// **'Hide highlight outline on homescreen'**
  String get hideHighlightOutlineOnHomescreen;

  /// No description provided for @appSelectorTransitionAnimation.
  ///
  /// In en, this message translates to:
  /// **'App selector transition animation'**
  String get appSelectorTransitionAnimation;

  /// No description provided for @sort.
  ///
  /// In en, this message translates to:
  /// **'Sort'**
  String get sort;

  /// No description provided for @systemSettings.
  ///
  /// In en, this message translates to:
  /// **'System settings'**
  String get systemSettings;

  /// No description provided for @textAboutDialog.
  ///
  /// In en, this message translates to:
  /// **'LTvLauncher is a customized open-source launcher for Android TV, based on FLauncher.\n\nDeveloped by LeanBitLab.\nSource code available at {repoUrl}.'**
  String textAboutDialog(String repoUrl);

  /// No description provided for @textEmptyCategory.
  ///
  /// In en, this message translates to:
  /// **'This category is empty.'**
  String get textEmptyCategory;

  /// No description provided for @time.
  ///
  /// In en, this message translates to:
  /// **'Time'**
  String get time;

  /// No description provided for @titleStatusBarSettingsPage.
  ///
  /// In en, this message translates to:
  /// **'Choose what to display in the status bar'**
  String get titleStatusBarSettingsPage;

  /// No description provided for @tvApplications.
  ///
  /// In en, this message translates to:
  /// **'TV Apps'**
  String get tvApplications;

  /// No description provided for @type.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get type;

  /// No description provided for @typeInTheDateFormat.
  ///
  /// In en, this message translates to:
  /// **'Type in the date format'**
  String get typeInTheDateFormat;

  /// No description provided for @typeInTheHourFormat.
  ///
  /// In en, this message translates to:
  /// **'Type in the hour format'**
  String get typeInTheHourFormat;

  /// No description provided for @uninstall.
  ///
  /// In en, this message translates to:
  /// **'Uninstall'**
  String get uninstall;

  /// No description provided for @wallpaper.
  ///
  /// In en, this message translates to:
  /// **'Wallpaper'**
  String get wallpaper;

  /// No description provided for @withEllipsisAddTo.
  ///
  /// In en, this message translates to:
  /// **'Add to...'**
  String get withEllipsisAddTo;

  /// No description provided for @timeBasedWallpaper.
  ///
  /// In en, this message translates to:
  /// **'Time based wallpaper'**
  String get timeBasedWallpaper;

  /// No description provided for @pickDayWallpaper.
  ///
  /// In en, this message translates to:
  /// **'Pick day wallpaper'**
  String get pickDayWallpaper;

  /// No description provided for @pickNightWallpaper.
  ///
  /// In en, this message translates to:
  /// **'Pick night wallpaper'**
  String get pickNightWallpaper;

  /// No description provided for @accessibility.
  ///
  /// In en, this message translates to:
  /// **'Accessibility'**
  String get accessibility;

  /// No description provided for @defaultLauncherIsDefault.
  ///
  /// In en, this message translates to:
  /// **'LTvLauncher is the default launcher'**
  String get defaultLauncherIsDefault;

  /// No description provided for @defaultLauncherNotDefault.
  ///
  /// In en, this message translates to:
  /// **'LTvLauncher is not the default launcher'**
  String get defaultLauncherNotDefault;

  /// No description provided for @setAsDefaultLauncher.
  ///
  /// In en, this message translates to:
  /// **'Set as default launcher'**
  String get setAsDefaultLauncher;

  /// No description provided for @defaultLauncherDescription.
  ///
  /// In en, this message translates to:
  /// **'When set as the default launcher, the Home button will always return to LTvLauncher. The TV will also boot directly into LTvLauncher.'**
  String get defaultLauncherDescription;

  /// No description provided for @inputs.
  ///
  /// In en, this message translates to:
  /// **'Inputs'**
  String get inputs;

  /// No description provided for @inputSources.
  ///
  /// In en, this message translates to:
  /// **'Input Sources'**
  String get inputSources;

  /// No description provided for @backupAndRestore.
  ///
  /// In en, this message translates to:
  /// **'Backup & Restore'**
  String get backupAndRestore;

  /// No description provided for @exportBackup.
  ///
  /// In en, this message translates to:
  /// **'Export Backup'**
  String get exportBackup;

  /// No description provided for @importBackup.
  ///
  /// In en, this message translates to:
  /// **'Import Backup'**
  String get importBackup;

  /// No description provided for @exportSuccess.
  ///
  /// In en, this message translates to:
  /// **'Backup exported successfully to {path}'**
  String exportSuccess(String path);

  /// No description provided for @importSuccess.
  ///
  /// In en, this message translates to:
  /// **'Backup imported successfully'**
  String get importSuccess;

  /// No description provided for @importConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to import the backup? This will overwrite your current settings and layout.'**
  String get importConfirm;

  /// No description provided for @importError.
  ///
  /// In en, this message translates to:
  /// **'Failed to import backup: {error}'**
  String importError(String error);

  /// No description provided for @exportError.
  ///
  /// In en, this message translates to:
  /// **'Failed to export backup: {error}'**
  String exportError(String error);

  /// No description provided for @shareBackup.
  ///
  /// In en, this message translates to:
  /// **'Share Backup'**
  String get shareBackup;

  /// No description provided for @shareBackupDescription.
  ///
  /// In en, this message translates to:
  /// **'Share backup with other devices on local network'**
  String get shareBackupDescription;

  /// No description provided for @stopSharing.
  ///
  /// In en, this message translates to:
  /// **'Stop Sharing'**
  String get stopSharing;

  /// No description provided for @localNetworkSharingActive.
  ///
  /// In en, this message translates to:
  /// **'Local network sharing is active!'**
  String get localNetworkSharingActive;

  /// No description provided for @localNetworkSharingInstructions.
  ///
  /// In en, this message translates to:
  /// **'Connect another device to the same Wi-Fi network and open the following URL in a web browser:'**
  String get localNetworkSharingInstructions;

  /// No description provided for @localNetworkSharingDetails.
  ///
  /// In en, this message translates to:
  /// **'Here you can download your TV settings/layout or upload a backup file back to this TV.'**
  String get localNetworkSharingDetails;

  /// No description provided for @failedToStartServer.
  ///
  /// In en, this message translates to:
  /// **'Failed to start sharing server: {error}'**
  String failedToStartServer(String error);

  /// No description provided for @notificationBell.
  ///
  /// In en, this message translates to:
  /// **'Notification Bell'**
  String get notificationBell;

  /// No description provided for @autoHideNotificationBell.
  ///
  /// In en, this message translates to:
  /// **'Auto-hide Notification Bell'**
  String get autoHideNotificationBell;

  /// No description provided for @continueWatching.
  ///
  /// In en, this message translates to:
  /// **'Continue Watching'**
  String get continueWatching;

  /// No description provided for @showContinueWatchingOnHome.
  ///
  /// In en, this message translates to:
  /// **'Show Continue Watching on Home'**
  String get showContinueWatchingOnHome;

  /// No description provided for @permissionDeniedContinueWatching.
  ///
  /// In en, this message translates to:
  /// **'Permission required to show Continue Watching'**
  String get permissionDeniedContinueWatching;

  /// No description provided for @interface.
  ///
  /// In en, this message translates to:
  /// **'Interface'**
  String get interface;

  /// No description provided for @system.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get system;

  /// No description provided for @accentColor.
  ///
  /// In en, this message translates to:
  /// **'Accent Color'**
  String get accentColor;

  /// No description provided for @miscellaneous.
  ///
  /// In en, this message translates to:
  /// **'Miscellaneous'**
  String get miscellaneous;

  /// No description provided for @brightnessScheduler.
  ///
  /// In en, this message translates to:
  /// **'Brightness Scheduler'**
  String get brightnessScheduler;

  /// No description provided for @screensaverSettings.
  ///
  /// In en, this message translates to:
  /// **'Screensaver Settings'**
  String get screensaverSettings;

  /// No description provided for @screensaverClockStyle.
  ///
  /// In en, this message translates to:
  /// **'Screensaver Clock Style'**
  String get screensaverClockStyle;

  /// No description provided for @dataUsagePeriod.
  ///
  /// In en, this message translates to:
  /// **'Data Usage Period'**
  String get dataUsagePeriod;

  /// No description provided for @notificationAccess.
  ///
  /// In en, this message translates to:
  /// **'Notification Access'**
  String get notificationAccess;

  /// No description provided for @granted.
  ///
  /// In en, this message translates to:
  /// **'Granted'**
  String get granted;

  /// No description provided for @permissionRequired.
  ///
  /// In en, this message translates to:
  /// **'Permission Required'**
  String get permissionRequired;

  /// No description provided for @systemWidePopupAlert.
  ///
  /// In en, this message translates to:
  /// **'System-wide Popup Alert'**
  String get systemWidePopupAlert;

  /// No description provided for @overlayPermissionRequired.
  ///
  /// In en, this message translates to:
  /// **'Overlay Permission Required'**
  String get overlayPermissionRequired;

  /// No description provided for @enabled.
  ///
  /// In en, this message translates to:
  /// **'Enabled'**
  String get enabled;

  /// No description provided for @disabled.
  ///
  /// In en, this message translates to:
  /// **'Disabled'**
  String get disabled;

  /// No description provided for @showAppNamesBelowIcons.
  ///
  /// In en, this message translates to:
  /// **'Show App Names Below Icons'**
  String get showAppNamesBelowIcons;

  /// No description provided for @dataUsage.
  ///
  /// In en, this message translates to:
  /// **'Data Usage'**
  String get dataUsage;

  /// No description provided for @networkIndicator.
  ///
  /// In en, this message translates to:
  /// **'Network Indicator'**
  String get networkIndicator;

  /// No description provided for @homeButtonFix.
  ///
  /// In en, this message translates to:
  /// **'Home Button Fix (Google TV)'**
  String get homeButtonFix;

  /// No description provided for @appLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get appLanguage;

  /// No description provided for @systemDefault.
  ///
  /// In en, this message translates to:
  /// **'System Default'**
  String get systemDefault;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @spanish.
  ///
  /// In en, this message translates to:
  /// **'Spanish'**
  String get spanish;

  /// No description provided for @ukrainian.
  ///
  /// In en, this message translates to:
  /// **'Ukrainian'**
  String get ukrainian;

  /// No description provided for @chinese.
  ///
  /// In en, this message translates to:
  /// **'Chinese'**
  String get chinese;

  /// No description provided for @french.
  ///
  /// In en, this message translates to:
  /// **'French'**
  String get french;

  /// No description provided for @german.
  ///
  /// In en, this message translates to:
  /// **'German'**
  String get german;

  /// No description provided for @japanese.
  ///
  /// In en, this message translates to:
  /// **'Japanese'**
  String get japanese;

  /// No description provided for @portuguese.
  ///
  /// In en, this message translates to:
  /// **'Portuguese'**
  String get portuguese;

  /// No description provided for @russian.
  ///
  /// In en, this message translates to:
  /// **'Russian'**
  String get russian;

  /// No description provided for @italian.
  ///
  /// In en, this message translates to:
  /// **'Italian'**
  String get italian;

  /// No description provided for @hindi.
  ///
  /// In en, this message translates to:
  /// **'Hindi'**
  String get hindi;

  /// No description provided for @korean.
  ///
  /// In en, this message translates to:
  /// **'Korean'**
  String get korean;

  /// No description provided for @arabic.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get arabic;

  /// No description provided for @turkish.
  ///
  /// In en, this message translates to:
  /// **'Turkish'**
  String get turkish;

  /// No description provided for @hidePersistentNotifications.
  ///
  /// In en, this message translates to:
  /// **'Hide Persistent Notifications'**
  String get hidePersistentNotifications;

  /// No description provided for @hidePersistentNotificationsDesc.
  ///
  /// In en, this message translates to:
  /// **'Hide ongoing background service and system notifications'**
  String get hidePersistentNotificationsDesc;

  /// No description provided for @blockedNotificationApps.
  ///
  /// In en, this message translates to:
  /// **'Blocked Apps'**
  String get blockedNotificationApps;

  /// No description provided for @blockAppNotifications.
  ///
  /// In en, this message translates to:
  /// **'Block Notifications'**
  String get blockAppNotifications;

  /// No description provided for @unblockAppNotifications.
  ///
  /// In en, this message translates to:
  /// **'Unblock Notifications'**
  String get unblockAppNotifications;

  /// No description provided for @noBlockedApps.
  ///
  /// In en, this message translates to:
  /// **'No blocked apps'**
  String get noBlockedApps;

  /// No description provided for @persistentNotification.
  ///
  /// In en, this message translates to:
  /// **'Persistent'**
  String get persistentNotification;

  /// No description provided for @unblockAll.
  ///
  /// In en, this message translates to:
  /// **'Unblock All'**
  String get unblockAll;

  /// No description provided for @weather.
  ///
  /// In en, this message translates to:
  /// **'Weather'**
  String get weather;

  /// No description provided for @showWeatherWarnings.
  ///
  /// In en, this message translates to:
  /// **'Show Weather & Rain Warnings'**
  String get showWeatherWarnings;

  /// No description provided for @temperatureUnit.
  ///
  /// In en, this message translates to:
  /// **'Temperature Unit'**
  String get temperatureUnit;

  /// No description provided for @celsius.
  ///
  /// In en, this message translates to:
  /// **'Celsius (°C)'**
  String get celsius;

  /// No description provided for @fahrenheit.
  ///
  /// In en, this message translates to:
  /// **'Fahrenheit (°F)'**
  String get fahrenheit;

  /// No description provided for @breezyWeatherSetupHint.
  ///
  /// In en, this message translates to:
  /// **'Install Breezy Weather and enable \'Local data sharing\' / \'Gadgetbridge\' in its settings to see weather and rain warnings.'**
  String get breezyWeatherSetupHint;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @addToCategory.
  ///
  /// In en, this message translates to:
  /// **'Add to Category'**
  String get addToCategory;

  /// No description provided for @setCustomBanner.
  ///
  /// In en, this message translates to:
  /// **'Set Custom Banner'**
  String get setCustomBanner;

  /// No description provided for @clearCustomBanner.
  ///
  /// In en, this message translates to:
  /// **'Clear Custom Banner'**
  String get clearCustomBanner;

  /// No description provided for @setBannerFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to set banner: {error}'**
  String setBannerFailed(String error);

  /// No description provided for @clearBannerFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to clear banner: {error}'**
  String clearBannerFailed(String error);

  /// No description provided for @grantUsagePermission.
  ///
  /// In en, this message translates to:
  /// **'Grant Usage Permission'**
  String get grantUsagePermission;

  /// No description provided for @accessibilityPermission.
  ///
  /// In en, this message translates to:
  /// **'Accessibility Permission'**
  String get accessibilityPermission;

  /// No description provided for @shareFailed.
  ///
  /// In en, this message translates to:
  /// **'Share Failed'**
  String get shareFailed;

  /// No description provided for @shareBackupFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to share backup: {error}'**
  String shareBackupFailed(String error);

  /// No description provided for @exportSuccessTitle.
  ///
  /// In en, this message translates to:
  /// **'Export Success'**
  String get exportSuccessTitle;

  /// No description provided for @exportFailedTitle.
  ///
  /// In en, this message translates to:
  /// **'Export Failed'**
  String get exportFailedTitle;

  /// No description provided for @noBackupFilesFound.
  ///
  /// In en, this message translates to:
  /// **'No backup files found.'**
  String get noBackupFilesFound;

  /// No description provided for @importFailed.
  ///
  /// In en, this message translates to:
  /// **'Import Failed'**
  String get importFailed;

  /// No description provided for @brightnessAdbPermissionHint.
  ///
  /// In en, this message translates to:
  /// **'To control brightness on this device, you must grant permission via ADB:'**
  String get brightnessAdbPermissionHint;

  /// No description provided for @grantPermission.
  ///
  /// In en, this message translates to:
  /// **'Grant Permission'**
  String get grantPermission;

  /// No description provided for @checkStatus.
  ///
  /// In en, this message translates to:
  /// **'Check Status'**
  String get checkStatus;

  /// No description provided for @overlayPermission.
  ///
  /// In en, this message translates to:
  /// **'Overlay Permission'**
  String get overlayPermission;

  /// No description provided for @customName.
  ///
  /// In en, this message translates to:
  /// **'Custom Name'**
  String get customName;

  /// No description provided for @lastUsed.
  ///
  /// In en, this message translates to:
  /// **'Last Used'**
  String get lastUsed;

  /// No description provided for @clearAll.
  ///
  /// In en, this message translates to:
  /// **'Clear All'**
  String get clearAll;

  /// No description provided for @dismiss.
  ///
  /// In en, this message translates to:
  /// **'Dismiss'**
  String get dismiss;

  /// No description provided for @errorLoadingBackups.
  ///
  /// In en, this message translates to:
  /// **'Error loading backups: {error}'**
  String errorLoadingBackups(String error);

  /// No description provided for @addToFavorites.
  ///
  /// In en, this message translates to:
  /// **'Add to Fav'**
  String get addToFavorites;

  /// No description provided for @removeFromFavorites.
  ///
  /// In en, this message translates to:
  /// **'Remove from Fav'**
  String get removeFromFavorites;

  /// No description provided for @selectedAccent.
  ///
  /// In en, this message translates to:
  /// **'Selected Accent'**
  String get selectedAccent;

  /// No description provided for @accessibilityPermissionGuide.
  ///
  /// In en, this message translates to:
  /// **'On this device, the Accessibility settings screen could not be opened automatically.\n\nTo enable Home Button Fix, you can grant permission manually by running this ADB command from a computer connected to the TV:'**
  String get accessibilityPermissionGuide;

  /// No description provided for @enableScheduler.
  ///
  /// In en, this message translates to:
  /// **'Enable Scheduler'**
  String get enableScheduler;

  /// No description provided for @brightnessExperimentalNote.
  ///
  /// In en, this message translates to:
  /// **'EXPERIMENTAL: This feature is untested and may be removed in future versions based on user feedback.'**
  String get brightnessExperimentalNote;

  /// No description provided for @brightnessSupportNote.
  ///
  /// In en, this message translates to:
  /// **'Note: Some Android TV devices may not support app-level brightness control.'**
  String get brightnessSupportNote;

  /// No description provided for @developedBy.
  ///
  /// In en, this message translates to:
  /// **'Developed by LeanBitLab'**
  String get developedBy;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @sponsorProject.
  ///
  /// In en, this message translates to:
  /// **'Sponsor Project'**
  String get sponsorProject;

  /// No description provided for @sourceCode.
  ///
  /// In en, this message translates to:
  /// **'Source Code'**
  String get sourceCode;

  /// No description provided for @notificationAccessGuide.
  ///
  /// In en, this message translates to:
  /// **'On this device, the Notification Access settings screen could not be opened automatically.\n\nTo enable notifications, you can grant permission manually by running this ADB command from a computer connected to the TV:'**
  String get notificationAccessGuide;

  /// No description provided for @overlayPermissionGuide.
  ///
  /// In en, this message translates to:
  /// **'On this device, the Overlay Permission settings screen could not be opened automatically.\n\nTo enable overlay popups, you can grant permission manually by running this ADB command from a computer connected to the TV:'**
  String get overlayPermissionGuide;

  /// No description provided for @noInputsDetected.
  ///
  /// In en, this message translates to:
  /// **'No inputs detected'**
  String get noInputsDetected;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @allCaughtUp.
  ///
  /// In en, this message translates to:
  /// **'All caught up!'**
  String get allCaughtUp;

  /// No description provided for @continueWatchingAdbHint.
  ///
  /// In en, this message translates to:
  /// **'ADB grant required for Continue Watching:'**
  String get continueWatchingAdbHint;

  /// No description provided for @dataUsageWeekly.
  ///
  /// In en, this message translates to:
  /// **'Weekly: '**
  String get dataUsageWeekly;

  /// No description provided for @dataUsageMonthly.
  ///
  /// In en, this message translates to:
  /// **'Monthly: '**
  String get dataUsageMonthly;

  /// No description provided for @dataUsageDaily.
  ///
  /// In en, this message translates to:
  /// **'Daily: '**
  String get dataUsageDaily;

  /// No description provided for @currentLabel.
  ///
  /// In en, this message translates to:
  /// **'Current: {value}'**
  String currentLabel(String value);

  /// No description provided for @noApplicationsFound.
  ///
  /// In en, this message translates to:
  /// **'No applications found'**
  String get noApplicationsFound;

  /// No description provided for @selectAName.
  ///
  /// In en, this message translates to:
  /// **'Select a name'**
  String get selectAName;

  /// No description provided for @customPreset.
  ///
  /// In en, this message translates to:
  /// **'Custom...'**
  String get customPreset;

  /// No description provided for @invalidDateFormat.
  ///
  /// In en, this message translates to:
  /// **'Invalid format'**
  String get invalidDateFormat;

  /// No description provided for @selectFormatsBelow.
  ///
  /// In en, this message translates to:
  /// **'Select formats below'**
  String get selectFormatsBelow;

  /// No description provided for @backupShareText.
  ///
  /// In en, this message translates to:
  /// **'LTvLauncher Backup'**
  String get backupShareText;

  /// No description provided for @homeButtonFixHint.
  ///
  /// In en, this message translates to:
  /// **'If you are using Google TV, enable \"Home Button Fix\" under Accessibility settings to make the Home button open this launcher.'**
  String get homeButtonFixHint;

  /// No description provided for @presetTvApps.
  ///
  /// In en, this message translates to:
  /// **'TV Apps'**
  String get presetTvApps;

  /// No description provided for @presetNonTvApps.
  ///
  /// In en, this message translates to:
  /// **'Non-TV Apps'**
  String get presetNonTvApps;

  /// No description provided for @presetMoviesShows.
  ///
  /// In en, this message translates to:
  /// **'Movies & Shows'**
  String get presetMoviesShows;

  /// No description provided for @presetMusic.
  ///
  /// In en, this message translates to:
  /// **'Music'**
  String get presetMusic;

  /// No description provided for @presetGames.
  ///
  /// In en, this message translates to:
  /// **'Games'**
  String get presetGames;

  /// No description provided for @presetEntertainment.
  ///
  /// In en, this message translates to:
  /// **'Entertainment'**
  String get presetEntertainment;

  /// No description provided for @presetLiveTv.
  ///
  /// In en, this message translates to:
  /// **'Live TV'**
  String get presetLiveTv;

  /// No description provided for @presetSports.
  ///
  /// In en, this message translates to:
  /// **'Sports'**
  String get presetSports;

  /// No description provided for @presetNews.
  ///
  /// In en, this message translates to:
  /// **'News'**
  String get presetNews;

  /// No description provided for @presetTools.
  ///
  /// In en, this message translates to:
  /// **'Tools'**
  String get presetTools;

  /// No description provided for @presetFavorites.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get presetFavorites;

  /// No description provided for @colorRed.
  ///
  /// In en, this message translates to:
  /// **'Red'**
  String get colorRed;

  /// No description provided for @colorCyan.
  ///
  /// In en, this message translates to:
  /// **'Cyan'**
  String get colorCyan;

  /// No description provided for @colorIndigo.
  ///
  /// In en, this message translates to:
  /// **'Indigo'**
  String get colorIndigo;

  /// No description provided for @colorLime.
  ///
  /// In en, this message translates to:
  /// **'Lime'**
  String get colorLime;

  /// No description provided for @colorAmber.
  ///
  /// In en, this message translates to:
  /// **'Amber'**
  String get colorAmber;

  /// No description provided for @colorRose.
  ///
  /// In en, this message translates to:
  /// **'Rose'**
  String get colorRose;

  /// No description provided for @colorIceBlue.
  ///
  /// In en, this message translates to:
  /// **'Ice Blue'**
  String get colorIceBlue;

  /// No description provided for @clockStyleMinimal.
  ///
  /// In en, this message translates to:
  /// **'Minimal'**
  String get clockStyleMinimal;

  /// No description provided for @clockStyleMinimalDesc.
  ///
  /// In en, this message translates to:
  /// **'Thin, elegant font (Default)'**
  String get clockStyleMinimalDesc;

  /// No description provided for @clockStyleBold.
  ///
  /// In en, this message translates to:
  /// **'Bold'**
  String get clockStyleBold;

  /// No description provided for @clockStyleBoldDesc.
  ///
  /// In en, this message translates to:
  /// **'Thick, highly visible font'**
  String get clockStyleBoldDesc;

  /// No description provided for @clockStyleRetro.
  ///
  /// In en, this message translates to:
  /// **'Retro'**
  String get clockStyleRetro;

  /// No description provided for @clockStyleRetroDesc.
  ///
  /// In en, this message translates to:
  /// **'Monospaced, retro terminal style'**
  String get clockStyleRetroDesc;

  /// No description provided for @clockStyleElegant.
  ///
  /// In en, this message translates to:
  /// **'Elegant'**
  String get clockStyleElegant;

  /// No description provided for @clockStyleElegantDesc.
  ///
  /// In en, this message translates to:
  /// **'Classic serif typeface'**
  String get clockStyleElegantDesc;

  /// No description provided for @clockStyleNeon.
  ///
  /// In en, this message translates to:
  /// **'Neon'**
  String get clockStyleNeon;

  /// No description provided for @clockStyleNeonDesc.
  ///
  /// In en, this message translates to:
  /// **'Ultra-thin, glowing style'**
  String get clockStyleNeonDesc;

  /// No description provided for @clockStylePixel.
  ///
  /// In en, this message translates to:
  /// **'Pixel'**
  String get clockStylePixel;

  /// No description provided for @clockStylePixelDesc.
  ///
  /// In en, this message translates to:
  /// **'Bold monospaced, arcade feel'**
  String get clockStylePixelDesc;

  /// No description provided for @clockStyleDigital.
  ///
  /// In en, this message translates to:
  /// **'Digital'**
  String get clockStyleDigital;

  /// No description provided for @clockStyleDigitalDesc.
  ///
  /// In en, this message translates to:
  /// **'Clean monospaced display'**
  String get clockStyleDigitalDesc;

  /// No description provided for @gradGreatWhale.
  ///
  /// In en, this message translates to:
  /// **'Great Whale'**
  String get gradGreatWhale;

  /// No description provided for @gradViciousStance.
  ///
  /// In en, this message translates to:
  /// **'Vicious Stance'**
  String get gradViciousStance;

  /// No description provided for @gradTeenNotebook.
  ///
  /// In en, this message translates to:
  /// **'Teen Notebook'**
  String get gradTeenNotebook;

  /// No description provided for @gradOldHat.
  ///
  /// In en, this message translates to:
  /// **'Old Hat'**
  String get gradOldHat;

  /// No description provided for @gradBurningSpring.
  ///
  /// In en, this message translates to:
  /// **'Burning Spring'**
  String get gradBurningSpring;

  /// No description provided for @gradDesertHump.
  ///
  /// In en, this message translates to:
  /// **'Desert Hump'**
  String get gradDesertHump;

  /// No description provided for @gradFarawayRiver.
  ///
  /// In en, this message translates to:
  /// **'Faraway River'**
  String get gradFarawayRiver;

  /// No description provided for @gradSaintPetersburg.
  ///
  /// In en, this message translates to:
  /// **'Saint Petersburg'**
  String get gradSaintPetersburg;

  /// No description provided for @gradAfricanField.
  ///
  /// In en, this message translates to:
  /// **'African Field'**
  String get gradAfricanField;

  /// No description provided for @gradGrassShampoo.
  ///
  /// In en, this message translates to:
  /// **'Grass Shampoo'**
  String get gradGrassShampoo;

  /// No description provided for @gradPitchBlack.
  ///
  /// In en, this message translates to:
  /// **'Pitch Black'**
  String get gradPitchBlack;

  /// No description provided for @weatherRain.
  ///
  /// In en, this message translates to:
  /// **'Rain'**
  String get weatherRain;

  /// No description provided for @weatherSnow.
  ///
  /// In en, this message translates to:
  /// **'Snow'**
  String get weatherSnow;

  /// No description provided for @weatherStorm.
  ///
  /// In en, this message translates to:
  /// **'Storm'**
  String get weatherStorm;

  /// No description provided for @weatherToday.
  ///
  /// In en, this message translates to:
  /// **'today'**
  String get weatherToday;

  /// No description provided for @weatherTomorrow.
  ///
  /// In en, this message translates to:
  /// **'tomorrow'**
  String get weatherTomorrow;

  /// No description provided for @weatherDayMon.
  ///
  /// In en, this message translates to:
  /// **'Mon'**
  String get weatherDayMon;

  /// No description provided for @weatherDayTue.
  ///
  /// In en, this message translates to:
  /// **'Tue'**
  String get weatherDayTue;

  /// No description provided for @weatherDayWed.
  ///
  /// In en, this message translates to:
  /// **'Wed'**
  String get weatherDayWed;

  /// No description provided for @weatherDayThu.
  ///
  /// In en, this message translates to:
  /// **'Thu'**
  String get weatherDayThu;

  /// No description provided for @weatherDayFri.
  ///
  /// In en, this message translates to:
  /// **'Fri'**
  String get weatherDayFri;

  /// No description provided for @weatherDaySat.
  ///
  /// In en, this message translates to:
  /// **'Sat'**
  String get weatherDaySat;

  /// No description provided for @weatherDaySun.
  ///
  /// In en, this message translates to:
  /// **'Sun'**
  String get weatherDaySun;

  /// No description provided for @noBackupDirectory.
  ///
  /// In en, this message translates to:
  /// **'Could not find any suitable directory for backup'**
  String get noBackupDirectory;

  /// No description provided for @backupFileNotFound.
  ///
  /// In en, this message translates to:
  /// **'Backup file not found at {path}'**
  String backupFileNotFound(String path);

  /// No description provided for @invalidBackupVersion.
  ///
  /// In en, this message translates to:
  /// **'Invalid backup file version'**
  String get invalidBackupVersion;

  /// No description provided for @tabHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get tabHome;

  /// No description provided for @tabApps.
  ///
  /// In en, this message translates to:
  /// **'Apps'**
  String get tabApps;

  /// No description provided for @tabInputs.
  ///
  /// In en, this message translates to:
  /// **'Inputs'**
  String get tabInputs;

  /// No description provided for @allApps.
  ///
  /// In en, this message translates to:
  /// **'All Apps'**
  String get allApps;

  /// No description provided for @cardSize.
  ///
  /// In en, this message translates to:
  /// **'Card Size'**
  String get cardSize;

  /// No description provided for @cardSizeFollow.
  ///
  /// In en, this message translates to:
  /// **'Follow section'**
  String get cardSizeFollow;

  /// No description provided for @cardSizeSmall.
  ///
  /// In en, this message translates to:
  /// **'Small'**
  String get cardSizeSmall;

  /// No description provided for @cardSizeMedium.
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get cardSizeMedium;

  /// No description provided for @cardSizeLarge.
  ///
  /// In en, this message translates to:
  /// **'Large'**
  String get cardSizeLarge;

  /// No description provided for @featured.
  ///
  /// In en, this message translates to:
  /// **'Featured'**
  String get featured;

  /// No description provided for @showFeaturedRow.
  ///
  /// In en, this message translates to:
  /// **'Featured cards'**
  String get showFeaturedRow;

  /// No description provided for @showFeaturedRowDescription.
  ///
  /// In en, this message translates to:
  /// **'Show a row of large cards on the home tab'**
  String get showFeaturedRowDescription;

  /// No description provided for @more.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get more;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'de', 'en', 'es', 'fr', 'hi', 'it', 'ja', 'ko', 'pt', 'ru', 'tr', 'uk', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'de': return AppLocalizationsDe();
    case 'en': return AppLocalizationsEn();
    case 'es': return AppLocalizationsEs();
    case 'fr': return AppLocalizationsFr();
    case 'hi': return AppLocalizationsHi();
    case 'it': return AppLocalizationsIt();
    case 'ja': return AppLocalizationsJa();
    case 'ko': return AppLocalizationsKo();
    case 'pt': return AppLocalizationsPt();
    case 'ru': return AppLocalizationsRu();
    case 'tr': return AppLocalizationsTr();
    case 'uk': return AppLocalizationsUk();
    case 'zh': return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
