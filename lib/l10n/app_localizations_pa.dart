// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Panjabi Punjabi (`pa`).
class AppLocalizationsPa extends AppLocalizations {
  AppLocalizationsPa([String locale = 'pa']) : super(locale);

  @override
  String get appTitle => 'ਸੈਲਾਨੀ ਸੁਰੱਖਿਆ ਐਪ';

  @override
  String get selectLanguage => 'ਆਪਣੀ ਪਸੰਦੀਦਾ ਭਾਸ਼ਾ ਚੁਣੋ';

  @override
  String get english => 'English';

  @override
  String get hindi => 'हिंदी';

  @override
  String get assamese => 'অসমীয়া';

  @override
  String get bengali => 'বাংলা';

  @override
  String get tamil => 'தமிழ்';

  @override
  String get telugu => 'తెలుగు';

  @override
  String get gujarati => 'ગુજરાતી';

  @override
  String get punjabi => 'ਪੰਜਾਬੀ';

  @override
  String get kannada => 'ಕನ್ನಡ';

  @override
  String get malayalam => 'മലയാളം';

  @override
  String get marathi => 'मराठी';

  @override
  String get urdu => 'اردو';

  @override
  String get french => 'Français';

  @override
  String get german => 'Deutsch';

  @override
  String get chinese => '中文';

  @override
  String get nepali => 'नेपाली';

  @override
  String get continueText => 'ਜਾਰੀ ਰੱਖੋ';

  @override
  String get phoneVerification => 'ਫ਼ੋਨ ਤਸਦੀਕ';

  @override
  String get enterPhoneNumber => 'ਆਪਣਾ ਫ਼ੋਨ ਨੰਬਰ ਦਾਖਲ ਕਰੋ';

  @override
  String get phoneHint => '+91XXXXXXXXXX';

  @override
  String get sendOtp => 'OTP ਭੇਜੋ';

  @override
  String get enterOtp => 'OTP ਦਾਖਲ ਕਰੋ';

  @override
  String get verifyOtp => 'OTP ਦੀ ਤਸਦੀਕ ਕਰੋ';

  @override
  String get invalidOtp => 'ਅਵੈਧ OTP। ਕਿਰਪਾ ਕਰਕੇ ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ।';

  @override
  String verificationFailed(Object error) {
    return 'ਤਸਦੀਕ ਅਸਫ਼ਲ: $error';
  }

  @override
  String get dashboard => 'ਡੈਸ਼ਬੋਰਡ';

  @override
  String get settings => 'ਸੈਟਿੰਗਾਂ';

  @override
  String get alerts => 'ਚਿਤਾਵਨੀਆਂ';

  @override
  String get family => 'ਪਰਿਵਾਰ';

  @override
  String get safetyDashboard => 'ਸੁਰੱਖਿਆ ਡੈਸ਼ਬੋਰਡ';

  @override
  String get recentAlerts => 'ਹਾਲੀਆ ਚਿਤਾਵਨੀਆਂ';

  @override
  String get liveVitals => 'ਲਾਈਵ ਵਾਈਟਲਜ਼';

  @override
  String get locationAndRisk => 'ਸਥਾਨ ਅਤੇ ਜੋਖਮ ਖੇਤਰ';

  @override
  String get restrictedZone => 'ਪਾਬੰਦੀਸ਼ੁਦਾ ਖੇਤਰ';

  @override
  String get lowRiskZone => 'ਘੱਟ-ਜੋਖਮ ਵਾਲਾ ਖੇਤਰ';

  @override
  String youAreInZone(Object zone) {
    return 'ਤੁਸੀਂ $zone ਵਿੱਚ ਹੋ। ਆਪਣੇ ਆਲੇ-ਦੁਆਲੇ ਤੋਂ ਸੁਚੇਤ ਰਹੋ।';
  }

  @override
  String get safeCardTitle => 'ਸੁਰੱਖਿਅਤ';

  @override
  String get safeCardDesc =>
      'ਤੁਹਾਡਾ ਮੌਜੂਦਾ ਸੁਰੱਖਿਆ ਸਕੋਰ ਸ਼ਾਨਦਾਰ ਹੈ। ਇਸਨੂੰ ਜਾਰੀ ਰੱਖੋ!';

  @override
  String get tourPlan => 'ਟੂਰ ਯੋਜਨਾ';

  @override
  String get quickActions => 'ਤੁਰੰਤ ਕਾਰਵਾਈਆਂ';

  @override
  String get familyTracking => 'ਪਰਿਵਾਰਕ ਟ੍ਰੈਕਿੰਗ';

