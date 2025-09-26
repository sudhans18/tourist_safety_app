// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Tamil (`ta`).
class AppLocalizationsTa extends AppLocalizations {
  AppLocalizationsTa([String locale = 'ta']) : super(locale);

  @override
  String get appTitle => 'சுற்றுலாப் பாதுகாப்பு செயலி';

  @override
  String get selectLanguage =>
      'உங்களுக்கு விருப்பமான மொழியைத் தேர்ந்தெடுக்கவும்';

  @override
  String get english => 'English';

  @override
  String get hindi => 'हिंदी';

  @override
  String get continueText => 'தொடரவும்';

  @override
  String get phoneVerification => 'தொலைபேசி சரிபார்ப்பு';

  @override
  String get enterPhoneNumber => 'உங்கள் தொலைபேசி எண்ணை உள்ளிடவும்';

  @override
  String get phoneHint => '+91XXXXXXXXXX';

  @override
  String get sendOtp => 'OTP அனுப்பவும்';

  @override
  String get enterOtp => 'OTP ஐ உள்ளிடவும்';

  @override
  String get verifyOtp => 'OTP ஐ சரிபார்க்கவும்';

  @override
  String get invalidOtp => 'தவறான OTP. மீண்டும் முயற்சிக்கவும்.';

  @override
  String verificationFailed(Object error) {
    return 'சரிபார்ப்பு தோல்வியடைந்தது: $error';
  }

  @override
  String get dashboard => 'முதன்மைப் பக்கம்';

  @override
  String get settings => 'அமைப்புகள்';

  @override
  String get alerts => 'எச்சரிக்கைகள்';

  @override
  String get family => 'குடும்பம்';

  @override
  String get safetyDashboard => 'பாதுகாப்பு முதன்மைப் பக்கம்';

  @override
  String get recentAlerts => 'சமீபத்திய எச்சரிக்கைகள்';

  @override
  String get liveVitals => 'உயிர் நிலவரங்கள்';

  @override
  String get locationAndRisk => 'இடம் மற்றும் ஆபத்து மண்டலம்';

  @override
  String get restrictedZone => 'தடைசெய்யப்பட்ட மண்டலம்';

  @override
  String get lowRiskZone => 'குறைந்த ஆபத்து மண்டலம்';

  @override
  String youAreInZone(Object zone) {
    return 'நீங்கள் $zone பகுதியில் இருக்கிறீர்கள். உங்கள் சுற்றுப்புறத்தை அறிந்திருங்கள்.';
  }

  @override
  String get safeCardTitle => 'பாதுப்பானது';

  @override
  String get safeCardDesc =>
      'உங்கள் தற்போதைய பாதுகாப்பு மதிப்பெண் சிறப்பாக உள்ளது. இதைத் தொடரவும்!';

  @override
  String get tourPlan => 'சுற்றுலாத் திட்டம்';

  @override
  String get quickActions => 'விரைவுச் செயல்பாடுகள்';

  @override
  String get familyTracking => 'குடும்பத்தைக் கண்காணித்தல்';

  @override
  String get nearbyAttractions => 'அருகிலுள்ள இடங்கள்';

  @override
  String get weatherAlerts => 'வானிலை';

  @override
  String get offlineModeCached =>
      'ஆஃப்லைன் முறை - தற்காலிகத் தரவு காட்டப்படுகிறது';

  @override
  String get bandConnected => 'பேண்ட் இணைக்கப்பட்டுள்ளது';

  @override
  String lastUpdatedMins(Object mins) {
    return 'கடைசியாகப் புதுப்பித்தது: $mins நிமிடங்களுக்கு முன்பு';
  }

  @override
  String get heartRate => 'இதயத் துடிப்பு';

  @override
  String get spo2 => 'SpO₂';

  @override
  String get temperature => 'வெப்பநிலை';

  @override
  String get activity => 'செயல்பாடு';

  @override
  String get normal => 'சாதாரணமானது';

  @override
  String get last1hHeartRate => 'கடைசி 1 மணிநேர இதயத் துடிப்பு';

  @override
  String get tourPlanComingSoon => 'சுற்றுலாத் திட்டத் திரை விரைவில் வரும்';

  @override
  String comingSoon(Object feature) {
    return '$feature விரைவில் வரும்';
  }

  @override
  String get shareLocationVitals =>
      'எனது இருப்பிடம் & உயிர் நிலவரங்களைப் பகிரவும்';

  @override
  String get enableToShare => 'குடும்பத்துடன் பகிர இயக்கவும்';

  @override
  String get sosAlerts => 'SOS எச்சரிக்கைகள்';

  @override
  String get sosAlertsDesc =>
      'நீங்கள் SOS எச்சரிக்கையை இயக்கினால், உங்கள் குடும்ப உறுப்பினர்களுக்கு உடனடியாக அறிவிக்கப்படும்.';

  @override
  String get sharingWith => 'யாருடன் பகிர்கிறீர்கள்';

  @override
  String get revokeAllSharing => 'அனைத்துப் பகிர்வுகளையும் ரத்துசெய்';

