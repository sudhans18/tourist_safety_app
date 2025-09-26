// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Assamese (`as`).
class AppLocalizationsAs extends AppLocalizations {
  AppLocalizationsAs([String locale = 'as']) : super(locale);

  @override
  String get appTitle => 'পৰ্যটক সুৰক্ষা এপ';

  @override
  String get selectLanguage => 'আপোনাৰ পছন্দৰ ভাষা বাছনি কৰক';

  @override
  String get english => 'English';

  @override
  String get hindi => 'हिंदी';

  @override
  String get continueText => 'আগলৈ যাওক';

  @override
  String get phoneVerification => 'ফোন সত্যাপন';

  @override
  String get enterPhoneNumber => 'আপোনাৰ ফোন নম্বৰ দিয়ক';

  @override
  String get phoneHint => '+91XXXXXXXXXX';

  @override
  String get sendOtp => 'OTP পঠিয়াওক';

  @override
  String get enterOtp => 'OTP দিয়ক';

  @override
  String get verifyOtp => 'OTP সত্যাপন কৰক';

  @override
  String get invalidOtp => 'অমান্য OTP। অনুগ্ৰহ কৰি আকৌ চেষ্টা কৰক।';

  @override
  String verificationFailed(Object error) {
    return 'সত্যাপন విఫల হৈছে: $error';
  }

  @override
  String get dashboard => 'ডেশ্ববৰ্ড';

  @override
  String get settings => 'ছেটিংছ';

  @override
  String get alerts => 'সতৰ্কবাণী';

  @override
  String get family => 'পৰিয়াল';

  @override
  String get safetyDashboard => 'সুৰক্ষা ডেশ্ববৰ্ড';

  @override
  String get recentAlerts => 'শেহতীয়া সতৰ্কবাণী';

  @override
  String get liveVitals => 'লাইভ ভাইটালছ';

  @override
  String get locationAndRisk => 'অৱস্থান আৰু বিপদজনক ক্ষেত্ৰ';

  @override
  String get restrictedZone => 'নিষেধাজ্ঞা থকা ক্ষেত্ৰ';

  @override
  String get lowRiskZone => 'কম বিপদজনক ক্ষেত্ৰ';

  @override
  String youAreInZone(Object zone) {
    return 'আপুনি $zoneত আছে। আপোনাৰ চাৰিওফালৰ পৰিৱেশৰ প্ৰতি সচেতন থাকক।';
  }

  @override
  String get safeCardTitle => 'সুৰক্ষিত';

  @override
  String get safeCardDesc =>
      'আপোনাৰ বৰ্তমানৰ সুৰক্ষা স্ক\'ৰ উৎকৃষ্ট। ইয়াক বৰ্তাই ৰাখক!';

  @override
  String get tourPlan => 'ভ্ৰমণ পৰিকল্পনা';

  @override
  String get quickActions => 'দ্ৰুত কাৰ্য্য';

  @override
  String get familyTracking => 'পৰিয়াল ট্ৰেকিং';

  @override
  String get nearbyAttractions => 'ওচৰৰ আকৰ্ষণীয় স্থান';

  @override
  String get weatherAlerts => 'বতৰ';

  @override
  String get offlineModeCached => 'অফলাইন মোড - কেছ কৰা ডাটা দেখুওৱা হৈছে';

  @override
  String get bandConnected => 'বেণ্ড সংযোগ হৈছে';

  @override
  String lastUpdatedMins(Object mins) {
    return 'শেষ আপডেট: $mins মিনিট আগতে';
  }

  @override
  String get heartRate => 'হৃদস্পন্দন';

  @override
  String get spo2 => 'SpO₂';

  @override
  String get temperature => 'তাপমাত্ৰা';

  @override
  String get activity => 'কাৰ্যকলাপ';

  @override
  String get normal => 'স্বাভাৱিক';

