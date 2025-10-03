// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Marathi (`mr`).
class AppLocalizationsMr extends AppLocalizations {
  AppLocalizationsMr([String locale = 'mr']) : super(locale);

  @override
  String get appTitle => 'पर्यटक सुरक्षा ॲप';

  @override
  String get selectLanguage => 'तुमची आवडती भाषा निवडा';

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
  String get continueText => 'पुढे जा';

  @override
  String get phoneVerification => 'फोन पडताळणी';

  @override
  String get enterPhoneNumber => 'तुमचा फोन नंबर टाका';

  @override
  String get phoneHint => '+91XXXXXXXXXX';

  @override
  String get sendOtp => 'OTP पाठवा';

  @override
  String get enterOtp => 'OTP टाका';

  @override
  String get verifyOtp => 'OTP सत्यापित करा';

  @override
  String get invalidOtp => 'अवैध OTP. कृपया पुन्हा प्रयत्न करा.';

  @override
  String verificationFailed(Object error) {
    return 'पडताळणी अयशस्वी: $error';
  }

  @override
  String get dashboard => 'डॅशबोर्ड';

  @override
  String get settings => 'सेटिंग्ज';

  @override
  String get alerts => 'सूचना';

  @override
  String get family => 'कुटुंब';

  @override
  String get safetyDashboard => 'सुरक्षा डॅशबोर्ड';

  @override
  String get recentAlerts => 'अलीकडील सूचना';

  @override
  String get liveVitals => 'लाइव्ह व्हायटल्स';

  @override
  String get locationAndRisk => 'स्थान आणि जोखीम क्षेत्र';

  @override
  String get restrictedZone => 'प्रतिबंधित क्षेत्र';

  @override
  String get lowRiskZone => 'कमी जोखमीचे क्षेत्र';

  @override
  String youAreInZone(Object zone) {
    return 'तुम्ही $zone मध्ये आहात. तुमच्या सभोवतालच्या परिस्थितीबद्दल जागरूक रहा.';
  }

  @override
  String get safeCardTitle => 'सुरक्षित';

  @override
  String get safeCardDesc =>
      'तुमचा सध्याचा सुरक्षा स्कोअर उत्कृष्ट आहे. तो कायम ठेवा!';

  @override
  String get tourPlan => 'प्रवासाची योजना';

  @override
  String get quickActions => 'त्वरित कृती';

  @override
  String get familyTracking => 'कौटुंबिक ट्रॅकिंग';

  @override
  String get nearbyAttractions => 'जवळची आकर्षणे';

  @override
  String get weatherAlerts => 'हवामान';

  @override
  String get offlineModeCached => 'ऑफलाइन मोड - कॅश केलेला डेटा दर्शवत आहे';

  @override
  String get bandConnected => 'बँड कनेक्ट झाला आहे';

  @override
  String lastUpdatedMins(Object mins) {
    return 'शेवटचे अपडेट: $mins मिनिटांपूर्वी';
  }

  @override
  String get heartRate => 'हृदयाचे ठोके';

  @override
  String get spo2 => 'SpO₂';

  @override
  String get temperature => 'तापमान';

  @override
  String get activity => 'क्रियाकलाप';

  @override
  String get normal => 'सामान्य';

  @override
  String get last1hHeartRate => 'मागील १ तासातील हृदयाचे ठोके';

  @override
  String get tourPlanComingSoon => 'प्रवासाची योजना स्क्रीन लवकरच येत आहे';

  @override
  String comingSoon(Object feature) {
    return '$feature लवकरच येत आहे';
  }

  @override
  String get shareLocationVitals => 'माझे स्थान आणि व्हायटल्स शेअर करा';

  @override
  String get enableToShare => 'कुटुंबासह शेअर करण्यासाठी सक्षम करा';

  @override
  String get sosAlerts => 'SOS सूचना';

  @override
  String get sosAlertsDesc =>
      'तुम्ही SOS सूचना चालू केल्यास तुमच्या कुटुंबातील सदस्यांना त्वरित सूचित केले जाईल.';

  @override
  String get sharingWith => 'यांच्यासोबत शेअर करत आहे';

  @override
  String get revokeAllSharing => 'सर्व शेअरिंग रद्द करा';

  @override
  String get revokeAllSharingDesc =>
      'हे तुमचे स्थान आणि व्हायटल्स सर्वांसोबत शेअर करणे थांबवेल.';