  @override
  String get revokeAllSharingDesc =>
      'இது உங்கள் இருப்பிடம் மற்றும் உயிர் நிலவரங்களை அனைவருடனும் பகிர்வதை நிறுத்தும்.';

  @override
  String get severeWeatherWarning => 'கடுமையான வானிலை எச்சரிக்கை';

  @override
  String get severeWeatherDesc =>
      'தேசிய வானிலை ஆய்வு மையம் உங்கள் பகுதிக்குக் கடுமையான இடியுடன் கூடிய மழை எச்சரிக்கை விடுத்துள்ளது. உடனடியாகப் பாதுகாப்பான இடத்திற்குச் செல்லவும்.';

  @override
  String get noInternetCached =>
      'இணைய இணைப்பு இல்லை. தற்காலிக எச்சரிக்கைகள் காட்டப்படுகின்றன.';

  @override
  String get appAlert => 'செயலி எச்சரிக்கை';

  @override
  String get governmentAlert => 'அரசாங்க எச்சரிக்கை';

  @override
  String get acknowledge => 'ஒப்புக்கொள்க';

  @override
  String get moreInfo => 'மேலும் தகவல்';

  @override
  String get dismiss => 'விலக்கு';

  @override
  String get viewDetails => 'விவரங்களைக் காண்க';

  @override
  String get viewMap => 'வரைபடத்தைக் காண்க';

  @override
  String get checkVitals => 'உயிர் நிலவரங்களைச் சரிபார்க்கவும்';

  @override
  String get dismissed => 'விலக்கப்பட்டது';

  @override
  String get geoFenceWarning => 'புவி-வேலி எச்சரிக்கை';

  @override
  String get geoFenceWarningDesc =>
      'எமிலி ஹோட்டலுக்கு அருகிலுள்ள \'பாதுகாப்பான மண்டலத்தை\' விட்டு வெளியேறிவிட்டார்.';

  @override
  String get fallDetected => 'விழுதல் கண்டறியப்பட்டது';

  @override
  String get fallDetectedDesc =>
      'டேவிட் கீழே விழுந்திருக்க வாய்ப்புள்ளது கண்டறியப்பட்டது.';

  @override
  String get lowBattery => 'குறைந்த பேட்டரி';

  @override
  String get lowBatteryDesc =>
      'சாராவின் பாதுகாப்பு பேண்டில் 20% பேட்டரி உள்ளது.';

  @override
  String get geoFenceAlert => 'புவி-வேலி எச்சரிக்கை';

  @override
  String get geoFenceAlertDesc =>
      'நீங்கள் தடைசெய்யப்பட்ட பகுதியை நெருங்குகிறீர்கள். தயவுசெய்து திரும்பிச் செல்லவும் அல்லது எச்சரிக்கையுடன் தொடரவும்.';

  @override
  String get returnToSafety => 'பாதுப்பான இடத்திற்குத் திரும்பவும்';

  @override
  String get proceedWithCaution => 'எச்சரிக்கையுடன் தொடரவும்';

  @override
  String get locating => 'இடம் கண்டறியப்படுகிறது...';

  @override
  String get weather => 'வானிலை';

  @override
  String get currentWeather => 'தற்போதைய வானிலை';

  @override
  String get feelsLike => 'உணர்வது போல்';

  @override
  String get humidity => 'ஈரப்பதம்';

  @override
  String get wind => 'காற்று';

  @override
  String get today => 'இன்று';

  @override
  String get tomorrow => 'நாளை';

  @override
  String inXDays(Object days) {
    return '$days நாட்களில்';
  }

  @override
  String get nextDaysTrend => 'அடுத்த நாட்களின் வெப்பநிலை நிலவரம்';

  @override
  String get profile => 'சுயவிவரம்';

  @override
  String get verifiedMember => 'சரிபார்க்கப்பட்ட உறுப்பினர்';

  @override
  String get securityVerification => 'பாதுகாப்பு & சரிபார்ப்பு';

  @override
  String get passport => 'கடவுச்சீட்டு';

  @override
  String get wallet => 'வாலட்';

  @override
  String get personalTravelDetails => 'தனிப்பட்ட & பயண விவரங்கள்';

  @override
  String get nationality => 'தேசியம்';

  @override
  String get dateOfBirth => 'பிறந்த தேதி';

  @override
  String get itinerary => 'பயணத் திட்டம்';

  @override
  String get emergencyContacts => 'அவசரத் தொடர்புகள்';

  @override
  String get addContact => 'தொடர்பைச் சேர்க்கவும்';

  @override
  String get appSettings => 'செயலி அமைப்புகள்';

  @override
  String get notifications => 'அறிவிப்புகள்';

  @override
  String get theme => 'தீம்';

  @override
  String get language => 'மொழி';

  @override
  String get supportLegal => 'ஆதரவு & சட்டபூர்வமானது';

  @override
  String get helpCenter => 'உதவி மையம்';

  @override
  String get privacyPolicy => 'தனியுரிமைக் கொள்கை';

  @override
  String get logOut => 'வெளியேறு';

  @override
  String get connected => 'இணைக்கப்பட்டது';

