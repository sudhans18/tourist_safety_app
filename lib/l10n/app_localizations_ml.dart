// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Malayalam (`ml`).
class AppLocalizationsMl extends AppLocalizations {
  AppLocalizationsMl([String locale = 'ml']) : super(locale);

  @override
  String get appTitle => 'സഞ്ചാരി സുരക്ഷാ ആപ്പ്';

  @override
  String get selectLanguage => 'നിങ്ങളുടെ ഇഷ്ട ഭാഷ തിരഞ്ഞെടുക്കുക';

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
  String get continueText => 'തുടരുക';

  @override
  String get phoneVerification => 'ഫോൺ വെരിഫിക്കേഷൻ';

  @override
  String get enterPhoneNumber => 'നിങ്ങളുടെ ഫോൺ നമ്പർ നൽകുക';

  @override
  String get phoneHint => '+91XXXXXXXXXX';

  @override
  String get sendOtp => 'OTP അയയ്ക്കുക';

  @override
  String get enterOtp => 'OTP നൽകുക';

  @override
  String get verifyOtp => 'OTP സ്ഥിരീകരിക്കുക';

  @override
  String get invalidOtp => 'അസാധുവായ OTP. ദയവായി വീണ്ടും ശ്രമിക്കുക.';

  @override
  String verificationFailed(Object error) {
    return 'സ്ഥിരീകരണം പരാജയപ്പെട്ടു: $error';
  }

  @override
  String get dashboard => 'ഡാഷ്ബോർഡ്';

  @override
  String get settings => 'ക്രമീകരണങ്ങൾ';

  @override
  String get alerts => 'അലേർട്ടുകൾ';

  @override
  String get family => 'കുടുംബം';

  @override
  String get safetyDashboard => 'സുരക്ഷാ ഡാഷ്ബോർഡ്';

  @override
  String get recentAlerts => 'സമീപകാല അലേർട്ടുകൾ';

  @override
  String get liveVitals => 'ലൈവ് വൈറ്റൽസ്';

  @override
  String get locationAndRisk => 'സ്ഥലവും അപകടസാധ്യതയുള്ള മേഖലയും';

  @override
  String get restrictedZone => 'നിയന്ത്രിത മേഖല';

  @override
  String get lowRiskZone => 'കുറഞ്ഞ അപകടസാധ്യതയുള്ള മേഖല';

  @override
  String youAreInZone(Object zone) {
    return 'നിങ്ങൾ $zone എന്ന സ്ഥലത്താണ്. നിങ്ങളുടെ ചുറ്റുപാടുകളെക്കുറിച്ച് ബോധവാന്മാരായിരിക്കുക.';
  }

  @override
  String get safeCardTitle => 'സുരക്ഷിതം';

  @override
  String get safeCardDesc =>
      'നിങ്ങളുടെ നിലവിലെ സുരക്ഷാ സ്കോർ മികച്ചതാണ്. അത് തുടരുക!';

  @override
  String get tourPlan => 'യാത്രാ പദ്ധതി';

  @override
  String get quickActions => 'ദ്രുത പ്രവർത്തനങ്ങൾ';

  @override
  String get familyTracking => 'കുടുംബത്തെ ട്രാക്ക് ചെയ്യൽ';

  @override
  String get nearbyAttractions => 'സമീപത്തുള്ള ആകർഷണങ്ങൾ';

  @override
  String get weatherAlerts => 'കാലാവസ്ഥ';

  @override
  String get offlineModeCached =>
      'ഓഫ്‌ലൈൻ മോഡ് - കാഷെ ചെയ്ത ഡാറ്റ കാണിക്കുന്നു';

  @override
  String get bandConnected => 'ബാൻഡ് കണക്റ്റുചെയ്‌തു';

  @override
  String lastUpdatedMins(Object mins) {
    return 'അവസാനം അപ്ഡേറ്റ് ചെയ്തത്: $mins മിനിറ്റ് മുൻപ്';
  }

  @override
  String get heartRate => 'ഹൃദയമിടിപ്പ്';

  @override
  String get spo2 => 'SpO₂';

  @override
  String get temperature => 'താപനില';

  @override
  String get activity => 'പ്രവർത്തനം';

  @override
  String get normal => 'സാധാരണം';

