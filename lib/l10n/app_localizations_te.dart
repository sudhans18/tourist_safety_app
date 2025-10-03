// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Telugu (`te`).
class AppLocalizationsTe extends AppLocalizations {
  AppLocalizationsTe([String locale = 'te']) : super(locale);

  @override
  String get appTitle => 'పర్యాటక భద్రతా యాప్';

  @override
  String get selectLanguage => 'మీకు ఇష్టమైన భాషను ఎంచుకోండి';

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
  String get continueText => 'కొనసాగించు';

  @override
  String get phoneVerification => 'ఫోన్ ధృవీకరణ';

  @override
  String get enterPhoneNumber => 'మీ ఫోన్ నంబర్‌ను నమోదు చేయండి';

  @override
  String get phoneHint => '+91XXXXXXXXXX';

  @override
  String get sendOtp => 'OTP పంపండి';

  @override
  String get enterOtp => 'OTPని నమోదు చేయండి';

  @override
  String get verifyOtp => 'OTPని ధృవీకరించండి';

  @override
  String get invalidOtp => 'చెల్లని OTP. దయచేసి మళ్ళీ ప్రయత్నించండి.';

  @override
  String verificationFailed(Object error) {
    return 'ధృవీకరణ విఫలమైంది: $error';
  }

  @override
  String get dashboard => 'డాష్‌బోర్డ్';

  @override
  String get settings => 'సెట్టింగ్‌లు';

  @override
  String get alerts => 'హెచ్చరికలు';

  @override
  String get family => 'కుటుంబం';

  @override
  String get safetyDashboard => 'భద్రతా డాష్‌బోర్డ్';

  @override
  String get recentAlerts => 'ఇటీవలి హెచ్చరికలు';

  @override
  String get liveVitals => 'లైవ్ వైటల్స్';

  @override
  String get locationAndRisk => 'స్థానం & ప్రమాద జోన్';

  @override
  String get restrictedZone => 'నియంత్రిత జోన్';

  @override
  String get lowRiskZone => 'తక్కువ-ప్రమాద జోన్';

  @override
  String youAreInZone(Object zone) {
    return 'మీరు $zoneలో ఉన్నారు. మీ పరిసరాల పట్ల అప్రమత్తంగా ఉండండి.';
  }

  @override
  String get safeCardTitle => 'సురక్షితం';

  @override
  String get safeCardDesc =>
      'మీ ప్రస్తుత భద్రతా స్కోరు అద్భుతంగా ఉంది. దీన్ని కొనసాగించండి!';

  @override
  String get tourPlan => 'పర్యటన ప్రణాళిక';

  @override
  String get quickActions => 'త్వరిత చర్యలు';

  @override
  String get familyTracking => 'కుటుంబ ట్రాకింగ్';

  @override
  String get nearbyAttractions => 'సమీపంలోని ఆకర్షణలు';

  @override
  String get weatherAlerts => 'వాతావరణం';

  @override
  String get offlineModeCached => 'ఆఫ్‌లైన్ మోడ్ - కాష్ చేసిన డేటా చూపబడుతోంది';

  @override
  String get bandConnected => 'బ్యాండ్ కనెక్ట్ చేయబడింది';

  @override
  String lastUpdatedMins(Object mins) {
    return 'చివరిగా నవీకరించబడింది: $mins నిమిషాల క్రితం';
  }

  @override
  String get heartRate => 'హృదయ స్పందన రేటు';

  @override
  String get spo2 => 'SpO₂';

  @override
  String get temperature => 'ఉష్ణోగ్రత';

  @override
  String get activity => 'కార్యాచరణ';

  @override
  String get normal => 'సాధారణం';

  @override
  String get last1hHeartRate => 'గత 1 గంట హృదయ స్పందన రేటు';

  @override
  String get tourPlanComingSoon => 'పర్యటన ప్రణాళిక స్క్రీన్ త్వరలో వస్తుంది';

  @override
  String comingSoon(Object feature) {
    return '$feature త్వరలో వస్తుంది';
  }

  @override
  String get shareLocationVitals => 'నా స్థానం & వైటల్స్ పంచుకోండి';

  @override
  String get enableToShare => 'కుటుంబంతో పంచుకోవడానికి ప్రారంభించండి';

  @override
  String get sosAlerts => 'SOS హెచ్చరికలు';

  @override
  String get sosAlertsDesc =>
      'మీరు SOS హెచ్చరికను ప్రేరేపిస్తే కుటుంబ సభ్యులకు వెంటనే తెలియజేయబడుతుంది.';

  @override
  String get sharingWith => 'వీరితో పంచుకుంటున్నారు';

  @override
  String get revokeAllSharing => 'అన్ని షేరింగ్‌లను రద్దు చేయండి';

  @override
  String get revokeAllSharingDesc =>
      'ఇది మీ స్థానం మరియు వైటల్స్‌ను అందరితో పంచుకోవడం ఆపివేస్తుంది.';

  @override
  String get severeWeatherWarning => 'తీవ్రమైన వాతావరణ హెచ్చరిక';