  @override
  String get last1hHeartRate => 'শেষ ১ ঘণ্টাৰ হৃদস্পন্দন';

  @override
  String get tourPlanComingSoon => 'ভ্ৰমণ পৰিকল্পনা স্ক্ৰীণ সোনকালে আহি আছে';

  @override
  String comingSoon(Object feature) {
    return '$feature সোনকালে আহি আছে';
  }

  @override
  String get shareLocationVitals => 'মোৰ অৱস্থান আৰু ভাইটালছ শ্বেয়াৰ কৰক';

  @override
  String get enableToShare => 'পৰিয়ালৰ সৈতে শ্বেয়াৰ কৰিবলৈ সক্ষম কৰক';

  @override
  String get sosAlerts => 'SOS সতৰ্কবাণী';

  @override
  String get sosAlertsDesc =>
      'যদি আপুনি SOS সতৰ্কবাণী ট্ৰিগাৰ কৰে, পৰিয়ালৰ সদস্যসকলক তৎক্ষণাৎ জনোৱা হ\'ব।';

  @override
  String get sharingWith => 'যাৰ সৈতে শ্বেয়াৰ কৰিছে';

  @override
  String get revokeAllSharing => 'সকলো শ্বেয়াৰিং বাতিল কৰক';

  @override
  String get revokeAllSharingDesc =>
      'ই সকলোৰে সৈতে আপোনাৰ অৱস্থান আৰু ভাইটালছ শ্বেয়াৰ কৰা বন্ধ কৰিব।';

  @override
  String get severeWeatherWarning => 'ভয়ংকৰ বতৰৰ সতৰ্কবাণী';

  @override
  String get severeWeatherDesc =>
      'ৰাষ্ট্ৰীয় বতৰ সেৱাই আপোনাৰ অঞ্চলৰ বাবে এক ভয়ংকৰ বজ্ৰপাতৰ সতৰ্কবাণী জাৰি কৰিছে। তৎক্ষণাৎ আশ্ৰয় লওক।';

  @override
  String get noInternetCached =>
      'ইণ্টাৰনেট সংযোগ নাই। কেছ কৰা সতৰ্কবাণী দেখুওৱা হৈছে।';

  @override
  String get appAlert => 'এপ সতৰ্কবাণী';

  @override
  String get governmentAlert => 'চৰকাৰী সতৰ্কবাণী';

  @override
  String get acknowledge => 'স্বীকাৰ কৰক';

  @override
  String get moreInfo => 'অধিক তথ্য';

  @override
  String get dismiss => 'অগ্ৰাহ্য কৰক';

  @override
  String get viewDetails => 'বিৱৰণ চাওক';

  @override
  String get viewMap => 'মানচিত্ৰ চাওক';

  @override
  String get checkVitals => 'ভাইটালছ পৰীক্ষা কৰক';

  @override
  String get dismissed => 'অগ্ৰাহ্য কৰা হ\'ল';

  @override
  String get geoFenceWarning => 'জিঅ\'-ফেন্স সতৰ্কবাণী';

  @override
  String get geoFenceWarningDesc =>
      'এমিলীয়ে হোটেলৰ ওচৰৰ \'সুৰক্ষিত ক্ষেত্ৰ\' এৰি গ\'ল।';

  @override
  String get fallDetected => 'পতন ধৰা পৰিছে';

  @override
  String get fallDetectedDesc => 'ডেভিদৰ বাবে এক সম্ভাৱ্য পতন ধৰা পৰিছে।';

  @override
  String get lowBattery => 'বেটাৰী কম';

  @override
  String get lowBatteryDesc => 'ছাৰাৰ সুৰক্ষা বেণ্ডৰ বেটাৰী ২০%ত আছে।';

  @override
  String get geoFenceAlert => 'জিঅ\'-ফেন্স সতৰ্কবাণী';