  @override
  String get last1hHeartRate => 'കഴിഞ്ഞ 1 മണിക്കൂറിലെ ഹൃദയമിടിപ്പ്';

  @override
  String get tourPlanComingSoon => 'യാത്രാ പദ്ധതി സ്ക്രീൻ ഉടൻ വരുന്നു';

  @override
  String comingSoon(Object feature) {
    return '$feature ഉടൻ വരുന്നു';
  }

  @override
  String get shareLocationVitals => 'എൻ്റെ സ്ഥാനവും വൈറ്റൽസും പങ്കിടുക';

  @override
  String get enableToShare => 'കുടുംബവുമായി പങ്കിടാൻ പ്രവർത്തനക്ഷമമാക്കുക';

  @override
  String get sosAlerts => 'SOS അലേർട്ടുകൾ';

  @override
  String get sosAlertsDesc =>
      'നിങ്ങൾ ഒരു SOS അലേർട്ട് ട്രിഗർ ചെയ്യുകയാണെങ്കിൽ കുടുംബാംഗങ്ങളെ ഉടൻ അറിയിക്കും.';

  @override
  String get sharingWith => 'ഇവരുമായി പങ്കിടുന്നു';

  @override
  String get revokeAllSharing => 'എല്ലാ പങ്കിടലും റദ്ദാക്കുക';

  @override
  String get revokeAllSharingDesc =>
      'ഇത് നിങ്ങളുടെ സ്ഥാനവും വൈറ്റൽസും എല്ലാവരുമായി പങ്കിടുന്നത് നിർത്തും.';

  @override
  String get severeWeatherWarning => 'കടുത്ത കാലാവസ്ഥാ മുന്നറിയിപ്പ്';

  @override
  String get severeWeatherDesc =>
      'ദേശീയ കാലാവസ്ഥാ നിരീക്ഷണ കേന്ദ്രം നിങ്ങളുടെ പ്രദേശത്ത് ശക്തമായ ഇടിമിന്നലിന് മുന്നറിയിപ്പ് നൽകിയിട്ടുണ്ട്. ഉടൻ സുരക്ഷിതമായ ഇടം തേടുക.';

  @override
  String get noInternetCached =>
      'ഇൻ്റർനെറ്റ് കണക്ഷൻ ഇല്ല. കാഷെ ചെയ്ത അലേർട്ടുകൾ കാണിക്കുന്നു.';

  @override
  String get appAlert => 'ആപ്പ് അലേർട്ട്';

  @override
  String get governmentAlert => 'സർക്കാർ അലേർട്ട്';

  @override
  String get acknowledge => 'അംഗീകരിക്കുക';

  @override
  String get moreInfo => 'കൂടുതൽ വിവരങ്ങൾ';

  @override
  String get dismiss => 'തള്ളിക്കളയുക';

  @override
  String get viewDetails => 'വിശദാംശങ്ങൾ കാണുക';

  @override
  String get viewMap => 'മാപ്പ് കാണുക';

  @override
  String get checkVitals => 'വൈറ്റൽസ് പരിശോധിക്കുക';

  @override
  String get dismissed => 'തള്ളിക്കളഞ്ഞു';

  @override
  String get geoFenceWarning => 'ജിയോ-ഫെൻസ് മുന്നറിയിപ്പ്';

  @override
  String get geoFenceWarningDesc =>
      'എമിലി ഹോട്ടലിന് സമീപമുള്ള \'സേഫ് സോൺ\' വിട്ടു.';

  @override
  String get fallDetected => 'വീഴ്ച കണ്ടെത്തി';

  @override
  String get fallDetectedDesc => 'ഡേവിഡിൻ്റെ ഒരു വീഴ്ച കണ്ടെത്താനായിട്ടുണ്ട്.';

  @override
  String get lowBattery => 'ബാറ്ററി കുറവാണ്';

  @override
  String get lowBatteryDesc => 'സാറയുടെ സുരക്ഷാ ബാൻഡിന് 20% ബാറ്ററി ഉണ്ട്.';

  @override
  String get geoFenceAlert => 'ജിയോ-ഫെൻസ് അലേർട്ട്';

  @override
  String get geoFenceAlertDesc =>
      'നിങ്ങൾ ഒരു നിയന്ത്രിത മേഖലയിലേക്ക് പ്രവേശിക്കുകയാണ്. ദയവായി തിരികെ പോകുക അല്ലെങ്കിൽ ജാഗ്രതയോടെ മുന്നോട്ട് പോകുക.';

