// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Gujarati (`gu`).
class AppLocalizationsGu extends AppLocalizations {
  AppLocalizationsGu([String locale = 'gu']) : super(locale);

  @override
  String get appTitle => 'પ્રવાસી સુરક્ષા એપ';

  @override
  String get selectLanguage => 'તમારી પસંદગીની ભાષા પસંદ કરો';

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
  String get continueText => 'આગળ વધો';

  @override
  String get phoneVerification => 'ફોન ચકાસણી';

  @override
  String get enterPhoneNumber => 'તમારો ફોન નંબર દાખલ કરો';

  @override
  String get phoneHint => '+91XXXXXXXXXX';

  @override
  String get sendOtp => 'OTP મોકલો';

  @override
  String get enterOtp => 'OTP દાખલ કરો';

  @override
  String get verifyOtp => 'OTP ચકાસો';

  @override
  String get invalidOtp => 'અમાન્ય OTP. કૃપા કરીને ફરી પ્રયાસ કરો.';

  @override
  String verificationFailed(Object error) {
    return 'ચકાસણી નિષ્ફળ: $error';
  }

  @override
  String get dashboard => 'ડેશબોર્ડ';

  @override
  String get settings => 'સેટિંગ્સ';

  @override
  String get alerts => 'ચેતવણીઓ';

  @override
  String get family => 'પરિવાર';

  @override
  String get safetyDashboard => 'સુરક્ષા ડેશબોર્ડ';

  @override
  String get recentAlerts => 'તાજેતરની ચેતવણીઓ';

  @override
  String get liveVitals => 'લાઇવ વાઇટલ્સ';

  @override
  String get locationAndRisk => 'સ્થાન અને જોખમ ઝોન';

  @override
  String get restrictedZone => 'પ્રતિબંધિત ઝોન';

  @override
  String get lowRiskZone => 'ઓછા જોખમવાળો ઝોન';

  @override
  String youAreInZone(Object zone) {
    return 'તમે $zone માં છો. તમારી આસપાસના વાતાવરણથી સાવધ રહો.';
  }

  @override
  String get safeCardTitle => 'સુરક્ષિત';

  @override
  String get safeCardDesc =>
      'તમારો વર્તમાન સુરક્ષા સ્કોર ઉત્તમ છે. તેને ચાલુ રાખો!';

  @override
  String get tourPlan => 'પ્રવાસ યોજના';

  @override
  String get quickActions => 'ઝડપી ક્રિયાઓ';

  @override
  String get familyTracking => 'પરિવાર ટ્રેકિંગ';

  @override
  String get nearbyAttractions => 'નજીકના આકર્ષણો';

  @override
  String get weatherAlerts => 'હવામાન';

  @override
  String get offlineModeCached => 'ઑફલાઇન મોડ - કેશ્ડ ડેટા બતાવી રહ્યું છે';

  @override
  String get bandConnected => 'બેન્ડ કનેક્ટેડ છે';

  @override
  String lastUpdatedMins(Object mins) {
    return 'છેલ્લે અપડેટ કર્યું: $mins મિનિટ પહેલા';
  }

  @override
  String get heartRate => 'હૃદયના ધબકારા';

  @override
  String get spo2 => 'SpO₂';

  @override
  String get temperature => 'તાપમાન';

  @override
  String get activity => 'પ્રવૃત્તિ';

  @override
  String get normal => 'સામાન્ય';

  @override
  String get last1hHeartRate => 'છેલ્લા 1 કલાકના હૃદયના ધબકારા';

  @override
  String get tourPlanComingSoon =>
      'પ્રવાસ યોજના સ્ક્રીન ટૂંક સમયમાં આવી રહી છે';

  @override
  String comingSoon(Object feature) {
    return '$feature ટૂંક સમયમાં આવી રહ્યું છે';
  }

  @override
  String get shareLocationVitals => 'મારું સ્થાન અને વાઇટલ્સ શેર કરો';

  @override
  String get enableToShare => 'પરિવાર સાથે શેર કરવા માટે સક્ષમ કરો';

  @override
  String get sosAlerts => 'SOS ચેતવણીઓ';

  @override
  String get sosAlertsDesc =>
      'જો તમે SOS ચેતવણી શરૂ કરશો તો પરિવારના સભ્યોને તરત જ સૂચિત કરવામાં આવશે.';

  @override
  String get sharingWith => 'આની સાથે શેર કરી રહ્યાં છીએ';

  @override
  String get revokeAllSharing => 'બધા શેરિંગ રદ કરો';

  @override
  String get revokeAllSharingDesc =>
      'આ દરેક સાથે તમારું સ્થાન અને વાઇટલ્સ શેર કરવાનું બંધ કરશે.';

