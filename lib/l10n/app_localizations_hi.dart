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
  String get alerts => 'अलर्ट';

  @override
  String get family => 'परिवार';

  @override
  String get safetyDashboard => 'सुरक्षा डैशबोर्ड';

  @override
  String get recentAlerts => 'हाल के अलर्ट';

  @override
  String get liveVitals => 'लाइव वाइटल्स';

  @override
  String get locationAndRisk => 'लोकेशन और जोखिम क्षेत्र';

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
      'आपका वर्तमान सुरक्षा स्कोर उत्कृष्ट है। ऐसे ही जारी रखें!';

  @override
  String get geoFenceAlert => 'जियो-फेंस अलर्ट';

  @override
  String get geoFenceAlertDesc =>
      'आप प्रतिबंधित क्षेत्र के पास हैं। कृपया वापस लौटें या सावधानी से आगे बढ़ें।';

  @override
  String get returnToSafety => 'सुरक्षा पर लौटें';

  @override
  String get proceedWithCaution => 'सावधानी से आगे बढ़ें';

  @override
  String get locating => 'स्थान निर्धारित किया जा रहा है...';

  @override
  String get shareLocation => 'लोकेशन शेयर करें';

  @override
  String get shareMyLocation => 'मेरी लोकेशन शेयर करें';

  @override
  String get shareLocationDesc => 'परिवार के सदस्य आपकी लाइव लोकेशन देख सकें।';

  @override
  String get sharingOptions => 'शेयरिंग विकल्प';

  @override
  String get generateSharingToken => 'शेयरिंग QR / टोकन बनाएं';

  @override
  String get revokeAccess => 'एक्सेस हटाएं';

  @override
  String get generateSharingTokenMsg => 'शेयरिंग टोकन बनाएं (मॉक)';

  @override
  String get accessRevokedMsg => 'सभी परिवार के लिए एक्सेस हटा दिया गया (मॉक)';

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
  String get enterOtpPrompt => 'अपने फोन पर भेजा गया 6-अंकीय कोड दर्ज करें';

  @override
  String get invalidOtp6 => 'अमान्य OTP. कृपया 6 अंक दर्ज करें।';

  @override
  String get sendVerificationCode => 'सत्यापन कोड भेजें';
}