  @override
  String get disconnected => 'துண்டிக்கப்பட்டது';

  @override
  String get idLabel => 'ID';

  @override
  String get band => 'பேண்ட்';

  @override
  String get sendEmergencyAlert => 'அவசர எச்சரிக்கை அனுப்பவா?';

  @override
  String get sosDialogBody =>
      'இது அதிகாரிகளுக்கும் உங்கள் அவசரத் தொடர்புகளுக்கும் அறிவிக்கும்.';

  @override
  String get cancel => 'ரத்துசெய்';

  @override
  String get sendSOS => 'SOS அனுப்பவும்';

  @override
  String get geofenceAlertShort => 'புவிவேலி எச்சரிக்கை';

  @override
  String hoursAgo(Object hours) {
    return '$hours மணிநேரம் முன்பு';
  }

  @override
  String get tagFamily => 'குடும்பம்';

  @override
  String get tagOpenAir => 'திறந்தவெளி';

  @override
  String get tagTickets => 'டிக்கெட்டுகள்';

  @override
  String get tagHistory => 'வரலாறு';

  @override
  String get tagScenic => 'கண்கவர்';

  @override
  String get tagFree => 'இலவசம்';

  @override
  String get shareLocation => 'இருப்பிடத்தைப் பகிரவும்';

  @override
  String get shareMyLocation => 'எனது இருப்பிடத்தைப் பகிரவும்';

  @override
  String get shareLocationDesc =>
      'குடும்ப உறுப்பினர்கள் உங்கள் நேரலை இருப்பிடத்தைப் பார்க்க அனுமதிக்கவும்.';

  @override
  String get sharingOptions => 'பகிர்வு விருப்பங்கள்';

  @override
  String get generateSharingToken => 'பகிர்வு QR / டோக்கனை உருவாக்கவும்';

  @override
  String get revokeAccess => 'அணுகலை ரத்துசெய்';

  @override
  String get generateSharingTokenMsg => 'பகிர்வு டோக்கனை உருவாக்கவும் (மாதிரி)';

  @override
  String get accessRevokedMsg =>
      'அனைத்து குடும்பத்தினருக்கும் அணுகல் ரத்துசெய்யப்பட்டது (மாதிரி)';

  @override
  String get settingsTheme => 'தீம்';

  @override
  String get settingsLanguage => 'மொழி';

  @override
  String get settingsNotifications => 'அறிவிப்புகள்';

  @override
  String get settingsPrivacy => 'தனியுரிமை & பாதுகாப்பு';

  @override
  String get system => 'சிஸ்டம்';

  @override
  String get light => 'ஒளி';

  @override
  String get dark => 'இருள்';

  @override
  String get mobileVerification => 'மொபைல் சரிபார்ப்பு';

  @override
  String get phoneNumber => 'தொலைபேசி எண்';

  @override
  String get pleaseEnterPhone => 'தயவுசெய்து ஒரு தொலைபேசி எண்ணை உள்ளிடவும்';

  @override
  String get pleaseSelectLanguage =>
      'தயவுசெய்து ஒரு மொழியைத் தேர்ந்தெடுக்கவும்';

  @override
  String get verificationCodeSentMock =>
      'சரிபார்ப்புக் குறியீடு அனுப்பப்பட்டது (மாதிரி). ஏதேனும் 6 இலக்கங்களை உள்ளிடவும்.';

  @override
  String get changePhoneNumber => 'தொலைபேசி எண்ணை மாற்றவும்';

  @override
  String get enterOtpPrompt =>
      'உங்கள் தொலைபேசிக்கு அனுப்பப்பட்ட 6-இலக்கக் குறியீட்டை உள்ளிடவும்';

  @override
  String get invalidOtp6 => 'தவறான OTP. தயவுசெய்து 6 இலக்கங்களை உள்ளிடவும்.';

  @override
  String get sendVerificationCode => 'சரிபார்ப்புக் குறியீட்டை அனுப்பவும்';

  @override
  String get error => 'பிழை';

  @override
  String get noData => 'தரவு இல்லை';

  @override
  String get noDataDesc => 'தற்போது தரவு எதுவும் கிடைக்கவில்லை';

  @override
  String get refresh => 'புதுப்பிக்கவும்';

  @override
  String get addNewTrip => 'புதிய பயணத்தைச் சேர்க்கவும்';

  @override
  String get noUpcomingTrips =>
      'வரவிருக்கும் பயணங்கள் எதுவும் இல்லை. ஒன்றைத் திட்டமிட \"புதிய பயணத்தைச் சேர்\" என்பதைத் தட்டவும்!';

  @override
  String get noPastTrips => 'கடந்த பயணங்கள் இல்லை';

  @override
  String get activitiesNotes => 'செயல்பாடுகள் / குறிப்புகள்';

  @override
  String get searchLocation => 'இடத்தைத் தேடவும்';

  @override
  String get search => 'தேடு';

  @override
  String get searchHint => 'இடத்தின் பெயர் அல்லது முகவரியை உள்ளிடவும்';

  @override
  String get noResultsFound => 'முடிவுகள் எதுவும் கிடைக்கவில்லை';
}