  @override
  String get severeWeatherWarning => 'ગંભીર હવામાન ચેતવણી';

  @override
  String get severeWeatherDesc =>
      'રાષ્ટ્રીય હવામાન સેવાએ તમારા વિસ્તાર માટે ગંભીર વાવાઝોડાની ચેતવણી જારી કરી છે. તરત જ આશ્રય શોધો.';

  @override
  String get noInternetCached =>
      'કોઈ ઇન્ટરનેટ કનેક્શન નથી. કેશ્ડ ચેતવણીઓ બતાવી રહ્યું છે.';

  @override
  String get appAlert => 'એપ ચેતવણી';

  @override
  String get governmentAlert => 'સરકારી ચેતવણી';

  @override
  String get acknowledge => 'સ્વીકારો';

  @override
  String get moreInfo => 'વધુ માહિતી';

  @override
  String get dismiss => 'ખારિજ કરો';

  @override
  String get viewDetails => 'વિગતો જુઓ';

  @override
  String get viewMap => 'નકશો જુઓ';

  @override
  String get checkVitals => 'વાઇટલ્સ તપાસો';

  @override
  String get dismissed => 'ખારિજ કર્યું';

  @override
  String get geoFenceWarning => 'જીઓ-ફેન્સ ચેતવણી';

  @override
  String get geoFenceWarningDesc =>
      'એમિલી હોટેલ પાસેના \'સેફ ઝોન\'માંથી બહાર નીકળી ગઈ.';

  @override
  String get fallDetected => 'પડવાની જાણ થઈ';

  @override
  String get fallDetectedDesc => 'ડેવિડના સંભવિત પતનનો પતો લાગ્યો છે.';

  @override
  String get lowBattery => 'ઓછી બેટરી';

  @override
  String get lowBatteryDesc => 'સારાહના સેફ્ટી બેન્ડની બેટરી 20% છે.';

  @override
  String get geoFenceAlert => 'જીઓ-ફેન્સ ચેતવણી';

  @override
  String get geoFenceAlertDesc =>
      'તમે પ્રતિબંધિત વિસ્તારની નજીક જઈ રહ્યા છો. કૃપા કરીને પાછા વળો અથવા સાવધાનીથી આગળ વધો.';

  @override
  String get returnToSafety => 'સુરક્ષા પર પાછા ફરો';

  @override
  String get proceedWithCaution => 'સાવધાનીથી આગળ વધો';

  @override
  String get locating => 'સ્થાન શોધી રહ્યું છે...';

  @override
  String get weather => 'હવામાન';

  @override
  String get currentWeather => 'વર્તમાન હવામાન';

  @override
  String get feelsLike => 'અનુભવાય છે';

  @override
  String get humidity => 'ભેજ';

  @override
  String get wind => 'પવન';

  @override
  String get today => 'આજે';

  @override
  String get tomorrow => 'આવતીકાલે';

  @override
  String inXDays(Object days) {
    return '$days દિવસમાં';
  }

  @override
  String get nextDaysTrend => 'આગામી દિવસોમાં તાપમાનનો ટ્રેન્ડ';

  @override
  String get profile => 'પ્રોફાઇલ';

  @override
  String get verifiedMember => 'ચકાસાયેલ સભ્ય';

  @override
  String get securityVerification => 'સુરક્ષા અને ચકાસણી';

  @override
  String get passport => 'પાસપોર્ટ';

  @override
  String get wallet => 'વૉલેટ';

  @override
  String get personalTravelDetails => 'વ્યક્તિગત અને પ્રવાસની વિગતો';

  @override
  String get nationality => 'રાષ્ટ્રીયતા';

  @override
  String get dateOfBirth => 'જન્મ તારીખ';

  @override
  String get itinerary => 'પ્રવાસ કાર્યક્રમ';

  @override
  String get emergencyContacts => 'કટોકટીના સંપર્કો';

  @override
  String get addContact => 'સંપર્ક ઉમેરો';

  @override
  String get appSettings => 'એપ સેટિંગ્સ';

  @override
  String get notifications => 'સૂચનાઓ';

  @override
  String get theme => 'થીમ';

  @override
  String get language => 'ભાષા';

  @override
  String get supportLegal => 'આધાર અને કાનૂની';

  @override
  String get helpCenter => 'સહાયતા કેન્દ્ર';

  @override
  String get privacyPolicy => 'ગોપનીયતા નીતિ';

  @override
  String get logOut => 'લૉગ આઉટ કરો';

  @override
  String get connected => 'કનેક્ટેડ';