  @override
  String get returnToSafety => 'സുരക്ഷിതത്വത്തിലേക്ക് മടങ്ങുക';

  @override
  String get proceedWithCaution => 'ജാഗ്രതയോടെ മുന്നോട്ട് പോകുക';

  @override
  String get locating => 'കണ്ടെത്തുന്നു...';

  @override
  String get weather => 'കാലാവസ്ഥ';

  @override
  String get currentWeather => 'നിലവിലെ കാലാവസ്ഥ';

  @override
  String get feelsLike => 'അനുഭവപ്പെടുന്നത്';

  @override
  String get humidity => 'ഈർപ്പം';

  @override
  String get wind => 'കാറ്റ്';

  @override
  String get today => 'ഇന്ന്';

  @override
  String get tomorrow => 'നാളെ';

  @override
  String inXDays(Object days) {
    return '$days ദിവസത്തിനുള്ളിൽ';
  }

  @override
  String get nextDaysTrend => 'അടുത്ത ദിവസങ്ങളിലെ താപനിലയുടെ പ്രവണത';

  @override
  String get profile => 'പ്രൊഫൈൽ';

  @override
  String get verifiedMember => 'സ്ഥിരീകരിച്ച അംഗം';

  @override
  String get securityVerification => 'സുരക്ഷയും സ്ഥിരീകരണവും';

  @override
  String get passport => 'പാസ്പോർട്ട്';

  @override
  String get wallet => 'വാലറ്റ്';

  @override
  String get personalTravelDetails =>
      'വ്യക്തിപരവും യാത്രാ സംബന്ധവുമായ വിവരങ്ങൾ';

  @override
  String get nationality => 'ദേശീയത';

  @override
  String get dateOfBirth => 'ജനന തീയതി';

  @override
  String get itinerary => 'യാത്രാവിവരം';

  @override
  String get emergencyContacts => 'അടിയന്തര കോൺടാക്റ്റുകൾ';

  @override
  String get addContact => 'കോൺടാക്റ്റ് ചേർക്കുക';

  @override
  String get appSettings => 'ആപ്പ് ക്രമീകരണങ്ങൾ';

  @override
  String get notifications => 'അറിയിപ്പുകൾ';

  @override
  String get theme => 'തീം';

  @override
  String get language => 'ഭാഷ';

  @override
  String get supportLegal => 'പിന്തുണയും നിയമപരവും';

  @override
  String get helpCenter => 'സഹായ കേന്ദ്രം';

  @override
  String get privacyPolicy => 'സ്വകാര്യതാ നയം';

  @override
  String get logOut => 'ലോഗ് ഔട്ട്';

  @override
  String get connected => 'ബന്ധിപ്പിച്ചു';

  @override
  String get disconnected => 'വിച്ഛേദിച്ചു';

  @override
  String get idLabel => 'ഐഡി';

  @override
  String get band => 'ബാൻഡ്';

  @override
  String get sendEmergencyAlert => 'അടിയന്തര അലേർട്ട് അയയ്ക്കണോ?';

  @override
  String get sosDialogBody =>
      'ഇത് അധികാരികളെയും നിങ്ങളുടെ അടിയന്തര കോൺടാക്റ്റുകളെയും അറിയിക്കും.';

  @override
  String get cancel => 'റദ്ദാക്കുക';

  @override
  String get sendSOS => 'SOS അയയ്ക്കുക';

  @override
  String get geofenceAlertShort => 'ജിയോഫെൻസ് അലേർട്ട്';

  @override
  String hoursAgo(Object hours) {
    return '$hours മണിക്കൂർ മുൻപ്';
  }

  @override
  String get tagFamily => 'കുടുംബം';

  @override
  String get tagOpenAir => 'തുറന്ന സ്ഥലം';

  @override
  String get tagTickets => 'ടിക്കറ്റുകൾ';

  @override
  String get tagHistory => 'ചരിത്രം';

  @override
  String get tagScenic => 'മനോഹരം';

  @override
  String get tagFree => 'സൗജന്യം';

  @override
  String get shareLocation => 'സ്ഥാനം പങ്കിടുക';

  @override
  String get shareMyLocation => 'എൻ്റെ സ്ഥാനം പങ്കിടുക';

