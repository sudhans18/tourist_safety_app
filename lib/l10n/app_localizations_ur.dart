// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Urdu (`ur`).
class AppLocalizationsUr extends AppLocalizations {
  AppLocalizationsUr([String locale = 'ur']) : super(locale);

  @override
  String get appTitle => 'سیاحوں کے لیے حفاظتی ایپ';

  @override
  String get selectLanguage => 'اپنی پسندیدہ زبان منتخب کریں';

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
  String get continueText => 'جاری رکھیں';

  @override
  String get phoneVerification => 'فون کی تصدیق';

  @override
  String get enterPhoneNumber => 'اپنا فون نمبر درج کریں';

  @override
  String get phoneHint => '+923XXXXXXXXX';

  @override
  String get sendOtp => 'OTP بھیجیں';

  @override
  String get enterOtp => 'OTP درج کریں';

  @override
  String get verifyOtp => 'OTP کی تصدیق کریں';

  @override
  String get invalidOtp => 'غلط OTP۔ براہ کرم دوبارہ کوشش کریں۔';

  @override
  String verificationFailed(Object error) {
    return 'تصدیق ناکام: $error';
  }

  @override
  String get dashboard => 'ڈیش بورڈ';

  @override
  String get settings => 'ترتیبات';

  @override
  String get alerts => 'انتباہات';

  @override
  String get family => 'خاندان';

  @override
  String get safetyDashboard => 'حفاظتی ڈیش بورڈ';

  @override
  String get recentAlerts => 'حالیہ انتباہات';

  @override
  String get liveVitals => 'لائیو وائٹلز';

  @override
  String get locationAndRisk => 'مقام اور خطرے کا علاقہ';

  @override
  String get restrictedZone => 'ممنوعہ علاقہ';

  @override
  String get lowRiskZone => 'کم خطرے والا علاقہ';

  @override
  String youAreInZone(Object zone) {
    return 'آپ $zone میں ہیں۔ اپنے اردگرد سے باخبر رہیں۔';
  }

  @override
  String get safeCardTitle => 'محفوظ';

  @override
  String get safeCardDesc =>
      'آپ کا موجودہ حفاظتی اسکور بہترین ہے۔ اسے برقرار رکھیں!';

  @override
  String get tourPlan => 'ٹور کا منصوبہ';

  @override
  String get quickActions => 'فوری کارروائیاں';

  @override
  String get familyTracking => 'فیملی ٹریکنگ';

  @override
  String get nearbyAttractions => 'قریبی پرکشش مقامات';

  @override
  String get weatherAlerts => 'موسم';

  @override
  String get offlineModeCached => 'آف لائن موڈ - کیش شدہ ڈیٹا دکھایا جا رہا ہے';

  @override
  String get bandConnected => 'بینڈ منسلک ہے';

  @override
  String lastUpdatedMins(Object mins) {
    return 'آخری بار اپ ڈیٹ کیا گیا: $mins منٹ پہلے';
  }

  @override
  String get heartRate => 'دل کی شرح';

  @override
  String get spo2 => 'SpO₂';

  @override
  String get temperature => 'درجہ حرارت';

  @override
  String get activity => 'سرگرمی';

  @override
  String get normal => 'معمول';

  @override
  String get last1hHeartRate => 'گزشتہ 1 گھنٹے کی دل کی شرح';

  @override
  String get tourPlanComingSoon => 'ٹور پلان اسکرین جلد آرہی ہے';

  @override
  String comingSoon(Object feature) {
    return '$feature جلد آرہا ہے';
  }

  @override
  String get shareLocationVitals => 'میرا مقام اور وائٹلز شیئر کریں';

  @override
  String get enableToShare => 'خاندان کے ساتھ اشتراک کے لیے فعال کریں';

  @override
  String get sosAlerts => 'SOS انتباہات';

  @override
  String get sosAlertsDesc =>
      'اگر آپ SOS الرٹ شروع کرتے ہیں تو خاندان کے اراکین کو فوری طور پر مطلع کیا جائے گا۔';

  @override
  String get sharingWith => 'ان کے ساتھ اشتراک کیا جا رہا ہے';

  @override
  String get revokeAllSharing => 'تمام اشتراک منسوخ کریں';

