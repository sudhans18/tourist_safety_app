// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Nepali (`ne`).
class AppLocalizationsNe extends AppLocalizations {
  AppLocalizationsNe([String locale = 'ne']) : super(locale);

  @override
  String get appTitle => 'पर्यटक सुरक्षा एप';

  @override
  String get selectLanguage => 'आफ्नो मनपर्ने भाषा छान्नुहोस्';

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
  String get continueText => 'जारी राख्नुहोस्';

  @override
  String get phoneVerification => 'फोन प्रमाणीकरण';

  @override
  String get enterPhoneNumber => 'आफ्नो फोन नम्बर हाल्नुहोस्';

  @override
  String get phoneHint => '+977XXXXXXXXXX';

  @override
  String get sendOtp => 'OTP पठाउनुहोस्';

  @override
  String get enterOtp => 'OTP हाल्नुहोस्';

  @override
  String get verifyOtp => 'OTP प्रमाणित गर्नुहोस्';

  @override
  String get invalidOtp => 'अमान्य OTP। कृपया फेरि प्रयास गर्नुहोस्।';

  @override
  String verificationFailed(Object error) {
    return 'प्रमाणीकरण असफल भयो: $error';
  }

  @override
  String get dashboard => 'ड्यासबोर्ड';

  @override
  String get settings => 'सेटिङहरू';

  @override
  String get alerts => 'चेतावनीहरू';

  @override
  String get family => 'परिवार';

  @override
  String get safetyDashboard => 'सुरक्षा ड्यासबोर्ड';

  @override
  String get recentAlerts => 'भर्खरका चेतावनीहरू';

  @override
  String get liveVitals => 'लाइभ भाइटल्स';

  @override
  String get locationAndRisk => 'स्थान र जोखिम क्षेत्र';

  @override
  String get restrictedZone => 'प्रतिबन्धित क्षेत्र';

  @override
  String get lowRiskZone => 'कम जोखिम क्षेत्र';

  @override
  String youAreInZone(Object zone) {
    return 'तपाईं $zone मा हुनुहुन्छ। आफ्नो वरपर सतर्क रहनुहोस्।';
  }

  @override
  String get safeCardTitle => 'सुरक्षित';

  @override
  String get safeCardDesc =>
      'तपाईंको हालको सुरक्षा स्कोर उत्कृष्ट छ। यसलाई कायम राख्नुहोस्!';

  @override
  String get tourPlan => 'भ्रमण योजना';

  @override
  String get quickActions => 'द्रुत कार्यहरू';

  @override
  String get familyTracking => 'परिवार ट्र्याकिङ';

  @override
  String get nearbyAttractions => 'नजिकका आकर्षणहरू';

  @override
  String get weatherAlerts => 'मौसम';

  @override
  String get offlineModeCached => 'अफलाइन मोड - क्यास गरिएको डाटा देखाइँदै छ';

  @override
  String get bandConnected => 'ब्यान्ड जडान भयो';

  @override
  String lastUpdatedMins(Object mins) {
    return 'अन्तिम अपडेट: $mins मिनेट पहिले';
  }

  @override
  String get heartRate => 'मुटुको चाल';

  @override
  String get spo2 => 'SpO₂';

  @override
  String get temperature => 'तापमान';

  @override
  String get activity => 'गतिविधि';

  @override
  String get normal => 'सामान्य';

  @override
  String get last1hHeartRate => 'पछिल्लो १ घण्टाको मुटुको चाल';

  @override
  String get tourPlanComingSoon => 'भ्रमण योजना स्क्रिन चाँडै आउँदैछ';

  @override
  String comingSoon(Object feature) {
    return '$feature चाँडै आउँदैछ';
  }

  @override
  String get shareLocationVitals => 'मेरो स्थान र भाइटल्स साझा गर्नुहोस्';

  @override
  String get enableToShare => 'परिवारसँग साझा गर्न सक्षम गर्नुहोस्';

  @override
  String get sosAlerts => 'SOS चेतावनीहरू';

  @override
  String get sosAlertsDesc =>
      'यदि तपाईंले SOS चेतावनी सुरु गर्नुभयो भने परिवारका सदस्यहरूलाई तुरुन्तै सूचित गरिनेछ।';

  @override
  String get sharingWith => 'यिनीहरूसँग साझा गरिएको';

  @override
  String get revokeAllSharing => 'सबै साझा रद्द गर्नुहोस्';

  @override
  String get revokeAllSharingDesc =>
      'यसले तपाईंको स्थान र भाइटल्स सबैसँग साझा गर्न बन्द गर्नेछ।';

  @override
  String get severeWeatherWarning => 'गम्भीर मौसम चेतावनी';