  @override
  String get severeWeatherDesc =>
      'జాతీయ వాతావరణ సేవ మీ ప్రాంతానికి తీవ్రమైన ఉరుములతో కూడిన తుఫాను హెచ్చరికను జారీ చేసింది. వెంటనే ఆశ్రయం పొందండి.';

  @override
  String get noInternetCached =>
      'ఇంటర్నెట్ కనెక్షన్ లేదు. కాష్ చేసిన హెచ్చరికలు చూపబడుతున్నాయి.';

  @override
  String get appAlert => 'యాప్ హెచ్చరిక';

  @override
  String get governmentAlert => 'ప్రభుత్వ హెచ్చరిక';

  @override
  String get acknowledge => 'అంగీకరించు';

  @override
  String get moreInfo => 'మరింత సమాచారం';

  @override
  String get dismiss => 'తొలగించు';

  @override
  String get viewDetails => 'వివరాలు చూడండి';

  @override
  String get viewMap => 'మ్యాప్ చూడండి';

  @override
  String get checkVitals => 'వైటల్స్ తనిఖీ చేయండి';

  @override
  String get dismissed => 'తొలగించబడింది';

  @override
  String get geoFenceWarning => 'జియో-ఫెన్స్ హెచ్చరిక';

  @override
  String get geoFenceWarningDesc =>
      'ఎమిలీ హోటల్ సమీపంలోని \'సురక్షిత జోన్\' నుండి వెళ్లిపోయింది.';

  @override
  String get fallDetected => 'పతనం కనుగొనబడింది';

  @override
  String get fallDetectedDesc => 'డేవిడ్ కోసం సంభావ్య పతనం కనుగొనబడింది.';

  @override
  String get lowBattery => 'తక్కువ బ్యాటరీ';

  @override
  String get lowBatteryDesc => 'సారా భద్రతా బ్యాండ్ 20% బ్యాటరీ వద్ద ఉంది.';

  @override
  String get geoFenceAlert => 'జియో-ఫెన్స్ హెచ్చరిక';

  @override
  String get geoFenceAlertDesc =>
      'మీరు నియంత్రిత ప్రాంతానికి సమీపిస్తున్నారు. దయచేసి వెనక్కి తిరగండి లేదా జాగ్రత్తగా ముందుకు సాగండి.';

  @override
  String get returnToSafety => 'భద్రతకు తిరిగి వెళ్లండి';

  @override
  String get proceedWithCaution => 'జాగ్రత్తగా కొనసాగండి';

  @override
  String get locating => 'స్థానాన్ని గుర్తిస్తోంది...';

  @override
  String get weather => 'వాతావరణం';

  @override
  String get currentWeather => 'ప్రస్తుత వాతావరణం';

  @override
  String get feelsLike => 'ఇలా అనిపిస్తుంది';

  @override
  String get humidity => 'తేమ';

  @override
  String get wind => 'గాలి';

  @override
  String get today => 'ఈ రోజు';

  @override
  String get tomorrow => 'రేపు';

  @override
  String inXDays(Object days) {
    return '$days రోజులలో';
  }

  @override
  String get nextDaysTrend => 'రాబోయే రోజుల ఉష్ణోగ్రత ధోరణి';

  @override
  String get profile => 'ప్రొఫైల్';

  @override
  String get verifiedMember => 'ధృవీకరించబడిన సభ్యుడు';

  @override
  String get securityVerification => 'భద్రత & ధృవీకరణ';

  @override
  String get passport => 'పాస్‌పోర్ట్';

  @override
  String get wallet => 'వాలెట్';

  @override
  String get personalTravelDetails => 'వ్యక్తిగత & ప్రయాణ వివరాలు';

  @override
  String get nationality => 'జాతీయత';

  @override
  String get dateOfBirth => 'పుట్టిన తేది';

  @override
  String get itinerary => 'యాత్రా ప్రణాళిక';

  @override
  String get emergencyContacts => 'అత్యవసర పరిచయాలు';

  @override
  String get addContact => 'పరిచయాన్ని జోడించు';

  @override
  String get appSettings => 'యాప్ సెట్టింగ్‌లు';

  @override
  String get notifications => 'నోటిఫికేషన్‌లు';

  @override
  String get theme => 'థీమ్';

  @override
  String get language => 'భాష';

  @override
  String get supportLegal => 'మద్దతు & చట్టపరమైన';

  @override
  String get helpCenter => 'సహాయ కేంద్రం';

  @override
  String get privacyPolicy => 'గోప్యతా విధానం';

  @override
  String get logOut => 'లాగ్ అవుట్';

  @override
  String get connected => 'కనెక్ట్ చేయబడింది';

  @override
  String get disconnected => 'డిస్‌కనెక్ట్ చేయబడింది';

  @override
  String get idLabel => 'ID';

  @override
  String get band => 'బ్యాండ్';

  @override
  String get sendEmergencyAlert => 'అత్యవసర హెచ్చరిక పంపాలా?';