  @override
  String get geoFenceAlertDesc =>
      'আপুনি এক নিষেধাজ্ঞা থকা অঞ্চলৰ ওচৰ চাপিছে। অনুগ্ৰহ কৰি উভতি যাওক বা সাৱধানতাৰে আগবাঢ়ক।';

  @override
  String get returnToSafety => 'সুৰক্ষিত স্থানলৈ উভতি যাওক';

  @override
  String get proceedWithCaution => 'সাৱধানতাৰে আগবাঢ়ক';

  @override
  String get locating => 'অৱস্থান বিচাৰি আছে...';

  @override
  String get weather => 'বতৰ';

  @override
  String get currentWeather => 'বৰ্তমানৰ বতৰ';

  @override
  String get feelsLike => 'অনুভৱ হয়';

  @override
  String get humidity => 'আৰ্দ্ৰতা';

  @override
  String get wind => 'বতাহ';

  @override
  String get today => 'আজি';

  @override
  String get tomorrow => 'কাইলৈ';

  @override
  String inXDays(Object days) {
    return '$days দিনত';
  }

  @override
  String get nextDaysTrend => 'পৰৱৰ্তী দিনবোৰৰ তাপমাত্ৰাৰ ধাৰা';

  @override
  String get profile => 'প্ৰফাইল';

  @override
  String get verifiedMember => 'সত্যাপিত সদস্য';

  @override
  String get securityVerification => 'সুৰক্ষা আৰু সত্যাপন';

  @override
  String get passport => 'পাছপ\'ৰ্ট';

  @override
  String get wallet => 'ৱালেট';

  @override
  String get personalTravelDetails => 'ব্যক্তিগত আৰু ভ্ৰমণৰ বিৱৰণ';

  @override
  String get nationality => 'ৰাষ্ট্ৰীয়তা';

  @override
  String get dateOfBirth => 'জন্ম তাৰিখ';

  @override
  String get itinerary => 'ভ্ৰমণসূচী';

  @override
  String get emergencyContacts => 'জৰুৰীকালীন যোগাযোগ';

  @override
  String get addContact => 'যোগাযোগ যোগ কৰক';

  @override
  String get appSettings => 'এপ ছেটিংছ';

  @override
  String get notifications => 'জাননী';

  @override
  String get theme => 'থীম';

  @override
  String get language => 'ভাষা';

  @override
  String get supportLegal => 'সমৰ্থন আৰু আইনী';

  @override
  String get helpCenter => 'সহায় কেন্দ্ৰ';

  @override
  String get privacyPolicy => 'গোপনীয়তা নীতি';

  @override
  String get logOut => 'লগ আউট';

  @override
  String get connected => 'সংযোগ হৈছে';

  @override
  String get disconnected => 'সংযোগ বিচ্ছিন্ন';

  @override
  String get idLabel => 'আইডি';

  @override
  String get band => 'বেণ্ড';

  @override
  String get sendEmergencyAlert => 'জৰুৰীকালীন সতৰ্কবাণী পঠিয়াবনে?';

  @override
  String get sosDialogBody =>
      'ই কৰ্তৃপক্ষ আৰু আপোনাৰ জৰুৰীকালীন যোগাযোগসকলক জনোৱা হ\'ব।';

  @override
  String get cancel => 'বাতিল কৰক';

  @override
  String get sendSOS => 'SOS পঠিয়াওক';

  @override
  String get geofenceAlertShort => 'জিঅ\'ফেন্স সতৰ্কবাণী';

  @override
  String hoursAgo(Object hours) {
    return '$hours ঘণ্টা আগতে';
  }

  @override
  String get tagFamily => 'পৰিয়াল';

  @override
  String get tagOpenAir => 'মুক্ত বায়ু';

  @override
  String get tagTickets => 'টিকট';

  @override
  String get tagHistory => 'ইতিহাস';

  @override
  String get tagScenic => 'দৰ্শনীয়';

  @override
  String get tagFree => 'বিনামূলীয়া';