  @override
  String get severeWeatherDesc =>
      'राष्ट्रिय मौसम सेवाले तपाईंको क्षेत्रको लागि गम्भीर आँधीबेहरीको चेतावनी जारी गरेको छ। तुरुन्तै आश्रय खोज्नुहोस्।';

  @override
  String get noInternetCached =>
      'इन्टरनेट जडान छैन। क्यास गरिएका चेतावनीहरू देखाइँदै छ।';

  @override
  String get appAlert => 'एप चेतावनी';

  @override
  String get governmentAlert => 'सरकारी चेतावनी';

  @override
  String get acknowledge => 'स्वीकार गर्नुहोस्';

  @override
  String get moreInfo => 'थप जानकारी';

  @override
  String get dismiss => 'खारेज गर्नुहोस्';

  @override
  String get viewDetails => 'विवरण हेर्नुहोस्';

  @override
  String get viewMap => 'नक्सा हेर्नुहोस्';

  @override
  String get checkVitals => 'भाइटल्स जाँच गर्नुहोस्';

  @override
  String get dismissed => 'खारेज गरियो';

  @override
  String get geoFenceWarning => 'जियो-फेन्स चेतावनी';

  @override
  String get geoFenceWarningDesc =>
      'एमिली होटल नजिकको \'सुरक्षित क्षेत्र\' बाट बाहिर निस्किइन्।';

  @override
  String get fallDetected => 'लडेको पत्ता लाग्यो';

  @override
  String get fallDetectedDesc => 'डेभिडको सम्भावित लडाइ पत्ता लागेको छ।';

  @override
  String get lowBattery => 'कम ब्याट्री';

  @override
  String get lowBatteryDesc => 'साराको सुरक्षा ब्यान्डको ब्याट्री २०% मा छ।';

  @override
  String get geoFenceAlert => 'जियो-फेन्स चेतावनी';

  @override
  String get geoFenceAlertDesc =>
      'तपाईं प्रतिबन्धित क्षेत्रमा पुग्दै हुनुहुन्छ। कृपया पछाडि फर्कनुहोस् वा सावधानीपूर्वक अगाडि बढ्नुहोस्।';

  @override
  String get returnToSafety => 'सुरक्षित स्थानमा फर्कनुहोस्';

  @override
  String get proceedWithCaution => 'सावधानीपूर्वक अगाडि बढ्नुहोस्';

  @override
  String get locating => 'स्थान पत्ता लगाउँदै...';

  @override
  String get weather => 'मौसम';

  @override
  String get currentWeather => 'वर्तमान मौसम';

  @override
  String get feelsLike => 'महसुस हुन्छ';

  @override
  String get humidity => 'आर्द्रता';

  @override
  String get wind => 'हावा';

  @override
  String get today => 'आज';

  @override
  String get tomorrow => 'भोलि';

  @override
  String inXDays(Object days) {
    return '$days दिनमा';
  }

  @override
  String get nextDaysTrend => 'आगामी दिनहरूको तापमान प्रवृत्ति';

  @override
  String get profile => 'प्रोफाइल';

  @override
  String get verifiedMember => 'प्रमाणित सदस्य';

  @override
  String get securityVerification => 'सुरक्षा र प्रमाणीकरण';

  @override
  String get passport => 'राहदानी';

  @override
  String get wallet => 'वालेट';

  @override
  String get personalTravelDetails => 'व्यक्तिगत र यात्रा विवरण';

  @override
  String get nationality => 'राष्ट्रियता';

  @override
  String get dateOfBirth => 'जन्म मिति';

  @override
  String get itinerary => 'यात्रा कार्यक्रम';

  @override
  String get emergencyContacts => 'आपतकालीन सम्पर्कहरू';

  @override
  String get addContact => 'सम्पर्क थप्नुहोस्';

  @override
  String get appSettings => 'एप सेटिङहरू';

  @override
  String get notifications => 'सूचनाहरू';

  @override
  String get theme => 'थिम';

  @override
  String get language => 'भाषा';

  @override
  String get supportLegal => 'समर्थन र कानूनी';

  @override
  String get helpCenter => 'सहयोग केन्द्र';

  @override
  String get privacyPolicy => 'गोपनीयता नीति';

  @override
  String get logOut => 'लग आउट';

  @override
  String get connected => 'जडान भयो';

  @override
  String get disconnected => 'विच्छेद भयो';

  @override
  String get idLabel => 'आईडी';

  @override
  String get band => 'ब्यान्ड';

  @override
  String get sendEmergencyAlert => 'आपतकालीन चेतावनी पठाउने?';

  @override
  String get sosDialogBody =>
      'यसले अधिकारीहरू र तपाईंको आपतकालीन सम्पर्कहरूलाई सूचित गर्नेछ।';

  @override
  String get cancel => 'रद्द गर्नुहोस्';

