import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_hi.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('hi')
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Tourist Safety App'**
  String get appTitle;

  /// No description provided for @selectLanguage.
  ///
  /// In en, this message translates to:
  /// **'Select your preferred language'**
  String get selectLanguage;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @hindi.
  ///
  /// In en, this message translates to:
  /// **'हिंदी'**
  String get hindi;

  /// No description provided for @continueText.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueText;

  /// No description provided for @phoneVerification.
  ///
  /// In en, this message translates to:
  /// **'Phone Verification'**
  String get phoneVerification;

  /// No description provided for @enterPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter your phone number'**
  String get enterPhoneNumber;

  /// No description provided for @phoneHint.
  ///
  /// In en, this message translates to:
  /// **'+91XXXXXXXXXX'**
  String get phoneHint;

  /// No description provided for @sendOtp.
  ///
  /// In en, this message translates to:
  /// **'Send OTP'**
  String get sendOtp;

  /// No description provided for @enterOtp.
  ///
  /// In en, this message translates to:
  /// **'Enter OTP'**
  String get enterOtp;

  /// No description provided for @verifyOtp.
  ///
  /// In en, this message translates to:
  /// **'Verify OTP'**
  String get verifyOtp;

  /// No description provided for @invalidOtp.
  ///
  /// In en, this message translates to:
  /// **'Invalid OTP. Please try again.'**
  String get invalidOtp;

  /// No description provided for @verificationFailed.
  ///
  /// In en, this message translates to:
  /// **'Verification failed: {error}'**
  String verificationFailed(Object error);

  /// No description provided for @dashboard.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get dashboard;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @alerts.
  ///
  /// In en, this message translates to:
  /// **'Alerts'**
  String get alerts;

  /// No description provided for @family.
  ///
  /// In en, this message translates to:
  /// **'Family'**
  String get family;

  /// No description provided for @safetyDashboard.
  ///
  /// In en, this message translates to:
  /// **'Safety Dashboard'**
  String get safetyDashboard;

  /// No description provided for @recentAlerts.
  ///
  /// In en, this message translates to:
  /// **'Recent Alerts'**
  String get recentAlerts;

  /// No description provided for @liveVitals.
  ///
  /// In en, this message translates to:
  /// **'Live Vitals'**
  String get liveVitals;

  /// No description provided for @locationAndRisk.
  ///
  /// In en, this message translates to:
  /// **'Location & Risk Zone'**
  String get locationAndRisk;

  /// No description provided for @restrictedZone.
  ///
  /// In en, this message translates to:
  /// **'Restricted Zone'**
  String get restrictedZone;

  /// No description provided for @lowRiskZone.
  ///
  /// In en, this message translates to:
  /// **'Low-Risk Zone'**
  String get lowRiskZone;

  /// No description provided for @youAreInZone.
  ///
  /// In en, this message translates to:
  /// **'You are in a {zone}. Stay aware of your surroundings.'**
  String youAreInZone(Object zone);

  /// No description provided for @safeCardTitle.
  ///
  /// In en, this message translates to:
  /// **'Safe'**
  String get safeCardTitle;

  /// No description provided for @safeCardDesc.
  ///
  /// In en, this message translates to:
  /// **'Your current safety score is excellent. Keep it up!'**
  String get safeCardDesc;

  /// No description provided for @tourPlan.
  ///
  /// In en, this message translates to:
  /// **'Tour plan'**
  String get tourPlan;

  /// No description provided for @quickActions.
  ///
  /// In en, this message translates to:
  /// **'Quick Actions'**
  String get quickActions;

  /// No description provided for @familyTracking.
  ///
  /// In en, this message translates to:
  /// **'Family Tracking'**
  String get familyTracking;

  /// No description provided for @nearbyAttractions.
  ///
  /// In en, this message translates to:
  /// **'Nearby Attractions'**
  String get nearbyAttractions;

  /// No description provided for @weatherAlerts.
  ///
  /// In en, this message translates to:
  /// **'Weather'**
  String get weatherAlerts;

  /// No description provided for @offlineModeCached.
  ///
  /// In en, this message translates to:
  /// **'Offline Mode - Showing cached data'**
  String get offlineModeCached;

  /// No description provided for @bandConnected.
  ///
  /// In en, this message translates to:
  /// **'Band Connected'**
  String get bandConnected;

  /// No description provided for @lastUpdatedMins.
  ///
  /// In en, this message translates to:
  /// **'Last updated: {mins} mins ago'**
  String lastUpdatedMins(Object mins);

  /// No description provided for @heartRate.
  ///
  /// In en, this message translates to:
  /// **'Heart Rate'**
  String get heartRate;

  /// No description provided for @spo2.
  ///
  /// In en, this message translates to:
  /// **'SpO₂'**
  String get spo2;

  /// No description provided for @temperature.
  ///
  /// In en, this message translates to:
  /// **'Temperature'**
  String get temperature;

  /// No description provided for @activity.
  ///
  /// In en, this message translates to:
  /// **'Activity'**
  String get activity;

  /// No description provided for @normal.
  ///
  /// In en, this message translates to:
  /// **'Normal'**
  String get normal;

  /// No description provided for @last1hHeartRate.
  ///
  /// In en, this message translates to:
  /// **'Last 1h Heart Rate'**
  String get last1hHeartRate;

  /// No description provided for @tourPlanComingSoon.
  ///
  /// In en, this message translates to:
  /// **'Tour plan screen coming soon'**
  String get tourPlanComingSoon;

  /// No description provided for @comingSoon.
  ///
  /// In en, this message translates to:
  /// **'{feature} coming soon'**
  String comingSoon(Object feature);

  /// No description provided for @shareLocationVitals.
  ///
  /// In en, this message translates to:
  /// **'Share My Location & Vitals'**
  String get shareLocationVitals;

  /// No description provided for @enableToShare.
  ///
  /// In en, this message translates to:
  /// **'Enable to share with family'**
  String get enableToShare;

  /// No description provided for @sosAlerts.
  ///
  /// In en, this message translates to:
  /// **'SOS Alerts'**
  String get sosAlerts;

  /// No description provided for @sosAlertsDesc.
  ///
  /// In en, this message translates to:
  /// **'Family members will be notified immediately if you trigger an SOS alert.'**
  String get sosAlertsDesc;

  /// No description provided for @sharingWith.
  ///
  /// In en, this message translates to:
  /// **'Sharing With'**
  String get sharingWith;

  /// No description provided for @revokeAllSharing.
  ///
  /// In en, this message translates to:
  /// **'Revoke All Sharing'**
  String get revokeAllSharing;

  /// No description provided for @revokeAllSharingDesc.
  ///
  /// In en, this message translates to:
  /// **'This will stop sharing your location and vitals with everyone.'**
  String get revokeAllSharingDesc;

  /// No description provided for @severeWeatherWarning.
  ///
  /// In en, this message translates to:
  /// **'Severe Weather Warning'**
  String get severeWeatherWarning;

  /// No description provided for @severeWeatherDesc.
  ///
  /// In en, this message translates to:
  /// **'The National Weather Service has issued a severe thunderstorm warning for your area. Seek shelter immediately.'**
  String get severeWeatherDesc;

  /// No description provided for @noInternetCached.
  ///
  /// In en, this message translates to:
  /// **'No internet connection. Showing cached alerts.'**
  String get noInternetCached;

  /// No description provided for @appAlert.
  ///
  /// In en, this message translates to:
  /// **'App Alert'**
  String get appAlert;

  /// No description provided for @governmentAlert.
  ///
  /// In en, this message translates to:
  /// **'Government Alert'**
  String get governmentAlert;

  /// No description provided for @acknowledge.
  ///
  /// In en, this message translates to:
  /// **'Acknowledge'**
  String get acknowledge;

  /// No description provided for @moreInfo.
  ///
  /// In en, this message translates to:
  /// **'More Info'**
  String get moreInfo;

  /// No description provided for @dismiss.
  ///
  /// In en, this message translates to:
  /// **'Dismiss'**
  String get dismiss;

  /// No description provided for @viewDetails.
  ///
  /// In en, this message translates to:
  /// **'View Details'**
  String get viewDetails;

  /// No description provided for @viewMap.
  ///
  /// In en, this message translates to:
  /// **'View Map'**
  String get viewMap;

  /// No description provided for @checkVitals.
  ///
  /// In en, this message translates to:
  /// **'Check Vitals'**
  String get checkVitals;

  /// No description provided for @dismissed.
  ///
  /// In en, this message translates to:
  /// **'Dismissed'**
  String get dismissed;

  /// No description provided for @geoFenceWarning.
  ///
  /// In en, this message translates to:
  /// **'Geo–Fence Warning'**
  String get geoFenceWarning;

  /// No description provided for @geoFenceWarningDesc.
  ///
  /// In en, this message translates to:
  /// **'Emily left the \'Safe Zone\' near the hotel.'**
  String get geoFenceWarningDesc;

  /// No description provided for @fallDetected.
  ///
  /// In en, this message translates to:
  /// **'Fall Detected'**
  String get fallDetected;

  /// No description provided for @fallDetectedDesc.
  ///
  /// In en, this message translates to:
  /// **'A potential fall was detected for David.'**
  String get fallDetectedDesc;

  /// No description provided for @lowBattery.
  ///
  /// In en, this message translates to:
  /// **'Low Battery'**
  String get lowBattery;

  /// No description provided for @lowBatteryDesc.
  ///
  /// In en, this message translates to:
  /// **'Sarah\'s safety band is at 20% battery.'**
  String get lowBatteryDesc;

  /// No description provided for @geoFenceAlert.
  ///
  /// In en, this message translates to:
  /// **'Geo-fence Alert'**
  String get geoFenceAlert;

  /// No description provided for @geoFenceAlertDesc.
  ///
  /// In en, this message translates to:
  /// **'You are approaching a restricted area. Please turn back or proceed with caution.'**
  String get geoFenceAlertDesc;

  /// No description provided for @returnToSafety.
  ///
  /// In en, this message translates to:
  /// **'Return to Safety'**
  String get returnToSafety;

  /// No description provided for @proceedWithCaution.
  ///
  /// In en, this message translates to:
  /// **'Proceed with Caution'**
  String get proceedWithCaution;

  /// No description provided for @locating.
  ///
  /// In en, this message translates to:
  /// **'Locating...'**
  String get locating;

  /// No description provided for @weather.
  ///
  /// In en, this message translates to:
  /// **'Weather'**
  String get weather;

  /// No description provided for @currentWeather.
  ///
  /// In en, this message translates to:
  /// **'Current Weather'**
  String get currentWeather;

  /// No description provided for @feelsLike.
  ///
  /// In en, this message translates to:
  /// **'Feels like'**
  String get feelsLike;

  /// No description provided for @humidity.
  ///
  /// In en, this message translates to:
  /// **'Humidity'**
  String get humidity;

  /// No description provided for @wind.
  ///
  /// In en, this message translates to:
  /// **'Wind'**
  String get wind;

  /// No description provided for @today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;

  /// No description provided for @tomorrow.
  ///
  /// In en, this message translates to:
  /// **'Tomorrow'**
  String get tomorrow;

  /// No description provided for @inXDays.
  ///
  /// In en, this message translates to:
  /// **'In {days} days'**
  String inXDays(Object days);

  /// No description provided for @nextDaysTrend.
  ///
  /// In en, this message translates to:
  /// **'Next days temperature trend'**
  String get nextDaysTrend;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @verifiedMember.
  ///
  /// In en, this message translates to:
  /// **'Verified Member'**
  String get verifiedMember;

  /// No description provided for @securityVerification.
  ///
  /// In en, this message translates to:
  /// **'Security & Verification'**
  String get securityVerification;

  /// No description provided for @passport.
  ///
  /// In en, this message translates to:
  /// **'Passport'**
  String get passport;

  /// No description provided for @wallet.
  ///
  /// In en, this message translates to:
  /// **'Wallet'**
  String get wallet;

  /// No description provided for @personalTravelDetails.
  ///
  /// In en, this message translates to:
  /// **'Personal & Travel Details'**
  String get personalTravelDetails;

  /// No description provided for @nationality.
  ///
  /// In en, this message translates to:
  /// **'Nationality'**
  String get nationality;

  /// No description provided for @dateOfBirth.
  ///
  /// In en, this message translates to:
  /// **'Date of Birth'**
  String get dateOfBirth;

  /// No description provided for @itinerary.
  ///
  /// In en, this message translates to:
  /// **'Itinerary'**
  String get itinerary;

  /// No description provided for @emergencyContacts.
  ///
  /// In en, this message translates to:
  /// **'Emergency Contacts'**
  String get emergencyContacts;

  /// No description provided for @addContact.
  ///
  /// In en, this message translates to:
  /// **'Add Contact'**
  String get addContact;

  /// No description provided for @appSettings.
  ///
  /// In en, this message translates to:
  /// **'App Settings'**
  String get appSettings;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @supportLegal.
  ///
  /// In en, this message translates to:
  /// **'Support & Legal'**
  String get supportLegal;

  /// No description provided for @helpCenter.
  ///
  /// In en, this message translates to:
  /// **'Help Center'**
  String get helpCenter;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @logOut.
  ///
  /// In en, this message translates to:
  /// **'Log Out'**
  String get logOut;

  /// No description provided for @connected.
  ///
  /// In en, this message translates to:
  /// **'Connected'**
  String get connected;

  /// No description provided for @disconnected.
  ///
  /// In en, this message translates to:
  /// **'Disconnected'**
  String get disconnected;

  /// No description provided for @idLabel.
  ///
  /// In en, this message translates to:
  /// **'ID'**
  String get idLabel;

  /// No description provided for @band.
  ///
  /// In en, this message translates to:
  /// **'Band'**
  String get band;

  /// No description provided for @sendEmergencyAlert.
  ///
  /// In en, this message translates to:
  /// **'Send Emergency Alert?'**
  String get sendEmergencyAlert;

  /// No description provided for @sosDialogBody.
  ///
  /// In en, this message translates to:
  /// **'This will notify authorities and your emergency contacts.'**
  String get sosDialogBody;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @sendSOS.
  ///
  /// In en, this message translates to:
  /// **'Send SOS'**
  String get sendSOS;

  /// No description provided for @geofenceAlertShort.
  ///
  /// In en, this message translates to:
  /// **'Geofence Alert'**
  String get geofenceAlertShort;

  /// No description provided for @hoursAgo.
  ///
  /// In en, this message translates to:
  /// **'{hours}h ago'**
  String hoursAgo(Object hours);

  /// No description provided for @tagFamily.
  ///
  /// In en, this message translates to:
  /// **'Family'**
  String get tagFamily;

  /// No description provided for @tagOpenAir.
  ///
  /// In en, this message translates to:
  /// **'Open Air'**
  String get tagOpenAir;

  /// No description provided for @tagTickets.
  ///
  /// In en, this message translates to:
  /// **'Tickets'**
  String get tagTickets;

  /// No description provided for @tagHistory.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get tagHistory;

  /// No description provided for @tagScenic.
  ///
  /// In en, this message translates to:
  /// **'Scenic'**
  String get tagScenic;

  /// No description provided for @tagFree.
  ///
  /// In en, this message translates to:
  /// **'Free'**
  String get tagFree;

  /// No description provided for @shareLocation.
  ///
  /// In en, this message translates to:
  /// **'Share Location'**
  String get shareLocation;

  /// No description provided for @shareMyLocation.
  ///
  /// In en, this message translates to:
  /// **'Share My Location'**
  String get shareMyLocation;

  /// No description provided for @shareLocationDesc.
  ///
  /// In en, this message translates to:
  /// **'Allow family members to see your live location.'**
  String get shareLocationDesc;

  /// No description provided for @sharingOptions.
  ///
  /// In en, this message translates to:
  /// **'Sharing Options'**
  String get sharingOptions;

  /// No description provided for @generateSharingToken.
  ///
  /// In en, this message translates to:
  /// **'Generate Sharing QR / Token'**
  String get generateSharingToken;

  /// No description provided for @revokeAccess.
  ///
  /// In en, this message translates to:
  /// **'Revoke Access'**
  String get revokeAccess;

  /// No description provided for @generateSharingTokenMsg.
  ///
  /// In en, this message translates to:
  /// **'Generate sharing token (mock)'**
  String get generateSharingTokenMsg;

  /// No description provided for @accessRevokedMsg.
  ///
  /// In en, this message translates to:
  /// **'Access revoked for all family (mock)'**
  String get accessRevokedMsg;

  /// No description provided for @settingsTheme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get settingsTheme;

  /// No description provided for @settingsLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settingsLanguage;

  /// No description provided for @settingsNotifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get settingsNotifications;

  /// No description provided for @settingsPrivacy.
  ///
  /// In en, this message translates to:
  /// **'Privacy & Security'**
  String get settingsPrivacy;

  /// No description provided for @system.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get system;

  /// No description provided for @light.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get light;

  /// No description provided for @dark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get dark;

  /// No description provided for @mobileVerification.
  ///
  /// In en, this message translates to:
  /// **'Mobile Verification'**
  String get mobileVerification;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneNumber;

  /// No description provided for @pleaseEnterPhone.
  ///
  /// In en, this message translates to:
  /// **'Please enter a phone number'**
  String get pleaseEnterPhone;

  /// No description provided for @pleaseSelectLanguage.
  ///
  /// In en, this message translates to:
  /// **'Please select a language'**
  String get pleaseSelectLanguage;

  /// No description provided for @verificationCodeSentMock.
  ///
  /// In en, this message translates to:
  /// **'Verification code sent (mocked). Enter any 6 digits.'**
  String get verificationCodeSentMock;

  /// No description provided for @changePhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Change phone number'**
  String get changePhoneNumber;

  /// No description provided for @enterOtpPrompt.
  ///
  /// In en, this message translates to:
  /// **'Enter the 6-digit code sent to your phone'**
  String get enterOtpPrompt;

  /// No description provided for @invalidOtp6.
  ///
  /// In en, this message translates to:
  /// **'Invalid OTP. Please enter 6 digits.'**
  String get invalidOtp6;

  /// No description provided for @sendVerificationCode.
  ///
  /// In en, this message translates to:
  /// **'Send Verification Code'**
  String get sendVerificationCode;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @noData.
  ///
  /// In en, this message translates to:
  /// **'No Data'**
  String get noData;

  /// No description provided for @noDataDesc.
  ///
  /// In en, this message translates to:
  /// **'No data available at the moment'**
  String get noDataDesc;

  /// No description provided for @refresh.
  ///
  /// In en, this message translates to:
  /// **'Refresh'**
  String get refresh;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'hi'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'hi':
      return AppLocalizationsHi();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