  @override
  String get nearbyAttractions => 'ਨੇੜਲੇ ਆਕਰਸ਼ਣ';

  @override
  String get weatherAlerts => 'ਮੌਸਮ';

  @override
  String get offlineModeCached =>
      'ਔਫਲਾਈਨ ਮੋਡ - ਕੈਸ਼ ਕੀਤਾ ਡਾਟਾ ਦਿਖਾਇਆ ਜਾ ਰਿਹਾ ਹੈ';

  @override
  String get bandConnected => 'ਬੈਂਡ ਕਨੈਕਟ ਹੈ';

  @override
  String lastUpdatedMins(Object mins) {
    return 'ਆਖਰੀ ਵਾਰ ਅੱਪਡੇਟ ਕੀਤਾ ਗਿਆ: $mins ਮਿੰਟ ਪਹਿਲਾਂ';
  }

  @override
  String get heartRate => 'ਦਿਲ ਦੀ ਧੜਕਣ';

  @override
  String get spo2 => 'SpO₂';

  @override
  String get temperature => 'ਤਾਪਮਾਨ';

  @override
  String get activity => 'ਗਤੀਵਿਧੀ';

  @override
  String get normal => 'ਆਮ';

  @override
  String get last1hHeartRate => 'ਪਿਛਲੇ 1 ਘੰਟੇ ਦੀ ਦਿਲ ਦੀ ਧੜਕਣ';

  @override
  String get tourPlanComingSoon => 'ਟੂਰ ਯੋਜਨਾ ਸਕ੍ਰੀਨ ਜਲਦੀ ਆ ਰਹੀ ਹੈ';

  @override
  String comingSoon(Object feature) {
    return '$feature ਜਲਦੀ ਆ ਰਿਹਾ ਹੈ';
  }

  @override
  String get shareLocationVitals => 'ਮੇਰਾ ਸਥਾਨ ਅਤੇ ਵਾਈਟਲਜ਼ ਸਾਂਝਾ ਕਰੋ';

  @override
  String get enableToShare => 'ਪਰਿਵਾਰ ਨਾਲ ਸਾਂਝਾ ਕਰਨ ਲਈ ਸਮਰੱਥ ਕਰੋ';

  @override
  String get sosAlerts => 'SOS ਚਿਤਾਵਨੀਆਂ';

  @override
  String get sosAlertsDesc =>
      'ਜੇਕਰ ਤੁਸੀਂ SOS ਚਿਤਾਵਨੀ ਸ਼ੁਰੂ ਕਰਦੇ ਹੋ ਤਾਂ ਪਰਿਵਾਰਕ ਮੈਂਬਰਾਂ ਨੂੰ ਤੁਰੰਤ ਸੂਚਿਤ ਕੀਤਾ ਜਾਵੇਗਾ।';

  @override
  String get sharingWith => 'ਇਸ ਨਾਲ ਸਾਂਝਾ ਕੀਤਾ ਜਾ ਰਿਹਾ ਹੈ';

  @override
  String get revokeAllSharing => 'ਸਾਰੀ ਸਾਂਝ ਰੱਦ ਕਰੋ';

  @override
  String get revokeAllSharingDesc =>
      'ਇਹ ਹਰ ਕਿਸੇ ਨਾਲ ਤੁਹਾਡੇ ਸਥਾਨ ਅਤੇ ਵਾਈਟਲਜ਼ ਨੂੰ ਸਾਂਝਾ ਕਰਨਾ ਬੰਦ ਕਰ ਦੇਵੇਗਾ।';

  @override
  String get severeWeatherWarning => 'ਗੰਭੀਰ ਮੌਸਮ ਦੀ ਚਿਤਾਵਨੀ';

  @override
  String get severeWeatherDesc =>
      'ਰਾਸ਼ਟਰੀ ਮੌਸਮ ਸੇਵਾ ਨੇ ਤੁਹਾਡੇ ਖੇਤਰ ਲਈ ਗੰਭੀਰ ਤੂਫ਼ਾਨ ਦੀ ਚਿਤਾਵਨੀ ਜਾਰੀ ਕੀਤੀ ਹੈ। ਤੁਰੰਤ ਪਨਾਹ ਲਵੋ।';

  @override
  String get noInternetCached =>
      'ਕੋਈ ਇੰਟਰਨੈਟ ਕਨੈਕਸ਼ਨ ਨਹੀਂ ਹੈ। ਕੈਸ਼ ਕੀਤੀਆਂ ਚਿਤਾਵਨੀਆਂ ਦਿਖਾਈਆਂ ਜਾ ਰਹੀਆਂ ਹਨ।';