  @override
  String get severeWeatherWarning => 'गंभीर हवामान चेतावणी';

  @override
  String get severeWeatherDesc =>
      'राष्ट्रीय हवामान सेवेने तुमच्या क्षेत्रासाठी तीव्र वादळाची चेतावणी जारी केली आहे. त्वरित आश्रय शोधा.';

  @override
  String get noInternetCached =>
      'इंटरनेट कनेक्शन नाही. कॅश केलेल्या सूचना दर्शवत आहे.';

  @override
  String get appAlert => 'ॲप सूचना';

  @override
  String get governmentAlert => 'सरकारी सूचना';

  @override
  String get acknowledge => 'स्वीकार करा';

  @override
  String get moreInfo => 'अधिक माहिती';

  @override
  String get dismiss => 'काढून टाका';

  @override
  String get viewDetails => 'तपशील पहा';

  @override
  String get viewMap => 'नकाशा पहा';

  @override
  String get checkVitals => 'व्हायटल्स तपासा';

  @override
  String get dismissed => 'काढून टाकले';

  @override
  String get geoFenceWarning => 'जिओ-फेन्स चेतावणी';

  @override
  String get geoFenceWarningDesc =>
      'एमिली हॉटेलजवळील \'सुरक्षित क्षेत्र\' सोडून गेली.';

  @override
  String get fallDetected => 'पडल्याचे आढळले';

  @override
  String get fallDetectedDesc => 'डेव्हिडच्या संभाव्य पडझडीचा शोध लागला आहे.';

  @override
  String get lowBattery => 'बॅटरी कमी आहे';

  @override
  String get lowBatteryDesc => 'साराच्या सुरक्षा बँडची बॅटरी २०% आहे.';

  @override
  String get geoFenceAlert => 'जिओ-फेन्स सूचना';

  @override
  String get geoFenceAlertDesc =>
      'तुम्ही प्रतिबंधित क्षेत्राजवळ पोहोचत आहात. कृपया मागे फिरा किंवा सावधगिरीने पुढे जा.';

  @override
  String get returnToSafety => 'सुरक्षिततेकडे परत जा';

  @override
  String get proceedWithCaution => 'काळजीपूर्वक पुढे जा';

  @override
  String get locating => 'स्थान शोधत आहे...';

  @override
  String get weather => 'हवामान';

  @override
  String get currentWeather => 'सध्याचे हवामान';

  @override
  String get feelsLike => 'असे वाटते';

  @override
  String get humidity => 'आर्द्रता';

  @override
  String get wind => 'वारा';

  @override
  String get today => 'आज';

  @override
  String get tomorrow => 'उद्या';

  @override
  String inXDays(Object days) {
    return '$days दिवसांत';
  }

  @override
  String get nextDaysTrend => 'पुढील दिवसांचा तापमानाचा कल';

  @override
  String get profile => 'प्रोफाइल';

  @override
  String get verifiedMember => 'सत्यापित सदस्य';

  @override
  String get securityVerification => 'सुरक्षा आणि पडताळणी';

  @override
  String get passport => 'पारपत्र';

  @override
  String get wallet => 'वॉलेट';

  @override
  String get personalTravelDetails => 'वैयक्तिक आणि प्रवासाचा तपशील';

  @override
  String get nationality => 'राष्ट्रीयत्व';

  @override
  String get dateOfBirth => 'जन्म तारीख';

  @override
  String get itinerary => 'प्रवासाचा कार्यक्रम';

  @override
  String get emergencyContacts => 'आपत्कालीन संपर्क';

  @override
  String get addContact => 'संपर्क जोडा';

  @override
  String get appSettings => 'ॲप सेटिंग्ज';

  @override
  String get notifications => 'सूचना';

  @override
  String get theme => 'थीम';

  @override
  String get language => 'भाषा';

  @override
  String get supportLegal => 'समर्थन आणि कायदेशीर';

  @override
  String get helpCenter => 'मदत केंद्र';

  @override
  String get privacyPolicy => 'गोपनीयता धोरण';

  @override
  String get logOut => 'लॉग आउट';

  @override
  String get connected => 'कनेक्ट झाले';

  @override
  String get disconnected => 'डिस्कनेक्ट झाले';

  @override
  String get idLabel => 'आयडी';

  @override
  String get band => 'बँड';

  @override
  String get sendEmergencyAlert => 'आपत्कालीन सूचना पाठवायची का?';