  @override
  String get revokeAllSharingDesc =>
      'یہ آپ کے مقام اور وائٹلز کو سب کے ساتھ شیئر کرنا بند کر دے گا۔';

  @override
  String get severeWeatherWarning => 'شدید موسمی انتباہ';

  @override
  String get severeWeatherDesc =>
      'محکمہ موسمیات نے آپ کے علاقے کے لیے شدید گرج چمک کے طوفان کی وارننگ جاری کی ہے۔ فوری طور پر پناہ تلاش کریں۔';

  @override
  String get noInternetCached =>
      'انٹرنیٹ کنکشن نہیں ہے۔ کیش شدہ انتباہات دکھائے جا رہے ہیں۔';

  @override
  String get appAlert => 'ایپ الرٹ';

  @override
  String get governmentAlert => 'سرکاری انتباہ';

  @override
  String get acknowledge => 'تسلیم کریں';

  @override
  String get moreInfo => 'مزید معلومات';

  @override
  String get dismiss => 'مسترد کریں';

  @override
  String get viewDetails => 'تفصیلات دیکھیں';

  @override
  String get viewMap => 'نقشہ دیکھیں';

  @override
  String get checkVitals => 'وائٹلز چیک کریں';

  @override
  String get dismissed => 'مسترد کر دیا گیا';

  @override
  String get geoFenceWarning => 'جیو فینس وارننگ';

  @override
  String get geoFenceWarningDesc =>
      'ایملی ہوٹل کے قریب \'محفوظ زون\' سے نکل گئیں۔';

  @override
  String get fallDetected => 'گرنے کا پتہ چلا';

  @override
  String get fallDetectedDesc => 'ڈیوڈ کے ممکنہ طور پر گرنے کا پتہ چلا ہے۔';

  @override
  String get lowBattery => 'کم بیٹری';

  @override
  String get lowBatteryDesc => 'سارہ کے حفاظتی بینڈ کی بیٹری 20 فیصد پر ہے۔';

  @override
  String get geoFenceAlert => 'جیو فینس الرٹ';

  @override
  String get geoFenceAlertDesc =>
      'آپ ایک ممنوعہ علاقے کے قریب پہنچ رہے ہیں۔ براہ کرم واپس مڑیں یا احتیاط سے آگے بڑھیں۔';

  @override
  String get returnToSafety => 'محفوظ مقام پر واپس جائیں';

  @override
  String get proceedWithCaution => 'احتیاط سے آگے بڑھیں';

  @override
  String get locating => 'مقام کا تعین کیا جا رہا ہے...';

  @override
  String get weather => 'موسم';

  @override
  String get currentWeather => 'موجودہ موسم';

  @override
  String get feelsLike => 'محسوس ہوتا ہے';

  @override
  String get humidity => 'نمی';

  @override
  String get wind => 'ہوا';

  @override
  String get today => 'آج';

  @override
  String get tomorrow => 'کل';

  @override
  String inXDays(Object days) {
    return '$days دنوں میں';
  }

  @override
  String get nextDaysTrend => 'آنے والے دنوں کے درجہ حرارت کا رجحان';

  @override
  String get profile => 'پروفائل';

  @override
  String get verifiedMember => 'تصدیق شدہ رکن';

  @override
  String get securityVerification => 'سیکیورٹی اور تصدیق';

  @override
  String get passport => 'پاسپورٹ';

  @override
  String get wallet => 'والیٹ';

  @override
  String get personalTravelDetails => 'ذاتی اور سفری تفصیلات';

  @override
  String get nationality => 'قومیت';

  @override
  String get dateOfBirth => 'تاریخ پیدائش';

  @override
  String get itinerary => 'سفری منصوبہ';

  @override
  String get emergencyContacts => 'ہنگامی رابطے';

  @override
  String get addContact => 'رابطہ شامل کریں';

  @override
  String get appSettings => 'ایپ کی ترتیبات';

  @override
  String get notifications => 'اطلاعات';

  @override
  String get theme => 'تھیم';

  @override
  String get language => 'زبان';

  @override
  String get supportLegal => 'سپورٹ اور قانونی';

  @override
  String get helpCenter => 'امدادی مرکز';

  @override
  String get privacyPolicy => 'رازداری کی پالیسی';

  @override
  String get logOut => 'لاگ آوٹ';

  @override
  String get connected => 'منسلک';