  @override
  String get appAlert => 'ਐਪ ਚਿਤਾਵਨੀ';

  @override
  String get governmentAlert => 'ਸਰਕਾਰੀ ਚਿਤਾਵਨੀ';

  @override
  String get acknowledge => 'ਸਵੀਕਾਰ ਕਰੋ';

  @override
  String get moreInfo => 'ਹੋਰ ਜਾਣਕਾਰੀ';

  @override
  String get dismiss => 'ਖਾਰਜ ਕਰੋ';

  @override
  String get viewDetails => 'ਵੇਰਵੇ ਵੇਖੋ';

  @override
  String get viewMap => 'ਨਕਸ਼ਾ ਵੇਖੋ';

  @override
  String get checkVitals => 'ਵਾਈਟਲਜ਼ ਦੀ ਜਾਂਚ ਕਰੋ';

  @override
  String get dismissed => 'ਖਾਰਜ ਕਰ ਦਿੱਤਾ';

  @override
  String get geoFenceWarning => 'ਜੀਓ-ਫੈਂਸ ਚਿਤਾਵਨੀ';

  @override
  String get geoFenceWarningDesc =>
      'ਐਮਿਲੀ ਹੋਟਲ ਦੇ ਨੇੜੇ \'ਸੁਰੱਖਿਅਤ ਜ਼ੋਨ\' ਤੋਂ ਬਾਹਰ ਚਲੀ ਗਈ।';

  @override
  String get fallDetected => 'ਡਿੱਗਣ ਦਾ ਪਤਾ ਲੱਗਾ';

  @override
  String get fallDetectedDesc => 'ਡੇਵਿਡ ਦੇ ਸੰਭਾਵੀ ਡਿੱਗਣ ਦਾ ਪਤਾ ਲੱਗਾ ਹੈ।';

  @override
  String get lowBattery => 'ਬੈਟਰੀ ਘੱਟ ਹੈ';

  @override
  String get lowBatteryDesc => 'ਸਾਰਾਹ ਦੇ ਸੇਫਟੀ ਬੈਂਡ ਦੀ ਬੈਟਰੀ 20% \'ਤੇ ਹੈ।';

  @override
  String get geoFenceAlert => 'ਜੀਓ-ਫੈਂਸ ਚਿਤਾਵਨੀ';

  @override
  String get geoFenceAlertDesc =>
      'ਤੁਸੀਂ ਇੱਕ ਪਾਬੰਦੀਸ਼ੁਦਾ ਖੇਤਰ ਦੇ ਨੇੜੇ ਪਹੁੰਚ ਰਹੇ ਹੋ। ਕਿਰਪਾ ਕਰਕੇ ਪਿੱਛੇ ਮੁੜੋ ਜਾਂ ਸਾਵਧਾਨੀ ਨਾਲ ਅੱਗੇ ਵਧੋ।';

  @override
  String get returnToSafety => 'ਸੁਰੱਖਿਆ \'ਤੇ ਵਾਪਸ ਜਾਓ';

  @override
  String get proceedWithCaution => 'ਸਾਵਧਾਨੀ ਨਾਲ ਅੱਗੇ ਵਧੋ';

  @override
  String get locating => 'ਸਥਾਨ ਲੱਭਿਆ ਜਾ ਰਿਹਾ ਹੈ...';

  @override
  String get weather => 'ਮੌਸਮ';

  @override
  String get currentWeather => 'ਮੌਜੂਦਾ ਮੌਸਮ';

  @override
  String get feelsLike => 'ਮਹਿਸੂਸ ਹੁੰਦਾ ਹੈ';

  @override
  String get humidity => 'ਨਮੀ';

  @override
  String get wind => 'ਹਵਾ';

  @override
  String get today => 'ਅੱਜ';

  @override
  String get tomorrow => 'ਕੱਲ੍ਹ';

  @override
  String inXDays(Object days) {
    return '$days ਦਿਨਾਂ ਵਿੱਚ';
  }

  @override
  String get nextDaysTrend => 'ਅਗਲੇ ਦਿਨਾਂ ਦਾ ਤਾਪਮਾਨ ਰੁਝਾਨ';

  @override
  String get profile => 'ਪ੍ਰੋਫਾਈਲ';

  @override
  String get verifiedMember => 'ਤਸਦੀਕਸ਼ੁਦਾ ਮੈਂਬਰ';