  @override
  String get shareLocation => 'অৱস্থান শ্বেয়াৰ কৰক';

  @override
  String get shareMyLocation => 'মোৰ অৱস্থান শ্বেয়াৰ কৰক';

  @override
  String get shareLocationDesc =>
      'পৰিয়ালৰ সদস্যসকলক আপোনাৰ লাইভ অৱস্থান চাবলৈ অনুমতি দিয়ক।';

  @override
  String get sharingOptions => 'শ্বেয়াৰিং বিকল্প';

  @override
  String get generateSharingToken => 'শ্বেয়াৰিং QR / টোকেন সৃষ্টি কৰক';

  @override
  String get revokeAccess => 'প্ৰৱেশ বাতিল কৰক';

  @override
  String get generateSharingTokenMsg => 'শ্বেয়াৰিং টোকেন সৃষ্টি কৰক (মক)';

  @override
  String get accessRevokedMsg =>
      'সকলো পৰিয়ালৰ বাবে প্ৰৱেশ বাতিল কৰা হ\'ল (মক)';

  @override
  String get settingsTheme => 'থীম';

  @override
  String get settingsLanguage => 'ভাষা';

  @override
  String get settingsNotifications => 'জাননী';

  @override
  String get settingsPrivacy => 'গোপনীয়তা আৰু সুৰক্ষা';

  @override
  String get system => 'চিষ্টেম';

  @override
  String get light => 'পোহৰ';

  @override
  String get dark => 'আন্ধাৰ';

  @override
  String get mobileVerification => 'মোবাইল সত্যাপন';

  @override
  String get phoneNumber => 'ফোন নম্বৰ';

  @override
  String get pleaseEnterPhone => 'অনুগ্ৰহ কৰি এটা ফোন নম্বৰ দিয়ক';

  @override
  String get pleaseSelectLanguage => 'অনুগ্ৰহ কৰি এটা ভাষা বাছনি কৰক';

  @override
  String get verificationCodeSentMock =>
      'সত্যাপন কোড পঠিওৱা হৈছে (মক)। যিকোনো ৬টা অংক দিয়ক।';

  @override
  String get changePhoneNumber => 'ফোন নম্বৰ সলনি কৰক';

  @override
  String get enterOtpPrompt => 'আপোনাৰ ফোনলৈ পঠিওৱা ৬-অংকৰ কোডটো দিয়ক';

  @override
  String get invalidOtp6 => 'অমান্য OTP। অনুগ্ৰহ কৰি ৬টা অংক দিয়ক।';

  @override
  String get sendVerificationCode => 'সত্যাপন কোড পঠিয়াওক';

  @override
  String get error => 'ত্ৰুটি';

  @override
  String get noData => 'কোনো ডাটা নাই';

  @override
  String get noDataDesc => 'বৰ্তমান কোনো ডাটা উপলব্ধ নাই';

  @override
  String get refresh => 'ৰিফ্ৰেশ্ব';

  @override
  String get addNewTrip => 'নতুন ভ্ৰমণ যোগ কৰক';

  @override
  String get noUpcomingTrips =>
      'কোনো আগন্তুক ভ্ৰমণ নাই। এটা পৰিকল্পনা কৰিবলৈ \"নতুন ভ্ৰমণ যোগ কৰক\"ত টিপক!';

  @override
  String get noPastTrips => 'কোনো অতীতৰ ভ্ৰমণ নাই';

  @override
  String get activitiesNotes => 'কাৰ্যকলাপ / টোকা';

  @override
  String get searchLocation => 'অৱস্থান সন্ধান কৰক';

  @override
  String get search => 'সন্ধান কৰক';

  @override
  String get searchHint => 'অৱস্থানৰ নাম বা ঠিকনা দিয়ক';

  @override
  String get noResultsFound => 'কোনো ফলাফল পোৱা নগ\'ল';
}
