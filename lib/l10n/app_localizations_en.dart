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
  String get tourPlan => 'Tour plan';

  @override
  String get quickActions => 'Quick Actions';

  @override
  String get familyTracking => 'Family Tracking';

  @override
  String get nearbyAttractions => 'Nearby Attractions';

  @override
  String get weatherAlerts => 'Weather';

  @override
  String get offlineModeCached => 'Offline Mode - Showing cached data';

  @override
  String get bandConnected => 'Band Connected';

  @override
  String lastUpdatedMins(Object mins) {
    return 'Last updated: $mins mins ago';
  }

  @override
  String get heartRate => 'Heart Rate';

  @override
  String get spo2 => 'SpO₂';

  @override
  String get temperature => 'Temperature';

  @override
  String get activity => 'Activity';

  @override
  String get normal => 'Normal';

  @override
  String get last1hHeartRate => 'Last 1h Heart Rate';

  @override
  String get tourPlanComingSoon => 'Tour plan screen coming soon';

  @override
  String comingSoon(Object feature) {
    return '$feature coming soon';
  }

  @override
  String get shareLocationVitals => 'Share My Location & Vitals';

  @override
  String get enableToShare => 'Enable to share with family';

  @override
  String get sosAlerts => 'SOS Alerts';

  @override
  String get sosAlertsDesc =>
      'Family members will be notified immediately if you trigger an SOS alert.';

  @override
  String get sharingWith => 'Sharing With';

  @override
  String get revokeAllSharing => 'Revoke All Sharing';

  @override
  String get revokeAllSharingDesc =>
      'This will stop sharing your location and vitals with everyone.';

  @override
  String get severeWeatherWarning => 'Severe Weather Warning';

  @override
  String get severeWeatherDesc =>
      'The National Weather Service has issued a severe thunderstorm warning for your area. Seek shelter immediately.';

  @override
  String get noInternetCached =>
      'No internet connection. Showing cached alerts.';

  @override
  String get appAlert => 'App Alert';

  @override
  String get governmentAlert => 'Government Alert';

  @override
  String get acknowledge => 'Acknowledge';

  @override
  String get moreInfo => 'More Info';

  @override
  String get dismiss => 'Dismiss';

  @override
  String get viewDetails => 'View Details';

  @override
  String get viewMap => 'View Map';

  @override
  String get checkVitals => 'Check Vitals';

  @override
  String get dismissed => 'Dismissed';

  @override
  String get geoFenceWarning => 'Geo–Fence Warning';

  @override
  String get geoFenceWarningDesc =>
      'Emily left the \'Safe Zone\' near the hotel.';

  @override
  String get fallDetected => 'Fall Detected';

  @override
  String get fallDetectedDesc => 'A potential fall was detected for David.';

  @override
  String get lowBattery => 'Low Battery';

  @override
  String get lowBatteryDesc => 'Sarah\'s safety band is at 20% battery.';

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
  String get weather => 'Weather';

  @override
  String get currentWeather => 'Current Weather';

  @override
  String get feelsLike => 'Feels like';

  @override
  String get humidity => 'Humidity';

  @override
  String get wind => 'Wind';

  @override
  String get today => 'Today';

  @override
  String get tomorrow => 'Tomorrow';

  @override
  String inXDays(Object days) {
    return 'In $days days';
  }

  @override
  String get nextDaysTrend => 'Next days temperature trend';

  @override
  String get profile => 'Profile';

  @override
  String get verifiedMember => 'Verified Member';

  @override
  String get securityVerification => 'Security & Verification';

  @override
  String get passport => 'Passport';

  @override
  String get wallet => 'Wallet';

  @override
  String get personalTravelDetails => 'Personal & Travel Details';

  @override
  String get nationality => 'Nationality';

  @override
  String get dateOfBirth => 'Date of Birth';

  @override
  String get itinerary => 'Itinerary';

  @override
  String get emergencyContacts => 'Emergency Contacts';

  @override
  String get addContact => 'Add Contact';

  @override
  String get appSettings => 'App Settings';

  @override
  String get notifications => 'Notifications';

  @override
  String get theme => 'Theme';

  @override
  String get language => 'Language';

  @override
  String get supportLegal => 'Support & Legal';

  @override
  String get helpCenter => 'Help Center';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get logOut => 'Log Out';

  @override
  String get connected => 'Connected';

  @override
  String get disconnected => 'Disconnected';

  @override
  String get idLabel => 'ID';

  @override
  String get band => 'Band';

  @override
  String get sendEmergencyAlert => 'Send Emergency Alert?';

  @override
  String get sosDialogBody =>
      'This will notify authorities and your emergency contacts.';

  @override
  String get cancel => 'Cancel';

  @override
  String get sendSOS => 'Send SOS';

  @override
  String get geofenceAlertShort => 'Geofence Alert';

  @override
  String hoursAgo(Object hours) {
    return '${hours}h ago';
  }

  @override
  String get tagFamily => 'Family';

  @override
  String get tagOpenAir => 'Open Air';

  @override
  String get tagTickets => 'Tickets';

  @override
  String get tagHistory => 'History';

  @override
  String get tagScenic => 'Scenic';

  @override
  String get tagFree => 'Free';

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

  @override
  String get error => 'Error';

  @override
  String get noData => 'No Data';

  @override
  String get noDataDesc => 'No data available at the moment';

  @override
  String get refresh => 'Refresh';
}