  @override
  String get securityVerification => 'ਸੁਰੱਖਿਆ ਅਤੇ ਤਸਦੀਕ';

  @override
  String get passport => 'ਪਾਸਪੋਰਟ';

  @override
  String get wallet => 'ਵਾਲਿਟ';

  @override
  String get personalTravelDetails => 'ਨਿੱਜੀ ਅਤੇ ਯਾਤਰਾ ਦੇ ਵੇਰਵੇ';

  @override
  String get nationality => 'ਕੌਮੀਅਤ';

  @override
  String get dateOfBirth => 'ਜਨਮ ਤਾਰੀਖ';

  @override
  String get itinerary => 'ਯਾਤਰਾ-ਪ੍ਰੋਗਰਾਮ';

  @override
  String get emergencyContacts => 'ਐਮਰਜੈਂਸੀ ਸੰਪਰਕ';

  @override
  String get addContact => 'ਸੰਪਰਕ ਸ਼ਾਮਲ ਕਰੋ';

  @override
  String get appSettings => 'ਐਪ ਸੈਟਿੰਗਾਂ';

  @override
  String get notifications => 'ਸੂਚਨਾਵਾਂ';

  @override
  String get theme => 'ਥੀਮ';

  @override
  String get language => 'ਭਾਸ਼ਾ';

  @override
  String get supportLegal => 'ਸਹਾਇਤਾ ਅਤੇ ਕਾਨੂੰਨੀ';

  @override
  String get helpCenter => 'ਸਹਾਇਤਾ ਕੇਂਦਰ';

  @override
  String get privacyPolicy => 'ਗੋਪਨੀਯਤਾ ਨੀਤੀ';

  @override
  String get logOut => 'ਲੌਗ ਆਉਟ';

  @override
  String get connected => 'ਕਨੈਕਟ ਕੀਤਾ';

  @override
  String get disconnected => 'ਡਿਸਕਨੈਕਟ ਕੀਤਾ';

  @override
  String get idLabel => 'ਆਈਡੀ';

  @override
  String get band => 'ਬੈਂਡ';

  @override
  String get sendEmergencyAlert => 'ਐਮਰਜੈਂਸੀ ਚਿਤਾਵਨੀ ਭੇਜਣੀ ਹੈ?';

  @override
  String get sosDialogBody =>
      'ਇਹ ਅਧਿਕਾਰੀਆਂ ਅਤੇ ਤੁਹਾਡੇ ਐਮਰਜੈਂਸੀ ਸੰਪਰਕਾਂ ਨੂੰ ਸੂਚਿਤ ਕਰੇਗਾ।';

  @override
  String get cancel => 'ਰੱਦ ਕਰੋ';

  @override
  String get sendSOS => 'SOS ਭੇਜੋ';

  @override
  String get geofenceAlertShort => 'ਜੀਓਫੈਂਸ ਚਿਤਾਵਨੀ';

  @override
  String hoursAgo(Object hours) {
    return '$hours ਘੰਟੇ ਪਹਿਲਾਂ';
  }

  @override
  String get tagFamily => 'ਪਰਿਵਾਰ';

  @override
  String get tagOpenAir => 'ਖੁੱਲ੍ਹੀ ਹਵਾ';

  @override
  String get tagTickets => 'ਟਿਕਟਾਂ';

  @override
  String get tagHistory => 'ਇਤਿਹਾਸ';

  @override
  String get tagScenic => 'ਸੁੰਦਰ';

  @override
  String get tagFree => 'ਮੁਫ਼ਤ';

  @override
  String get shareLocation => 'ਸਥਾਨ ਸਾਂਝਾ ਕਰੋ';

  @override
  String get shareMyLocation => 'ਮੇਰਾ ਸਥਾਨ ਸਾਂਝਾ ਕਰੋ';

  @override
  String get shareLocationDesc =>
      'ਪਰਿਵਾਰਕ ਮੈਂਬਰਾਂ ਨੂੰ ਤੁਹਾਡਾ ਲਾਈਵ ਸਥਾਨ ਦੇਖਣ ਦੀ ਆਗਿਆ ਦਿਓ।';

  @override
  String get sharingOptions => 'ਸਾਂਝਾਕਰਨ ਵਿਕਲਪ';

  @override
  String get generateSharingToken => 'ਸਾਂਝਾਕਰਨ QR / ਟੋਕਨ ਬਣਾਓ';

  @override
  String get revokeAccess => 'ਪਹੁੰਚ ਰੱਦ ਕਰੋ';