  @override
  String get sosDialogBody =>
      'ఇది అధికారులకు మరియు మీ అత్యవసర పరిచయాలకు తెలియజేస్తుంది.';

  @override
  String get cancel => 'రద్దు చేయి';

  @override
  String get sendSOS => 'SOS పంపండి';

  @override
  String get geofenceAlertShort => 'జియోఫెన్స్ హెచ్చరిక';

  @override
  String hoursAgo(Object hours) {
    return '$hoursగం క్రితం';
  }

  @override
  String get tagFamily => 'కుటుంబం';

  @override
  String get tagOpenAir => 'బహిరంగ ప్రదేశం';

  @override
  String get tagTickets => 'టిక్కెట్లు';

  @override
  String get tagHistory => 'చరిత్ర';

  @override
  String get tagScenic => 'సుందరమైన';

  @override
  String get tagFree => 'ఉచితం';

  @override
  String get shareLocation => 'స్థానాన్ని పంచుకోండి';

  @override
  String get shareMyLocation => 'నా స్థానాన్ని పంచుకోండి';

  @override
  String get shareLocationDesc =>
      'మీ ప్రత్యక్ష స్థానాన్ని చూడటానికి కుటుంబ సభ్యులను అనుమతించండి.';

  @override
  String get sharingOptions => 'షేరింగ్ ఎంపికలు';

  @override
  String get generateSharingToken => 'షేరింగ్ QR / టోకెన్ రూపొందించండి';

  @override
  String get revokeAccess => 'యాక్సెస్ రద్దు చేయండి';

  @override
  String get generateSharingTokenMsg => 'షేరింగ్ టోకెన్ రూపొందించండి (మాక్)';

  @override
  String get accessRevokedMsg =>
      'అన్ని కుటుంబ సభ్యులకు యాక్సెస్ రద్దు చేయబడింది (మాక్)';

  @override
  String get settingsTheme => 'థీమ్';

  @override
  String get settingsLanguage => 'భాష';

  @override
  String get settingsNotifications => 'నోటిఫికేషన్‌లు';

  @override
  String get settingsPrivacy => 'గోప్యత & భద్రత';

  @override
  String get system => 'సిస్టమ్';

  @override
  String get light => 'లైట్';

  @override
  String get dark => 'డార్క్';

  @override
  String get mobileVerification => 'మొబైల్ ధృవీకరణ';

  @override
  String get emailVerification => 'Email Verification';

  @override
  String get phoneNumber => 'ఫోను నంబరు';

  @override
  String get pleaseEnterPhone => 'దయచేసి ఫోన్ నంబర్‌ను నమోదు చేయండి';

  @override
  String get pleaseSelectLanguage => 'దయచేసి ఒక భాషను ఎంచుకోండి';

  @override
  String get verificationCodeSentMock =>
      'ధృవీకరణ కోడ్ పంపబడింది (మాక్). ఏదైనా 6 అంకెలను నమోదు చేయండి.';

  @override
  String get changePhoneNumber => 'ఫోన్ నంబర్‌ను మార్చండి';

  @override
  String get useDifferentEmail => 'Use a different email';

  @override
  String get emailAddress => 'Email address';

  @override
  String get emailHint => 'name@example.com';

  @override
  String get sendCodeToEmail =>
      'We will send a verification code to this email.';

  @override
  String get enterOtpPrompt => 'మీ ఫోన్‌కు పంపిన 6-అంకెల కోడ్‌ను నమోదు చేయండి';

  @override
  String get invalidOtp6 => 'చెల్లని OTP. దయచేసి 6 అంకెలను నమోదు చేయండి.';

  @override
  String get otpHint => '------';

  @override
  String get agreeToTerms =>
      'By continuing, you agree to the Terms and Privacy Policy.';

  @override
  String get terms => 'Terms';

  @override
  String get sendVerificationCode => 'ధృవీకరణ కోడ్ పంపండి';

  @override
  String get error => 'లోపం';

  @override
  String get noData => 'డేటా లేదు';

  @override
  String get noDataDesc => 'ప్రస్తుతానికి డేటా అందుబాటులో లేదు';

  @override
  String get refresh => 'రిఫ్రెష్';

  @override
  String get addNewTrip => 'కొత్త పర్యటనను జోడించండి';

  @override
  String get noUpcomingTrips =>
      'రాబోయే పర్యటనలు లేవు. ఒకదాన్ని ప్లాన్ చేయడానికి \"కొత్త పర్యటనను జోడించు\" నొక్కండి!';

  @override
  String get noPastTrips => 'గత పర్యటనలు లేవు';

  @override
  String get activitiesNotes => 'కార్యాచరణలు / గమనికలు';

  @override
  String get searchLocation => 'స్థానం కోసం శోధించండి';

  @override
  String get search => 'శోధించు';

  @override
  String get searchHint => 'స్థానం పేరు లేదా చిరునామాను నమోదు చేయండి';

  @override
  String get noResultsFound => 'ఫలితాలు కనుగొనబడలేదు';
}
