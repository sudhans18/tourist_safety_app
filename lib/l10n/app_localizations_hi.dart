// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appTitle => 'पर्यटक सुरक्षा ऐप';

  @override
  String get selectLanguage => 'अपनी पसंदीदा भाषा चुनें';

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
  String get continueText => 'जारी रखें';

  @override
  String get phoneVerification => 'फोन सत्यापन';

  @override
  String get enterPhoneNumber => 'अपना फोन नंबर दर्ज करें';

  @override
  String get phoneHint => '+91XXXXXXXXXX';

  @override
  String get sendOtp => 'OTP भेजें';

  @override
  String get enterOtp => 'OTP दर्ज करें';

  @override
  String get verifyOtp => 'OTP सत्यापित करें';

  @override
  String get invalidOtp => 'अमान्य OTP. कृपया पुनः प्रयास करें।';

  @override
  String verificationFailed(Object error) {
    return 'सत्यापन विफल: $error';
  }

  @override
  String get dashboard => 'डैशबोर्ड';

  @override
  String get settings => 'सेटिंग्स';

  @override
  String get alerts => 'सतर्कताएँ';

  @override
  String get family => 'परिवार';

  @override
  String get safetyDashboard => 'सुरक्षा डैशबोर्ड';

  @override
  String get recentAlerts => 'हाल की সতর্কতাएँ';

  @override
  String get liveVitals => 'लाइव स्वास्थ्य संकेत';

  @override
  String get locationAndRisk => 'स्थान और जोखिम क्षेत्र';

  @override
  String get restrictedZone => 'प्रतिबंधित क्षेत्र';

  @override
  String get lowRiskZone => 'कम-जोखिम क्षेत्र';

  @override
  String youAreInZone(Object zone) {
    return 'आप $zone में हैं। अपने आसपास सतर्क रहें।';
  }

  @override
  String get safeCardTitle => 'सुरक्षित';

  @override
  String get safeCardDesc =>
      'आपका वर्तमान सुरक्षा स्कोर उत्कृष्ट है। इसे बनाए रखें!';

  @override
  String get tourPlan => 'यात्रा योजना';

  @override
  String get quickActions => 'त्वरित कार्रवाइयां';

  @override
  String get familyTracking => 'परिवार ट्रैकिंग';

  @override
  String get nearbyAttractions => 'नज़दीकी आकर्षण';

  @override
  String get weatherAlerts => 'मौसम';

  @override
  String get offlineModeCached => 'ऑफ़लाइन मोड - कैश्ड डेटा दिखाया जा रहा है';

  @override
  String get bandConnected => 'बैंड जुड़ा हुआ है';

  @override
  String lastUpdatedMins(Object mins) {
    return 'अंतिम अपडेट: $mins मिनट पहले';
  }

  @override
  String get heartRate => 'हृदय गति';

  @override
  String get spo2 => 'SpO₂';

  @override
  String get temperature => 'तापमान';

  @override
  String get activity => 'गतिविधि';

  @override
  String get normal => 'सामान्य';

  @override
  String get last1hHeartRate => 'पिछले 1 घंटे की हृदय गति';

  @override
  String get tourPlanComingSoon => 'यात्रा योजना स्क्रीन जल्द ही आ रही है';

  @override
  String comingSoon(Object feature) {
    return '$feature जल्द ही आ रहा है';
  }

  @override
  String get shareLocationVitals => 'मेरा स्थान और स्वास्थ्य संकेत साझा करें';

  @override
  String get enableToShare => 'परिवार के साथ साझा करने के लिए सक्षम करें';

  @override
  String get sosAlerts => 'SOS সতর্কতাएँ';

  @override
  String get sosAlertsDesc =>
      'यदि आप SOS अलर्ट शुरू करते हैं तो परिवार के सदस्यों को तुरंत सूचित किया जाएगा।';

  @override
  String get sharingWith => 'इनके साथ साझा किया जा रहा है';

  @override
  String get revokeAllSharing => 'सभी साझाकरण रद्द करें';

  @override
  String get revokeAllSharingDesc =>
      'यह सभी के साथ आपका स्थान और स्वास्थ्य संकेत साझा करना बंद कर देगा।';

  @override
  String get severeWeatherWarning => 'गंभीर मौसम चेतावनी';

  @override
  String get severeWeatherDesc =>
      'राष्ट्रीय मौसम सेवा ने आपके क्षेत्र के लिए गंभीर तूफान की चेतावनी जारी की है। तुरंत आश्रय लें।';

  @override
  String get noInternetCached =>
      'इंटरनेट कनेक्शन नहीं है। कैश्ड সতর্কতাएँ दिखाई जा रही हैं।';

  @override
  String get appAlert => 'ऐप अलर्ट';

  @override
  String get governmentAlert => 'सरकारी अलर्ट';

  @override
  String get acknowledge => 'स्वीकार करें';

  @override
  String get moreInfo => 'और जानकारी';

  @override
  String get dismiss => 'खारिज करें';

  @override
  String get viewDetails => 'विवरण देखें';

  @override
  String get viewMap => 'मानचित्र देखें';

  @override
  String get checkVitals => 'स्वास्थ्य संकेत देखें';

  @override
  String get dismissed => 'खारिज कर दिया गया';

  @override
  String get geoFenceWarning => 'जियो-फेंस चेतावनी';

  @override
  String get geoFenceWarningDesc =>
      'एमिली होटल के पास \'सुरक्षित क्षेत्र\' से बाहर निकल गई।';

  @override
  String get fallDetected => 'गिरने का पता चला';

  @override
  String get fallDetectedDesc => 'डेविड के गिरने की संभावना का पता चला।';

  @override
  String get lowBattery => 'बैटरी कम है';

  @override
  String get lowBatteryDesc => 'सारा के सुरक्षा बैंड की बैटरी 20% है।';

  @override
  String get geoFenceAlert => 'जियो-फेंस अलर्ट';

  @override
  String get geoFenceAlertDesc =>
      'आप एक प्रतिबंधित क्षेत्र के पास आ रहे हैं। कृपया वापस लौटें या सावधानी से आगे बढ़ें।';

  @override
  String get returnToSafety => 'सुरक्षित स्थान पर लौटें';

  @override
  String get proceedWithCaution => 'सावधानी से आगे बढ़ें';

  @override
  String get locating => 'पता लगाया जा रहा है...';

  @override
  String get weather => 'मौसम';

  @override
  String get currentWeather => 'वर्तमान मौसम';

  @override
  String get feelsLike => 'ऐसा महसूस होता है';

  @override
  String get humidity => 'आर्द्रता';

  @override
  String get wind => 'हवा';

  @override
  String get today => 'आज';

  @override
  String get tomorrow => 'कल';

  @override
  String inXDays(Object days) {
    return '$days दिनों में';
  }

  @override
  String get nextDaysTrend => 'अगले कुछ दिनों का तापमान रुझान';

  @override
  String get profile => 'प्रोफ़ाइल';

  @override
  String get verifiedMember => 'सत्यापित सदस्य';

  @override
  String get securityVerification => 'सुरक्षा और सत्यापन';

  @override
  String get passport => 'पासपोर्ट';

  @override
  String get wallet => 'वॉलेट';

  @override
  String get personalTravelDetails => 'व्यक्तिगत और यात्रा विवरण';

  @override
  String get nationality => 'राष्ट्रीयता';

  @override
  String get dateOfBirth => 'जन्म तिथि';

  @override
  String get itinerary => 'यात्रा कार्यक्रम';

  @override
  String get emergencyContacts => 'आपातकालीन संपर्क';

  @override
  String get addContact => 'संपर्क जोड़ें';

  @override
  String get appSettings => 'ऐप सेटिंग्स';

  @override
  String get notifications => 'सूचनाएं';

  @override
  String get theme => 'थीम';

  @override
  String get language => 'भाषा';

  @override
  String get supportLegal => 'सहायता और कानूनी';

  @override
  String get helpCenter => 'सहायता केंद्र';

  @override
  String get privacyPolicy => 'गोपनीयता नीति';

  @override
  String get logOut => 'लॉग आउट';

  @override
  String get connected => 'जुड़ा हुआ है';

  @override
  String get disconnected => 'संपर्क टूट गया';

  @override
  String get idLabel => 'आईडी';

  @override
  String get band => 'बैंड';

  @override
  String get sendEmergencyAlert => 'आपातकालीन अलर्ट भेजें?';

  @override
  String get sosDialogBody =>
      'यह अधिकारियों और आपके आपातकालीन संपर्कों को सूचित करेगा।';

  @override
  String get cancel => 'रद्द करें';

  @override
  String get sendSOS => 'SOS भेजें';

  @override
  String get geofenceAlertShort => 'जियोफेंस अलर्ट';

  @override
  String hoursAgo(Object hours) {
    return '$hours घंटे पहले';
  }

  @override
  String get tagFamily => 'परिवार';

  @override
  String get tagOpenAir => 'खुली हवा';

  @override
  String get tagTickets => 'टिकट';

  @override
  String get tagHistory => 'इतिहास';

  @override
  String get tagScenic => 'दर्शनीय';

  @override
  String get tagFree => 'निःशुल्क';

  @override
  String get shareLocation => 'स्थान साझा करें';

  @override
  String get shareMyLocation => 'मेरा स्थान साझा करें';

  @override
  String get shareLocationDesc =>
      'परिवार के सदस्यों को अपना लाइव स्थान देखने की अनुमति दें।';

  @override
  String get sharingOptions => 'साझा करने के विकल्प';

  @override
  String get generateSharingToken => 'साझाकरण QR / टोकन बनाएं';

  @override
  String get revokeAccess => 'पहुंच रद्द करें';

  @override
  String get generateSharingTokenMsg => 'साझाकरण टोकन बनाएं (मॉक)';

  @override
  String get accessRevokedMsg => 'सभी परिवार के लिए पहुंच रद्द कर दी गई (मॉक)';

  @override
  String get settingsTheme => 'थीम';

  @override
  String get settingsLanguage => 'भाषा';

  @override
  String get settingsNotifications => 'सूचनाएं';

  @override
  String get settingsPrivacy => 'गोपनीयता और सुरक्षा';

  @override
  String get system => 'सिस्टम';

  @override
  String get light => 'लाइट';

  @override
  String get dark => 'डार्क';

  @override
  String get mobileVerification => 'मोबाइल सत्यापन';

  @override
  String get phoneNumber => 'फोन नंबर';

  @override
  String get pleaseEnterPhone => 'कृपया फोन नंबर दर्ज करें';

  @override
  String get pleaseSelectLanguage => 'कृपया एक भाषा चुनें';

  @override
  String get verificationCodeSentMock =>
      'सत्यापन कोड भेजा गया (मॉक)। कोई भी 6 अंक दर्ज करें।';

  @override
  String get changePhoneNumber => 'फोन नंबर बदलें';

  @override
  String get enterOtpPrompt => 'आपके फोन पर भेजा गया 6-अंकीय कोड दर्ज करें';

  @override
  String get invalidOtp6 => 'अमान्य OTP. कृपया 6 अंक दर्ज करें।';

  @override
  String get sendVerificationCode => 'सत्यापन कोड भेजें';

  @override
  String get error => 'त्रुटि';

  @override
  String get noData => 'कोई डेटा नहीं';

  @override
  String get noDataDesc => 'इस समय कोई डेटा उपलब्ध नहीं है';

  @override
  String get refresh => 'रीफ्रेश करें';

  @override
  String get addNewTrip => 'नई यात्रा जोड़ें';

  @override
  String get noUpcomingTrips =>
      'कोई आगामी यात्रा नहीं। एक योजना बनाने के लिए \"नई यात्रा जोड़ें\" पर टैप करें!';

  @override
  String get noPastTrips => 'कोई पिछली यात्रा नहीं';

  @override
  String get activitiesNotes => 'गतिविधियां / नोट्स';

  @override
  String get searchLocation => 'स्थान खोजें';

  @override
  String get search => 'खोजें';

  @override
  String get searchHint => 'स्थान का नाम या पता दर्ज करें';

  @override
  String get noResultsFound => 'कोई परिणाम नहीं मिला';
}