  @override
  String get disconnected => 'ડિસ્કનેક્ટેડ';

  @override
  String get idLabel => 'આઈડી';

  @override
  String get band => 'બેન્ડ';

  @override
  String get sendEmergencyAlert => 'કટોકટીની ચેતવણી મોકલવી છે?';

  @override
  String get sosDialogBody =>
      'આ અધિકારીઓ અને તમારા કટોકટીના સંપર્કોને સૂચિત કરશે.';

  @override
  String get cancel => 'રદ કરો';

  @override
  String get sendSOS => 'SOS મોકલો';

  @override
  String get geofenceAlertShort => 'જીઓફેન્સ ચેતવણી';

  @override
  String hoursAgo(Object hours) {
    return '$hours કલાક પહેલા';
  }

  @override
  String get tagFamily => 'પરિવાર';

  @override
  String get tagOpenAir => 'ખુલ્લી હવા';

  @override
  String get tagTickets => 'ટિકિટ';

  @override
  String get tagHistory => 'ઇતિહાસ';

  @override
  String get tagScenic => 'રમણીય';

  @override
  String get tagFree => 'મફત';

  @override
  String get shareLocation => 'સ્થાન શેર કરો';

  @override
  String get shareMyLocation => 'મારું સ્થાન શેર કરો';

  @override
  String get shareLocationDesc =>
      'પરિવારના સભ્યોને તમારું લાઇવ સ્થાન જોવાની મંજૂરી આપો.';

  @override
  String get sharingOptions => 'શેરિંગ વિકલ્પો';

  @override
  String get generateSharingToken => 'શેરિંગ QR / ટોકન જનરેટ કરો';

  @override
  String get revokeAccess => 'ઍક્સેસ રદ કરો';

  @override
  String get generateSharingTokenMsg => 'શેરિંગ ટોકન જનરેટ કરો (મૉક)';

  @override
  String get accessRevokedMsg =>
      'બધા પરિવાર માટે ઍક્સેસ રદ કરવામાં આવ્યો (મૉક)';

  @override
  String get settingsTheme => 'થીમ';

  @override
  String get settingsLanguage => 'ભાષા';

  @override
  String get settingsNotifications => 'સૂચનાઓ';

  @override
  String get settingsPrivacy => 'ગોપનીયતા અને સુરક્ષા';

  @override
  String get system => 'સિસ્ટમ';

  @override
  String get light => 'લાઇટ';

  @override
  String get dark => 'ડાર્ક';

  @override
  String get mobileVerification => 'મોબાઇલ ચકાસણી';

  @override
  String get phoneNumber => 'ફોન નંબર';

  @override
  String get pleaseEnterPhone => 'કૃપા કરીને ફોન નંબર દાખલ કરો';

  @override
  String get pleaseSelectLanguage => 'કૃપા કરીને એક ભાષા પસંદ કરો';

  @override
  String get verificationCodeSentMock =>
      'ચકાસણી કોડ મોકલ્યો (મૉક). કોઈપણ 6 અંકો દાખલ કરો.';

  @override
  String get changePhoneNumber => 'ફોન નંબર બદલો';

  @override
  String get enterOtpPrompt => 'તમારા ફોન પર મોકલેલો 6-અંકનો કોડ દાખલ કરો';

  @override
  String get invalidOtp6 => 'અમાન્ય OTP. કૃપા કરીને 6 અંકો દાખલ કરો.';

  @override
  String get sendVerificationCode => 'ચકાસણી કોડ મોકલો';

  @override
  String get error => 'ત્રુટિ';

  @override
  String get noData => 'કોઈ ડેટા નથી';

  @override
  String get noDataDesc => 'આ ક્ષણે કોઈ ડેટા ઉપલબ્ધ નથી';

  @override
  String get refresh => 'રિફ્રેશ કરો';

  @override
  String get addNewTrip => 'નવી સફર ઉમેરો';

  @override
  String get noUpcomingTrips =>
      'કોઈ આગામી સફર નથી. એકનું આયોજન કરવા માટે \"નવી સફર ઉમેરો\" પર ટેપ કરો!';

  @override
  String get noPastTrips => 'કોઈ ભૂતકાળની સફર નથી';

  @override
  String get activitiesNotes => 'પ્રવૃત્તિઓ / નોંધો';

  @override
  String get searchLocation => 'સ્થાન શોધો';

  @override
  String get search => 'શોધો';

  @override
  String get searchHint => 'સ્થળનું નામ અથવા સરનામું દાખલ કરો';

  @override
  String get noResultsFound => 'કોઈ પરિણામ મળ્યું નથી';
}