  @override
  String get sosDialogBody =>
      'हे अधिकारी आणि तुमच्या आपत्कालीन संपर्कांना सूचित करेल.';

  @override
  String get cancel => 'रद्द करा';

  @override
  String get sendSOS => 'SOS पाठवा';

  @override
  String get geofenceAlertShort => 'जिओफेन्स सूचना';

  @override
  String hoursAgo(Object hours) {
    return '$hours तासांपूर्वी';
  }

  @override
  String get tagFamily => 'कुटुंब';

  @override
  String get tagOpenAir => 'मोकळी हवा';

  @override
  String get tagTickets => 'तिकिटे';

  @override
  String get tagHistory => 'इतिहास';

  @override
  String get tagScenic => 'रमणीय';

  @override
  String get tagFree => 'विनामूल्य';

  @override
  String get shareLocation => 'स्थान शेअर करा';

  @override
  String get shareMyLocation => 'माझे स्थान शेअर करा';

  @override
  String get shareLocationDesc =>
      'कुटुंबातील सदस्यांना तुमचे थेट स्थान पाहण्याची परवानगी द्या.';

  @override
  String get sharingOptions => 'शेअरिंग पर्याय';

  @override
  String get generateSharingToken => 'शेअरिंग QR / टोकन तयार करा';

  @override
  String get revokeAccess => 'प्रवेश रद्द करा';

  @override
  String get generateSharingTokenMsg => 'Generate sharing token (mock)';

  @override
  String get accessRevokedMsg => 'सर्व कुटुंबासाठी प्रवेश रद्द केला (मॉक)';

  @override
  String get settingsTheme => 'थीम';

  @override
  String get settingsLanguage => 'भाषा';

  @override
  String get settingsNotifications => 'सूचना';

  @override
  String get settingsPrivacy => 'गोपनीयता आणि सुरक्षा';

  @override
  String get system => 'सिस्टम';

  @override
  String get light => 'लाइट';

  @override
  String get dark => 'डार्क';

  @override
  String get mobileVerification => 'मोबाइल पडताळणी';

  @override
  String get emailVerification => 'ईमेल पडताळणी';

  @override
  String get phoneNumber => 'फोन नंबर';

  @override
  String get pleaseEnterPhone => 'कृपया फोन नंबर टाका';

  @override
  String get pleaseSelectLanguage => 'कृपया एक भाषा निवडा';

  @override
  String get verificationCodeSentMock =>
      'पडताळणी कोड पाठवला (मॉक). कोणतेही ६ अंक टाका.';

  @override
  String get changePhoneNumber => 'फोन नंबर बदला';

  @override
  String get useDifferentEmail => 'वेगळा ईमेल वापरा';

  @override
  String get emailAddress => 'ईमेल पत्ता';

  @override
  String get emailHint => 'name@example.com';

  @override
  String get sendCodeToEmail => 'आम्ही या ईमेलवर पडताळणी कोड पाठवू.';

  @override
  String get enterOtpPrompt => 'तुमच्या फोनवर पाठवलेला ६-अंकी कोड टाका';

  @override
  String get invalidOtp6 => 'अवैध OTP. कृपया ६ अंक टाका.';

  @override
  String get otpHint => '------';

  @override
  String get agreeToTerms =>
      'पुढे चालू ठेवल्यास, आपण अटी आणि गोपनीयता धोरणास सहमती देता.';

  @override
  String get terms => 'अटी';

  @override
  String get sendVerificationCode => 'पडताळणी कोड पाठवा';

  @override
  String get error => 'त्रुटी';

  @override
  String get noData => 'माहिती उपलब्ध नाही';

  @override
  String get noDataDesc => 'सध्या कोणतीही माहिती उपलब्ध नाही';

  @override
  String get refresh => 'रिफ्रेश करा';

  @override
  String get addNewTrip => 'नवीन प्रवास जोडा';

  @override
  String get noUpcomingTrips =>
      'No upcoming trips. Tap \"Add new trip\" to plan one!';

  @override
  String get noPastTrips => 'मागील प्रवास नाही';

  @override
  String get activitiesNotes => 'क्रियाकलाप / नोट्स';

  @override
  String get searchLocation => 'स्थान शोधा';

  @override
  String get search => 'शोधा';

  @override
  String get searchHint => 'स्थानाचे नाव किंवा पत्ता टाका';

  @override
  String get noResultsFound => 'कोणतेही परिणाम आढळले नाहीत';
}
