// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class AppLocalizationsBn extends AppLocalizations {
  AppLocalizationsBn([String locale = 'bn']) : super(locale);

  @override
  String get appTitle => 'পর্যটক সুরক্ষা অ্যাপ';

  @override
  String get selectLanguage => 'আপনার পছন্দের ভাষা নির্বাচন করুন';

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
  String get continueText => 'চালিয়ে যান';

  @override
  String get phoneVerification => 'ফোন ভেরিফিকেশন';

  @override
  String get enterPhoneNumber => 'আপনার ফোন নম্বর লিখুন';

  @override
  String get phoneHint => '+91XXXXXXXXXX';

  @override
  String get sendOtp => 'OTP পাঠান';

  @override
  String get enterOtp => 'OTP লিখুন';

  @override
  String get verifyOtp => 'OTP যাচাই করুন';

  @override
  String get invalidOtp => 'অবৈধ OTP। অনুগ্রহ করে আবার চেষ্টা করুন।';

  @override
  String verificationFailed(Object error) {
    return 'যাচাইকরণ ব্যর্থ হয়েছে: $error';
  }

  @override
  String get dashboard => 'ড্যাশবোর্ড';

  @override
  String get settings => 'সেটিংস';

  @override
  String get alerts => 'সতর্কবার্তা';

  @override
  String get family => 'পরিবার';

  @override
  String get safetyDashboard => 'সুরক্ষা ড্যাশবোর্ড';

  @override
  String get recentAlerts => 'সাম্প্রতিক সতর্কবার্তা';

  @override
  String get liveVitals => 'লাইভ ভাইটালস';

  @override
  String get locationAndRisk => 'অবস্থান ও ঝুঁকিপ্রবণ এলাকা';

  @override
  String get restrictedZone => 'নিষিদ্ধ এলাকা';

  @override
  String get lowRiskZone => 'কম-ঝুঁকিপূর্ণ এলাকা';

  @override
  String youAreInZone(Object zone) {
    return 'আপনি একটি $zone-এ আছেন। আপনার আশেপাশের বিষয়ে সচেতন থাকুন।';
  }

  @override
  String get safeCardTitle => 'নিরাপদ';

  @override
  String get safeCardDesc =>
      'আপনার বর্তমান সুরক্ষা স্কোর চমৎকার। এটি বজায় রাখুন!';

  @override
  String get tourPlan => 'ভ্রমণ পরিকল্পনা';

  @override
  String get quickActions => 'দ্রুত পদক্ষেপ';

  @override
  String get familyTracking => 'পরিবার ট্র্যাকিং';

  @override
  String get nearbyAttractions => 'কাছাকাছি আকর্ষণ';

  @override
  String get weatherAlerts => 'আবহাওয়া';

  @override
  String get offlineModeCached => 'অফলাইন মোড - ক্যাশ করা ডেটা দেখানো হচ্ছে';

  @override
  String get bandConnected => 'ব্যান্ড সংযুক্ত';

  @override
  String lastUpdatedMins(Object mins) {
    return 'শেষ আপডেট: $mins মিনিট আগে';
  }

  @override
  String get heartRate => 'হৃদস্পন্দন';

  @override
  String get spo2 => 'SpO₂';

  @override
  String get temperature => 'তাপমাত্রা';

  @override
  String get activity => 'কার্যকলাপ';

  @override
  String get normal => 'স্বাভাবিক';

  @override
  String get last1hHeartRate => 'শেষ ১ ঘণ্টার হৃদস্পন্দন';

  @override
  String get tourPlanComingSoon => 'ভ্রমণ পরিকল্পনা স্ক্রিন শীঘ্রই আসছে';

  @override
  String comingSoon(Object feature) {
    return '$feature শীঘ্রই আসছে';
  }

  @override
  String get shareLocationVitals => 'আমার অবস্থান ও ভাইটালস শেয়ার করুন';

  @override
  String get enableToShare => 'পরিবারের সাথে শেয়ার করতে সক্ষম করুন';

  @override
  String get sosAlerts => 'SOS সতর্কবার্তা';

  @override
  String get sosAlertsDesc =>
      'আপনি SOS সতর্কবার্তা ট্রিগার করলে পরিবারের সদস্যদের অবিলম্বে অবহিত করা হবে।';

  @override
  String get sharingWith => 'যাদের সাথে শেয়ার করছেন';

  @override
  String get revokeAllSharing => 'সমস্ত শেয়ারিং বাতিল করুন';

  @override
  String get revokeAllSharingDesc =>
      'এটি সবার সাথে আপনার অবস্থান এবং ভাইটালস শেয়ার করা বন্ধ করবে।';

  @override
  String get severeWeatherWarning => 'তীব্র আবহাওয়ার সতর্কতা';

  @override
  String get severeWeatherDesc =>
      'জাতীয় আবহাওয়া পরিষেবা আপনার এলাকার জন্য তীব্র বজ্রঝড়ের সতর্কতা জারি করেছে। অবিলম্বে আশ্রয় নিন।';

  @override
  String get noInternetCached =>
      'কোনো ইন্টারনেট সংযোগ নেই। ক্যাশ করা সতর্কবার্তা দেখানো হচ্ছে।';

  @override
  String get appAlert => 'অ্যাপ সতর্কবার্তা';

  @override
  String get governmentAlert => 'সরকারি সতর্কবার্তা';

  @override
  String get acknowledge => 'স্বীকার করুন';

  @override
  String get moreInfo => 'আরও তথ্য';

  @override
  String get dismiss => 'খারিজ করুন';

  @override
  String get viewDetails => 'বিস্তারিত দেখুন';

  @override
  String get viewMap => 'মানচিত্র দেখুন';

  @override
  String get checkVitals => 'ভাইটালস পরীক্ষা করুন';

  @override
  String get dismissed => 'খারিজ করা হয়েছে';

  @override
  String get geoFenceWarning => 'জিও-ফেন্স সতর্কতা';

  @override
  String get geoFenceWarningDesc =>
      'এমিলি হোটেলের কাছে \'নিরাপদ এলাকা\' ছেড়ে গেছে।';

  @override
  String get fallDetected => 'পতন সনাক্ত হয়েছে';

  @override
  String get fallDetectedDesc =>
      'ডেভিডের জন্য একটি সম্ভাব্য পতন সনাক্ত করা হয়েছে।';

  @override
  String get lowBattery => 'ব্যাটারি কম';

  @override
  String get lowBatteryDesc => 'সারার সুরক্ষা ব্যান্ডের ব্যাটারি ২০% আছে।';

  @override
  String get geoFenceAlert => 'জিও-ফেন্স সতর্কবার্তা';

  @override
  String get geoFenceAlertDesc =>
      'আপনি একটি নিষিদ্ধ এলাকার কাছাকাছি আসছেন। অনুগ্রহ করে ফিরে যান বা সতর্কতার সাথে এগিয়ে যান।';

  @override
  String get returnToSafety => 'নিরাপত্তায় ফিরে যান';

  @override
  String get proceedWithCaution => 'সতর্কতার সাথে এগিয়ে যান';

  @override
  String get locating => 'অবস্থান নির্ণয় করা হচ্ছে...';

  @override
  String get weather => 'আবহাওয়া';

  @override
  String get currentWeather => 'বর্তমান আবহাওয়া';

  @override
  String get feelsLike => 'অনুভূত হচ্ছে';

  @override
  String get humidity => 'আর্দ্রতা';

  @override
  String get wind => 'বাতাস';

  @override
  String get today => 'আজ';

  @override
  String get tomorrow => 'আগামীকাল';

  @override
  String inXDays(Object days) {
    return '$days দিনের মধ্যে';
  }

  @override
  String get nextDaysTrend => 'পরবর্তী দিনগুলির তাপমাত্রার প্রবণতা';

  @override
  String get profile => 'প্রোফাইল';

  @override
  String get verifiedMember => 'যাচাইকৃত সদস্য';

  @override
  String get securityVerification => 'সুরক্ষা ও যাচাইকরণ';

  @override
  String get passport => 'পাসপোর্ট';

  @override
  String get wallet => 'ওয়ালেট';

  @override
  String get personalTravelDetails => 'ব্যক্তিগত ও ভ্রমণের বিবরণ';

  @override
  String get nationality => 'জাতীয়তা';

  @override
  String get dateOfBirth => 'জন্ম তারিখ';

  @override
  String get itinerary => 'ভ্রমণসূচী';

  @override
  String get emergencyContacts => 'জরুরী পরিচিতি';

  @override
  String get addContact => 'পরিচিতি যোগ করুন';

  @override
  String get appSettings => 'অ্যাপ সেটিংস';

  @override
  String get notifications => 'বিজ্ঞপ্তি';

  @override
  String get theme => 'থিম';

  @override
  String get language => 'ভাষা';

  @override
  String get supportLegal => 'সহায়তা ও আইনি';

  @override
  String get helpCenter => 'সহায়তা কেন্দ্র';

  @override
  String get privacyPolicy => 'গোপনীয়তা নীতি';

  @override
  String get logOut => 'লগ আউট';

  @override
  String get connected => 'সংযুক্ত';

  @override
  String get disconnected => 'সংযোগ বিচ্ছিন্ন';

  @override
  String get idLabel => 'আইডি';

  @override
  String get band => 'ব্যান্ড';

  @override
  String get sendEmergencyAlert => 'জরুরী সতর্কবার্তা পাঠাবেন?';

  @override
  String get sosDialogBody =>
      'এটি কর্তৃপক্ষ এবং আপনার জরুরী পরিচিতিদের অবহিত করবে।';

  @override
  String get cancel => 'বাতিল';

  @override
  String get sendSOS => 'SOS পাঠান';

  @override
  String get geofenceAlertShort => 'জিওফেন্স সতর্কবার্তা';

  @override
  String hoursAgo(Object hours) {
    return '$hours ঘণ্টা আগে';
  }

  @override
  String get tagFamily => 'পরিবার';

  @override
  String get tagOpenAir => 'খোলা বাতাস';

  @override
  String get tagTickets => 'টিকিট';

  @override
  String get tagHistory => 'ইতিহাস';

  @override
  String get tagScenic => 'দর্শনীয়';

  @override
  String get tagFree => 'বিনামূল্যে';

  @override
  String get shareLocation => 'অবস্থান শেয়ার করুন';

  @override
  String get shareMyLocation => 'আমার অবস্থান শেয়ার করুন';

  @override
  String get shareLocationDesc =>
      'পরিবারের সদস্যদের আপনার লাইভ অবস্থান দেখার অনুমতি দিন।';

  @override
  String get sharingOptions => 'শেয়ারিং বিকল্প';

  @override
  String get generateSharingToken => 'শেয়ারিং QR / টোকেন তৈরি করুন';

  @override
  String get revokeAccess => 'অ্যাক্সেস বাতিল করুন';

  @override
  String get generateSharingTokenMsg => 'শেয়ারিং টোকেন তৈরি করুন (মক)';

  @override
  String get accessRevokedMsg =>
      'সমস্ত পরিবারের জন্য অ্যাক্সেস বাতিল করা হয়েছে (মক)';

  @override
  String get settingsTheme => 'থিম';

  @override
  String get settingsLanguage => 'ভাষা';

  @override
  String get settingsNotifications => 'বিজ্ঞপ্তি';

  @override
  String get settingsPrivacy => 'গোপনীয়তা ও সুরক্ষা';

  @override
  String get system => 'সিস্টেম';

  @override
  String get light => 'হালকা';

  @override
  String get dark => 'অন্ধকার';

  @override
  String get mobileVerification => 'মোবাইল ভেরিফিকেশন';

  @override
  String get emailVerification => 'Email Verification';

  @override
  String get phoneNumber => 'ফোন নম্বর';

  @override
  String get pleaseEnterPhone => 'অনুগ্রহ করে একটি ফোন নম্বর লিখুন';

  @override
  String get pleaseSelectLanguage => 'অনুগ্রহ করে একটি ভাষা নির্বাচন করুন';

  @override
  String get verificationCodeSentMock =>
      'ভেরিফিকেশন কোড পাঠানো হয়েছে (মক)। যেকোনো ৬টি সংখ্যা লিখুন।';

  @override
  String get changePhoneNumber => 'ফোন নম্বর পরিবর্তন করুন';

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
  String get enterOtpPrompt => 'আপনার ফোনে পাঠানো ৬-সংখ্যার কোডটি লিখুন';

  @override
  String get invalidOtp6 => 'অবৈধ OTP। অনুগ্রহ করে ৬টি সংখ্যা লিখুন।';

  @override
  String get otpHint => '------';

  @override
  String get agreeToTerms =>
      'By continuing, you agree to the Terms and Privacy Policy.';

  @override
  String get terms => 'Terms';

  @override
  String get sendVerificationCode => 'ভেরিফিকেশন কোড পাঠান';

  @override
  String get error => 'ত্রুটি';

  @override
  String get noData => 'কোনো ডেটা নেই';

  @override
  String get noDataDesc => 'এই মুহূর্তে কোনো ডেটা উপলব্ধ নেই';

  @override
  String get refresh => 'রিফ্রেশ';

  @override
  String get addNewTrip => 'নতুন ভ্রমণ যোগ করুন';

  @override
  String get noUpcomingTrips =>
      'কোনো আসন্ন ভ্রমণ নেই। পরিকল্পনা করতে \"নতুন ভ্রমণ যোগ করুন\"-এ ট্যাপ করুন!';

  @override
  String get noPastTrips => 'কোনো অতীত ভ্রমণ নেই';

  @override
  String get activitiesNotes => 'কার্যকলাপ / নোট';

  @override
  String get searchLocation => 'অবস্থান অনুসন্ধান করুন';

  @override
  String get search => 'অনুসন্ধান';

  @override
  String get searchHint => 'অবস্থানের নাম বা ঠিকানা লিখুন';

  @override
  String get noResultsFound => 'কোনো ফলাফল পাওয়া যায়নি';
}