  @override
  String get generateSharingTokenMsg => 'ਸਾਂਝਾਕਰਨ ਟੋਕਨ ਬਣਾਓ (ਮੌਕ)';

  @override
  String get accessRevokedMsg => 'ਸਾਰੇ ਪਰਿਵਾਰ ਲਈ ਪਹੁੰ-ਚ ਰੱਦ ਕਰ ਦਿੱਤੀ ਗਈ (ਮੌਕ)';

  @override
  String get settingsTheme => 'ਥੀਮ';

  @override
  String get settingsLanguage => 'ਭਾਸ਼ਾ';

  @override
  String get settingsNotifications => 'ਸੂਚਨਾਵਾਂ';

  @override
  String get settingsPrivacy => 'ਗੋਪਨੀਯਤਾ ਅਤੇ ਸੁਰੱਖਿਆ';

  @override
  String get system => 'ਸਿਸਟਮ';

  @override
  String get light => 'ਲਾਈਟ';

  @override
  String get dark => 'ਡਾਰਕ';

  @override
  String get mobileVerification => 'ਮੋਬਾਈਲ ਤਸਦੀਕ';

  @override
  String get phoneNumber => 'ਫ਼ੋਨ ਨੰਬਰ';

  @override
  String get pleaseEnterPhone => 'ਕਿਰਪਾ ਕਰਕੇ ਇੱਕ ਫ਼ੋਨ ਨੰਬਰ ਦਾਖਲ ਕਰੋ';

  @override
  String get pleaseSelectLanguage => 'ਕਿਰਪਾ ਕਰਕੇ ਇੱਕ ਭਾਸ਼ਾ ਚੁਣੋ';

  @override
  String get verificationCodeSentMock =>
      'ਤਸਦੀਕ ਕੋਡ ਭੇਜਿਆ ਗਿਆ (ਮੌਕਡ)। ਕੋਈ ਵੀ 6 ਅੰਕ ਦਾਖਲ ਕਰੋ।';

  @override
  String get changePhoneNumber => 'ਫ਼ੋਨ ਨੰਬਰ ਬਦਲੋ';

  @override
  String get enterOtpPrompt =>
      'ਆਪਣੇ ਫ਼ੋਨ \'ਤੇ ਭੇਜਿਆ ਗਿਆ 6-ਅੰਕਾਂ ਵਾਲਾ ਕੋਡ ਦਾਖਲ ਕਰੋ';

  @override
  String get invalidOtp6 => 'ਅਵੈਧ OTP। ਕਿਰਪਾ ਕਰਕੇ 6 ਅੰਕ ਦਾਖਲ ਕਰੋ।';

  @override
  String get sendVerificationCode => 'ਤਸਦੀਕ ਕੋਡ ਭੇਜੋ';

  @override
  String get error => 'ਗਲਤੀ';

  @override
  String get noData => 'ਕੋਈ ਡਾਟਾ ਨਹੀਂ';

  @override
  String get noDataDesc => 'ਇਸ ਸਮੇਂ ਕੋਈ ਡਾਟਾ ਉਪਲਬਧ ਨਹੀਂ ਹੈ';

  @override
  String get refresh => 'ਰਿਫਰੈਸ਼ ਕਰੋ';

  @override
  String get addNewTrip => 'ਨਵੀਂ ਯਾਤਰਾ ਸ਼ਾਮਲ ਕਰੋ';

  @override
  String get noUpcomingTrips =>
      'ਕੋਈ ਆਉਣ ਵਾਲੀ ਯਾਤਰਾ ਨਹੀਂ। ਯੋਜਨਾ ਬਣਾਉਣ ਲਈ \"ਨਵੀਂ ਯਾਤਰਾ ਸ਼ਾਮਲ ਕਰੋ\" \'ਤੇ ਟੈਪ ਕਰੋ!';

  @override
  String get noPastTrips => 'ਕੋਈ ਪਿਛਲੀ ਯਾਤਰਾ ਨਹੀਂ';

  @override
  String get activitiesNotes => 'ਗਤੀਵਿਧੀਆਂ / ਨੋਟਸ';

  @override
  String get searchLocation => 'ਸਥਾਨ ਖੋਜੋ';

  @override
  String get search => 'ਖੋਜ';

  @override
  String get searchHint => 'ਸਥਾਨ ਦਾ ਨਾਮ ਜਾਂ ਪਤਾ ਦਾਖਲ ਕਰੋ';

  @override
  String get noResultsFound => 'ਕੋਈ ਨਤੀਜਾ ਨਹੀਂ ਮਿਲਿਆ';
}