  @override
  String get sendSOS => 'SOS पठाउनुहोस्';

  @override
  String get geofenceAlertShort => 'जियोफेन्स चेतावनी';

  @override
  String hoursAgo(Object hours) {
    return '$hours घण्टा पहिले';
  }

  @override
  String get tagFamily => 'परिवार';

  @override
  String get tagOpenAir => 'खुला हावा';

  @override
  String get tagTickets => 'टिकटहरू';

  @override
  String get tagHistory => 'इतिहास';

  @override
  String get tagScenic => 'रमणीय';

  @override
  String get tagFree => 'नि:शुल्क';

  @override
  String get shareLocation => 'स्थान साझा गर्नुहोस्';

  @override
  String get shareMyLocation => 'मेरो स्थान साझा गर्नुहोस्';

  @override
  String get shareLocationDesc =>
      'परिवारका सदस्यहरूलाई तपाईंको प्रत्यक्ष स्थान हेर्न अनुमति दिनुहोस्।';

  @override
  String get sharingOptions => 'साझा गर्ने विकल्पहरू';

  @override
  String get generateSharingToken => 'साझा गर्ने QR / टोकन बनाउनुहोस्';

  @override
  String get revokeAccess => 'पहुँच रद्द गर्नुहोस्';

  @override
  String get generateSharingTokenMsg => 'Generate sharing token (mock)';

  @override
  String get accessRevokedMsg => 'सबै परिवारका लागि पहुँच रद्द गरियो (नक्कली)';

  @override
  String get settingsTheme => 'थिम';

  @override
  String get settingsLanguage => 'भाषा';

  @override
  String get settingsNotifications => 'सूचनाहरू';

  @override
  String get settingsPrivacy => 'गोपनीयता र सुरक्षा';

  @override
  String get system => 'प्रणाली';

  @override
  String get light => 'उज्यालो';

  @override
  String get dark => 'अँध्यारो';

  @override
  String get mobileVerification => 'मोबाइल प्रमाणीकरण';

  @override
  String get emailVerification => 'इमेल प्रमाणीकरण';

  @override
  String get phoneNumber => 'फोन नम्बर';

  @override
  String get pleaseEnterPhone => 'कृपया फोन नम्बर हाल्नुहोस्';

  @override
  String get pleaseSelectLanguage => 'कृपया एउटा भाषा छान्नुहोस्';

  @override
  String get verificationCodeSentMock =>
      'प्रमाणीकरण कोड पठाइयो (नक्कली)। कुनै पनि ६ अंक हाल्नुहोस्।';

  @override
  String get changePhoneNumber => 'फोन नम्बर परिवर्तन गर्नुहोस्';

  @override
  String get useDifferentEmail => 'अर्को इमेल प्रयोग गर्नुहोस्';

  @override
  String get emailAddress => 'इमेल ठेगाना';

  @override
  String get emailHint => 'name@example.com';

  @override
  String get sendCodeToEmail => 'हामी यो इमेलमा प्रमाणीकरण कोड पठाउँछौं।';

  @override
  String get enterOtpPrompt => 'आफ्नो फोनमा पठाइएको ६-अङ्कको कोड हाल्नुहोस्';

  @override
  String get invalidOtp6 => 'अमान्य OTP। कृपया ६ अंक हाल्नुहोस्।';

  @override
  String get otpHint => '------';

  @override
  String get agreeToTerms =>
      'जारी राख्दा, तपाईं नियमावली र गोपनीयता नीतिसँग सहमत हुनुहुन्छ।';

  @override
  String get terms => 'नियमावली';

  @override
  String get sendVerificationCode => 'प्रमाणीकरण कोड पठाउनुहोस्';

  @override
  String get error => 'त्रुटि';

  @override
  String get noData => 'डाटा छैन';

  @override
  String get noDataDesc => 'अहिले कुनै डाटा उपलब्ध छैन';

  @override
  String get refresh => 'ताजा गर्नुहोस्';

  @override
  String get addNewTrip => 'नयाँ यात्रा थप्नुहोस्';

  @override
  String get noUpcomingTrips =>
      'कुनै आगामी यात्राहरू छैनन्। योजना बनाउन \"नयाँ यात्रा थप्नुहोस्\" मा ट्याप गर्नुहोस्!';

  @override
  String get noPastTrips => 'विगतका यात्राहरू छैनन्';

  @override
  String get activitiesNotes => 'गतिविधिहरू / नोटहरू';

  @override
  String get searchLocation => 'Search location';

  @override
  String get search => 'खोज्नुहोस्';

  @override
  String get searchHint => 'स्थानको नाम वा ठेगाना हाल्नुहोस्';

  @override
  String get noResultsFound => 'कुनै परिणाम फेला परेन';
}