  @override
  String get shareLocationDesc =>
      'നിങ്ങളുടെ ലൈവ് സ്ഥാനം കാണാൻ കുടുംബാംഗങ്ങളെ അനുവദിക്കുക.';

  @override
  String get sharingOptions => 'പങ്കിടൽ ഓപ്ഷനുകൾ';

  @override
  String get generateSharingToken => 'പങ്കിടാനുള്ള QR / ടോക്കൺ ഉണ്ടാക്കുക';

  @override
  String get revokeAccess => 'പ്രവേശനം റദ്ദാക്കുക';

  @override
  String get generateSharingTokenMsg =>
      'പങ്കിടാനുള്ള ടോക്കൺ ഉണ്ടാക്കുക (മോക്ക്)';

  @override
  String get accessRevokedMsg =>
      'എല്ലാ കുടുംബാംഗങ്ങൾക്കുമുള്ള പ്രവേശനം റദ്ദാക്കി (മോക്ക്)';

  @override
  String get settingsTheme => 'തീം';

  @override
  String get settingsLanguage => 'ഭാഷ';

  @override
  String get settingsNotifications => 'അറിയിപ്പുകൾ';

  @override
  String get settingsPrivacy => 'സ്വകാര്യതയും സുരക്ഷയും';

  @override
  String get system => 'സിസ്റ്റം';

  @override
  String get light => 'ലൈറ്റ്';

  @override
  String get dark => 'ഡാർക്ക്';

  @override
  String get mobileVerification => 'മൊബൈൽ വെരിഫിക്കേഷൻ';

  @override
  String get emailVerification => 'Email Verification';

  @override
  String get phoneNumber => 'ഫോൺ നമ്പർ';

  @override
  String get pleaseEnterPhone => 'ദയവായി ഒരു ഫോൺ നമ്പർ നൽകുക';

  @override
  String get pleaseSelectLanguage => 'ദയവായി ഒരു ഭാഷ തിരഞ്ഞെടുക്കുക';

  @override
  String get verificationCodeSentMock =>
      'സ്ഥിരീകരണ കോഡ് അയച്ചു (മോക്ക്ഡ്). ഏതെങ്കിലും 6 അക്കങ്ങൾ നൽകുക.';

  @override
  String get changePhoneNumber => 'ഫോൺ നമ്പർ മാറ്റുക';

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
  String get enterOtpPrompt => 'നിങ്ങളുടെ ഫോണിലേക്ക് അയച്ച 6 അക്ക കോഡ് നൽകുക';

  @override
  String get invalidOtp6 => 'അസാധുവായ OTP. ദയവായി 6 അക്കങ്ങൾ നൽകുക.';

  @override
  String get otpHint => '------';

  @override
  String get agreeToTerms =>
      'By continuing, you agree to the Terms and Privacy Policy.';

  @override
  String get terms => 'Terms';

  @override
  String get sendVerificationCode => 'സ്ഥിരീകരണ കോഡ് അയയ്ക്കുക';

  @override
  String get error => 'പിശക്';

  @override
  String get noData => 'ഡാറ്റ ലഭ്യമല്ല';

  @override
  String get noDataDesc => 'നിലവിൽ ഡാറ്റ ലഭ്യമല്ല';

  @override
  String get refresh => 'പുതുക്കുക';

  @override
  String get addNewTrip => 'പുതിയ യാത്ര ചേർക്കുക';

  @override
  String get noUpcomingTrips =>
      'വരാനിരിക്കുന്ന യാത്രകളില്ല. ഒന്ന് പ്ലാൻ ചെയ്യാൻ \"പുതിയ യാത്ര ചേർക്കുക\" ടാപ്പ് ചെയ്യുക!';

  @override
  String get noPastTrips => 'കഴിഞ്ഞ യാത്രകളില്ല';

  @override
  String get activitiesNotes => 'പ്രവർത്തനങ്ങൾ / കുറിപ്പുകൾ';

  @override
  String get searchLocation => 'സ്ഥലം തിരയുക';

  @override
  String get search => 'തിരയുക';

  @override
  String get searchHint => 'സ്ഥലത്തിൻ്റെ പേരോ വിലാസമോ നൽകുക';

  @override
  String get noResultsFound => 'ഫലങ്ങളൊന്നും കണ്ടെത്തിയില്ല';
}
