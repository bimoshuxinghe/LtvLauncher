import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get aboutFlauncher => 'LTvLauncher 정보';

  @override
  String get addCategory => '카테고리 추가';

  @override
  String get addSection => '섹션 추가';

  @override
  String get alphabetical => '알파벳순';

  @override
  String get appCardHighlightAnimation => '앱 카드 하이라이트 애니메이션';

  @override
  String get appInfo => '앱 정보';

  @override
  String get appKeyClick => '키 누름 시 클릭 소리';

  @override
  String get applications => '애플리케이션';

  @override
  String get autoHideAppBar => '상태 표시줄 자동 숨기기';

  @override
  String get backButtonAction => '뒤로 버튼 동작';

  @override
  String get category => '카테고리';

  @override
  String get categories => '카테고리';

  @override
  String get columnCount => '열 수';

  @override
  String get date => '날짜';

  @override
  String get dateAndTimeFormat => '날짜 및 시간 형식';

  @override
  String get delete => '삭제';

  @override
  String get dialogOptionBackButtonActionDoNothing => '아무 작업 안 함';

  @override
  String get dialogOptionBackButtonActionShowScreensaver => '화면 보호기 표시';

  @override
  String get dialogOptionBackButtonActionShowClock => '시계 표시';

  @override
  String get dialogTextNoFileExplorer => '사진을 선택하려면 파일 탐색기를 설치하세요.';

  @override
  String get dialogTitleBackButtonAction => '뒤로 버튼 동작 선택';

  @override
  String disambiguateCategoryTitle(String title) {
    return '$title (카테고리)';
  }

  @override
  String formattedDate(String dateString) {
    return '포맷된 날짜: $dateString';
  }

  @override
  String formattedTime(String timeString) {
    return '포맷된 시간: $timeString';
  }

  @override
  String get gradient => '그라데이션';

  @override
  String get favoriteApps => '즐겨찾는 앱';

  @override
  String get grid => '그리드';

  @override
  String get height => '높이';

  @override
  String get hide => '숨기기';

  @override
  String get hiddenApplications => '숨겨진 앱';

  @override
  String get launcherSections => '섹션';

  @override
  String get layout => '레이아웃';

  @override
  String get loading => '로딩 중';

  @override
  String get manual => '수동';

  @override
  String get modifySection => '섹션 수정';

  @override
  String get mustNotBeEmpty => '비워둘 수 없습니다';

  @override
  String get name => '이름';

  @override
  String get newSection => '새 섹션';

  @override
  String get noDateFormatSpecified => '날짜 형식이 지정되지 않음';

  @override
  String get noTimeFormatSpecified => '시간 형식이 지정되지 않음';

  @override
  String get nonTvApplications => '비 TV 앱';

  @override
  String get open => '열기';

  @override
  String get orSelectFormatSpecifiers => '또는 형식 지정자 선택';

  @override
  String get picture => '사진';

  @override
  String removeFrom(String name) {
    return '$name에서 제거';
  }

  @override
  String get renameCategory => '카테고리 이름 변경';

  @override
  String get reorder => '재정렬';

  @override
  String get row => '행';

  @override
  String get rowHeight => '행 높이';

  @override
  String get save => '저장';

  @override
  String get spacer => '간격';

  @override
  String get spacerMaxHeightRequirement => '0보다 크고 500 이하여야 합니다';

  @override
  String get statusBar => '상태 표시줄';

  @override
  String get settings => '설정';

  @override
  String get show => '표시';

  @override
  String get showCategoryTitles => '카테고리 제목 표시';

  @override
  String get themes => '테마';

  @override
  String get hideHighlightOutlineOnHomescreen => '홈 화면에서 하이라이트 윤곽선 숨기기';

  @override
  String get appSelectorTransitionAnimation => '앱 선택기 전환 애니메이션';

  @override
  String get sort => '정렬';

  @override
  String get systemSettings => '시스템 설정';

  @override
  String textAboutDialog(String repoUrl) {
    return 'LTvLauncher는 FLauncher를 기반으로 한 Android TV용 맞춤형 오픈 소스 런처입니다.\n\nLeanBitLab에서 개발했습니다.\n소스 코드는 $repoUrl에서 사용할 수 있습니다.';
  }

  @override
  String get textEmptyCategory => '이 카테고리는 비어 있습니다.';

  @override
  String get time => '시간';

  @override
  String get titleStatusBarSettingsPage => '상태 표시줄에 표시할 내용 선택';

  @override
  String get tvApplications => 'TV 앱';

  @override
  String get type => '유형';

  @override
  String get typeInTheDateFormat => '날짜 형식 입력';

  @override
  String get typeInTheHourFormat => '시간 형식 입력';

  @override
  String get uninstall => '제거';

  @override
  String get wallpaper => '배경화면';

  @override
  String get withEllipsisAddTo => '추가...';

  @override
  String get timeBasedWallpaper => '시간 기반 배경화면';

  @override
  String get pickDayWallpaper => '주간 배경화면 선택';

  @override
  String get pickNightWallpaper => '야간 배경화면 선택';

  @override
  String get accessibility => '접근성';

  @override
  String get defaultLauncherIsDefault => 'LTvLauncher가 기본 런처입니다';

  @override
  String get defaultLauncherNotDefault => 'LTvLauncher가 기본 런처가 아닙니다';

  @override
  String get setAsDefaultLauncher => '기본 런처로 설정';

  @override
  String get defaultLauncherDescription => '기본 런처로 설정하면 홈 버튼은 항상 LTvLauncher로 돌아갑니다. TV도 직접 LTvLauncher로 부팅됩니다.';

  @override
  String get inputs => '입력';

  @override
  String get inputSources => '입력 소스';

  @override
  String get backupAndRestore => '백업 및 복원';

  @override
  String get exportBackup => '백업 내보내기';

  @override
  String get importBackup => '백업 가져오기';

  @override
  String exportSuccess(String path) {
    return '백업이 $path로 성공적으로 내보내졌습니다';
  }

  @override
  String get importSuccess => '백업을 성공적으로 가져왔습니다';

  @override
  String get importConfirm => '백업을 가져오시겠습니까? 현재 설정 및 레이아웃을 덮어씁니다.';

  @override
  String importError(String error) {
    return '백업 가져오기 실패: $error';
  }

  @override
  String exportError(String error) {
    return '백업 내보내기 실패: $error';
  }

  @override
  String get shareBackup => '백업 공유';

  @override
  String get shareBackupDescription => '로컬 네트워크의 다른 기기와 백업 공유';

  @override
  String get stopSharing => '공유 중지';

  @override
  String get localNetworkSharingActive => '로컬 네트워크 공유가 활성화되었습니다!';

  @override
  String get localNetworkSharingInstructions => '다른 기기를 동일한 Wi-Fi 네트워크에 연결하고 웹 브라우저에서 다음 URL을 엽니다.';

  @override
  String get localNetworkSharingDetails => '여기에서 TV 설정/레이아웃을 다운로드하거나 이 TV로 백업 파일을 업로드할 수 있습니다.';

  @override
  String failedToStartServer(String error) {
    return '공유 서버 시작 실패: $error';
  }

  @override
  String get notificationBell => '알림 벨';

  @override
  String get autoHideNotificationBell => '알림 벨 자동 숨기기';

  @override
  String get continueWatching => '계속 시청';

  @override
  String get showContinueWatchingOnHome => '홈에서 계속 시청 표시';

  @override
  String get permissionDeniedContinueWatching => '계속 시청을 표시하려면 권한이 필요합니다';

  @override
  String get interface => '인터페이스';

  @override
  String get system => '시스템';

  @override
  String get accentColor => '강조 색상';

  @override
  String get miscellaneous => '기타';

  @override
  String get brightnessScheduler => '밝기 스케줄러';

  @override
  String get screensaverSettings => '화면 보호기 설정';

  @override
  String get screensaverClockStyle => '화면 보호기 시계 스타일';

  @override
  String get dataUsagePeriod => '데이터 사용 기간';

  @override
  String get notificationAccess => '알림 액세스';

  @override
  String get granted => '부여됨';

  @override
  String get permissionRequired => '권한 필요';

  @override
  String get systemWidePopupAlert => '시스템 전체 팝업 알림';

  @override
  String get overlayPermissionRequired => '오버레이 권한 필요';

  @override
  String get enabled => '사용 설정됨';

  @override
  String get disabled => '사용 중지됨';

  @override
  String get showAppNamesBelowIcons => '아이콘 아래에 앱 이름 표시';

  @override
  String get dataUsage => '데이터 사용량';

  @override
  String get networkIndicator => '네트워크 표시기';

  @override
  String get homeButtonFix => '홈 버튼 수정 (Google TV)';

  @override
  String get appLanguage => '언어';

  @override
  String get systemDefault => '시스템 기본값';

  @override
  String get english => '영어';

  @override
  String get spanish => '스페인어';

  @override
  String get ukrainian => '우크라이나어';

  @override
  String get chinese => '중국어';

  @override
  String get french => '프랑스어';

  @override
  String get german => '독일어';

  @override
  String get japanese => '일본어';

  @override
  String get portuguese => '포르투갈어';

  @override
  String get russian => '러시아어';

  @override
  String get italian => '이탈리아어';

  @override
  String get hindi => '힌디어';

  @override
  String get korean => '한국어';

  @override
  String get arabic => '아랍어';

  @override
  String get turkish => '터키어';

  @override
  String get hidePersistentNotifications => '고정 알림 숨기기';

  @override
  String get hidePersistentNotificationsDesc => '백그라운드 서비스 및 시스템 고정 알림 숨기기';

  @override
  String get blockedNotificationApps => '차단된 앱';

  @override
  String get blockAppNotifications => '알림 차단';

  @override
  String get unblockAppNotifications => '알림 차단 해제';

  @override
  String get noBlockedApps => '차단된 앱이 없습니다';

  @override
  String get persistentNotification => '고정';

  @override
  String get unblockAll => '모두 차단 해제';

  @override
  String get weather => '날씨';

  @override
  String get showWeatherWarnings => '날씨 및 강우 경보 표시';

  @override
  String get temperatureUnit => '온도 단위';

  @override
  String get celsius => '섭씨 (°C)';

  @override
  String get fahrenheit => '화씨 (°F)';

  @override
  String get breezyWeatherSetupHint => 'Breezy Weather를 설치하고 설정에서 \'로컬 데이터 공유\' / \'Gadgetbridge\'를 활성화하면 날씨 및 강우 경보가 표시됩니다.';

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
  String get more => '더 보기';
}