  @override
  String get disconnected => 'منقطع';

  @override
  String get idLabel => 'ID';

  @override
  String get band => 'بینڈ';

  @override
  String get sendEmergencyAlert => 'ہنگامی الرٹ بھیجیں؟';

  @override
  String get sosDialogBody => 'یہ حکام اور آپ کے ہنگامی رابطوں کو مطلع کرے گا۔';

  @override
  String get cancel => 'منسوخ کریں';

  @override
  String get sendSOS => 'SOS بھیجیں';

  @override
  String get geofenceAlertShort => 'جیو فینس الرٹ';

  @override
  String hoursAgo(Object hours) {
    return '$hours گھنٹے پہلے';
  }

  @override
  String get tagFamily => 'خاندان';

  @override
  String get tagOpenAir => 'کھلی ہوا';

  @override
  String get tagTickets => 'ٹکٹس';

  @override
  String get tagHistory => 'تاریخ';

  @override
  String get tagScenic => 'خوبصورت';

  @override
  String get tagFree => 'مفت';

  @override
  String get shareLocation => 'مقام شیئر کریں';

  @override
  String get shareMyLocation => 'میرا مقام شیئر کریں';

  @override
  String get shareLocationDesc =>
      'خاندان کے اراکین کو اپنا لائیو مقام دیکھنے کی اجازت دیں۔';

  @override
  String get sharingOptions => 'شیئرنگ کے اختیارات';

  @override
  String get generateSharingToken => 'شیئرنگ QR / ٹوکن بنائیں';

  @override
  String get revokeAccess => 'رسائی منسوخ کریں';

  @override
  String get generateSharingTokenMsg => 'شیئرنگ ٹوکن بنائیں (ماک)';

  @override
  String get accessRevokedMsg =>
      'تمام خاندان کے لیے رسائی منسوخ کر دی گئی (ماک)';

  @override
  String get settingsTheme => 'تھیم';

  @override
  String get settingsLanguage => 'زبان';

  @override
  String get settingsNotifications => 'اطلاعات';

  @override
  String get settingsPrivacy => 'رازداری اور سیکیورٹی';

  @override
  String get system => 'سسٹم';

  @override
  String get light => 'لائٹ';

  @override
  String get dark => 'ڈارک';

  @override
  String get mobileVerification => 'موبائل کی تصدیق';

  @override
  String get phoneNumber => 'فون نمبر';

  @override
  String get pleaseEnterPhone => 'براہ کرم فون نمبر درج کریں';

  @override
  String get pleaseSelectLanguage => 'براہ کرم ایک زبان منتخب کریں';

  @override
  String get verificationCodeSentMock =>
      'تصدیقی کوڈ بھیجا گیا (ماک)۔ کوئی بھی 6 ہندسے درج کریں۔';

  @override
  String get changePhoneNumber => 'فون نمبر تبدیل کریں';

  @override
  String get enterOtpPrompt => 'اپنے فون پر بھیجا گیا 6 ہندسوں کا کوڈ درج کریں';

  @override
  String get invalidOtp6 => 'غلط OTP۔ براہ کرم 6 ہندسے درج کریں۔';

  @override
  String get sendVerificationCode => 'تصدیقی کوڈ بھیجیں';

  @override
  String get error => 'خرابی';

  @override
  String get noData => 'کوئی ڈیٹا نہیں';

  @override
  String get noDataDesc => 'اس وقت کوئی ڈیٹا دستیاب نہیں ہے';

  @override
  String get refresh => 'ریفریش کریں';

  @override
  String get addNewTrip => 'نیا سفر شامل کریں';

  @override
  String get noUpcomingTrips =>
      'کوئی آنے والا سفر نہیں۔ منصوبہ بنانے کے لیے \"نیا سفر شامل کریں\" پر ٹیپ کریں!';

  @override
  String get noPastTrips => 'کوئی ماضی کا سفر نہیں';

  @override
  String get activitiesNotes => 'سرگرمیاں / نوٹس';

  @override
  String get searchLocation => 'مقام تلاش کریں';

  @override
  String get search => 'تلاش کریں';

  @override
  String get searchHint => 'مقام کا نام یا پتہ درج کریں';

  @override
  String get noResultsFound => 'کوئی نتیجہ نہیں ملا';
}
