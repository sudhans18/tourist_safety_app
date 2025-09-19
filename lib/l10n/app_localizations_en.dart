// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Tourist Safety App';

  @override
  String get selectLanguage => 'Select your preferred language';

  @override
  String get english => 'English';

  @override
  String get hindi => 'हिंदी';

  @override
  String get continueText => 'Continue';

  @override
  String get phoneVerification => 'Phone Verification';

  @override
  String get enterPhoneNumber => 'Enter your phone number';

  @override
  String get phoneHint => '+91XXXXXXXXXX';

  @override
  String get sendOtp => 'Send OTP';

  @override
  String get enterOtp => 'Enter OTP';

  @override
  String get verifyOtp => 'Verify OTP';

  @override
  String get invalidOtp => 'Invalid OTP. Please try again.';

  @override
  String verificationFailed(Object error) {
    return 'Verification failed: $error';
  }

  @override
  String get dashboard => 'Dashboard';

  @override
  String get settings => 'Settings';

  @override
  String get alerts => 'Alerts';

  @override
  String get family => 'Family';

  @override
  String get safetyDashboard => 'Safety Dashboard';

  @override
  String get recentAlerts => 'Recent Alerts';

  @override
  String get liveVitals => 'Live Vitals';

  @override
  String get locationAndRisk => 'Location & Risk Zone';

  @override
  String get restrictedZone => 'Restricted Zone';

  @override
  String get lowRiskZone => 'Low-Risk Zone';

  @override
  String youAreInZone(Object zone) {
    return 'You are in a $zone. Stay aware of your surroundings.';
  }

  @override
  String get safeCardTitle => 'Safe';

  @override
  String get safeCardDesc =>
      'Your current safety score is excellent. Keep it up!';

  @override
  String get geoFenceAlert => 'Geo-fence Alert';

  @override
  String get geoFenceAlertDesc =>
      'You are approaching a restricted area. Please turn back or proceed with caution.';

  @override
  String get returnToSafety => 'Return to Safety';

  @override
  String get proceedWithCaution => 'Proceed with Caution';

  @override
  String get locating => 'Locating...';

  @override
  String get shareLocation => 'Share Location';

  @override
  String get shareMyLocation => 'Share My Location';

  @override
  String get shareLocationDesc =>
      'Allow family members to see your live location.';

  @override
  String get sharingOptions => 'Sharing Options';

  @override
  String get generateSharingToken => 'Generate Sharing QR / Token';

  @override
  String get revokeAccess => 'Revoke Access';

  @override
  String get generateSharingTokenMsg => 'Generate sharing token (mock)';

  @override
  String get accessRevokedMsg => 'Access revoked for all family (mock)';

  @override
  String get settingsTheme => 'Theme';

  @override
  String get settingsLanguage => 'Language';

  @override
  String get settingsNotifications => 'Notifications';

  @override
  String get settingsPrivacy => 'Privacy & Security';

  @override
  String get system => 'System';

  @override
  String get light => 'Light';

  @override
  String get dark => 'Dark';

  @override
  String get mobileVerification => 'Mobile Verification';

  @override
  String get phoneNumber => 'Phone Number';

  @override
  String get pleaseEnterPhone => 'Please enter a phone number';

  @override
  String get pleaseSelectLanguage => 'Please select a language';

  @override
  String get verificationCodeSentMock =>
      'Verification code sent (mocked). Enter any 6 digits.';

  @override
  String get changePhoneNumber => 'Change phone number';

  @override
  String get enterOtpPrompt => 'Enter the 6-digit code sent to your phone';

  @override
  String get invalidOtp6 => 'Invalid OTP. Please enter 6 digits.';

  @override
  String get sendVerificationCode => 'Send Verification Code';
}
