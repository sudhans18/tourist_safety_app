// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'Sicherheits-App für Touristen';

  @override
  String get selectLanguage => 'Wählen Sie Ihre bevorzugte Sprache';

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
  String get continueText => 'Weiter';

  @override
  String get phoneVerification => 'Telefon-Verifizierung';

  @override
  String get enterPhoneNumber => 'Geben Sie Ihre Telefonnummer ein';

  @override
  String get phoneHint => '+49XXXXXXXXXX';

  @override
  String get sendOtp => 'Code senden';

  @override
  String get enterOtp => 'Code eingeben';

  @override
  String get verifyOtp => 'Code bestätigen';

  @override
  String get invalidOtp => 'Ungültiger Code. Bitte versuchen Sie es erneut.';

  @override
  String verificationFailed(Object error) {
    return 'Verifizierung fehlgeschlagen: $error';
  }

  @override
  String get dashboard => 'Dashboard';

  @override
  String get settings => 'Einstellungen';

  @override
  String get alerts => 'Warnungen';

  @override
  String get family => 'Familie';

  @override
  String get safetyDashboard => 'Sicherheits-Dashboard';

  @override
  String get recentAlerts => 'Aktuelle Warnungen';

  @override
  String get liveVitals => 'Live-Vitalwerte';

  @override
  String get locationAndRisk => 'Standort & Risikozone';

  @override
  String get restrictedZone => 'Sperrzone';

  @override
  String get lowRiskZone => 'Zone mit geringem Risiko';

  @override
  String youAreInZone(Object zone) {
    return 'Sie befinden sich in einer $zone. Achten Sie auf Ihre Umgebung.';
  }

  @override
  String get safeCardTitle => 'Sicher';

  @override
  String get safeCardDesc =>
      'Ihr aktueller Sicherheitswert ist ausgezeichnet. Weiter so!';

  @override
  String get tourPlan => 'Reiseplan';

  @override
  String get quickActions => 'Schnellaktionen';

  @override
  String get familyTracking => 'Familien-Tracking';

  @override
  String get nearbyAttractions => 'Attraktionen in der Nähe';

  @override
  String get weatherAlerts => 'Wetter';

  @override
  String get offlineModeCached =>
      'Offline-Modus - Zwischengespeicherte Daten werden angezeigt';

  @override
  String get bandConnected => 'Armband verbunden';

  @override
  String lastUpdatedMins(Object mins) {
    return 'Zuletzt aktualisiert: vor $mins Min.';
  }

  @override
  String get heartRate => 'Herzfrequenz';

  @override
  String get spo2 => 'SpO₂';

  @override
  String get temperature => 'Temperatur';

  @override
  String get activity => 'Aktivität';

  @override
  String get normal => 'Normal';

  @override
  String get last1hHeartRate => 'Herzfrequenz (letzte Stunde)';

  @override
  String get tourPlanComingSoon =>
      'Der Reiseplan-Bildschirm ist bald verfügbar';

  @override
  String comingSoon(Object feature) {
    return '$feature ist bald verfügbar';
  }

  @override
  String get shareLocationVitals => 'Meinen Standort & Vitalwerte teilen';

  @override
  String get enableToShare => 'Aktivieren, um mit der Familie zu teilen';

  @override
  String get sosAlerts => 'SOS-Warnungen';

  @override
  String get sosAlertsDesc =>
      'Familienmitglieder werden sofort benachrichtigt, wenn Sie eine SOS-Warnung auslösen.';

  @override
  String get sharingWith => 'Geteilt mit';

  @override
  String get revokeAllSharing => 'Alle Freigaben widerrufen';

  @override
  String get revokeAllSharingDesc =>
      'Dies beendet die Freigabe Ihres Standorts und Ihrer Vitalwerte für alle.';

  @override
  String get severeWeatherWarning => 'Unwetterwarnung';

  @override
  String get severeWeatherDesc =>
      'Der Nationale Wetterdienst hat eine schwere Gewitterwarnung für Ihre Region herausgegeben. Suchen Sie sofort Schutz.';

  @override
  String get noInternetCached =>
      'Keine Internetverbindung. Gespeicherte Warnungen werden angezeigt.';

  @override
  String get appAlert => 'App-Warnung';

  @override
  String get governmentAlert => 'Behördliche Warnung';

  @override
  String get acknowledge => 'Bestätigen';

  @override
  String get moreInfo => 'Mehr Infos';

  @override
  String get dismiss => 'Schließen';

  @override
  String get viewDetails => 'Details ansehen';

  @override
  String get viewMap => 'Karte ansehen';

  @override
  String get checkVitals => 'Vitalwerte prüfen';

  @override
  String get dismissed => 'Geschlossen';

  @override
  String get geoFenceWarning => 'Geofence-Warnung';

  @override
  String get geoFenceWarningDesc =>
      'Emily hat die \'Sicherheitszone\' in der Nähe des Hotels verlassen.';

  @override
  String get fallDetected => 'Sturz erkannt';

  @override
  String get fallDetectedDesc => 'Ein möglicher Sturz von David wurde erkannt.';

  @override
  String get lowBattery => 'Akku schwach';

  @override
  String get lowBatteryDesc =>
      'Der Akku von Sarahs Sicherheitsarmband ist bei 20%.';

  @override
  String get geoFenceAlert => 'Geofence-Warnung';

  @override
  String get geoFenceAlertDesc =>
      'Sie nähern sich einer Sperrzone. Bitte kehren Sie um oder fahren Sie mit Vorsicht fort.';

  @override
  String get returnToSafety => 'In die Sicherheitszone zurückkehren';

  @override
  String get proceedWithCaution => 'Mit Vorsicht fortfahren';

  @override
  String get locating => 'Standort wird ermittelt...';

  @override
  String get weather => 'Wetter';

  @override
  String get currentWeather => 'Aktuelles Wetter';

  @override
  String get feelsLike => 'Gefühlt';

  @override
  String get humidity => 'Luftfeuchtigkeit';

  @override
  String get wind => 'Wind';

  @override
  String get today => 'Heute';

  @override
  String get tomorrow => 'Morgen';

  @override
  String inXDays(Object days) {
    return 'In $days Tagen';
  }

  @override
  String get nextDaysTrend => 'Temperaturtrend der nächsten Tage';

  @override
  String get profile => 'Profil';

  @override
  String get verifiedMember => 'Verifiziertes Mitglied';

  @override
  String get securityVerification => 'Sicherheit & Verifizierung';

  @override
  String get passport => 'Reisepass';

  @override
  String get wallet => 'Wallet';

  @override
  String get personalTravelDetails => 'Persönliche & Reisedaten';

  @override
  String get nationality => 'Nationalität';

  @override
  String get dateOfBirth => 'Geburtsdatum';

  @override
  String get itinerary => 'Reiseroute';

  @override
  String get emergencyContacts => 'Notfallkontakte';

  @override
  String get addContact => 'Kontakt hinzufügen';

  @override
  String get appSettings => 'App-Einstellungen';

  @override
  String get notifications => 'Benachrichtigungen';

  @override
  String get theme => 'Design';

  @override
  String get language => 'Sprache';

  @override
  String get supportLegal => 'Support & Rechtliches';

  @override
  String get helpCenter => 'Hilfecenter';

  @override
  String get privacyPolicy => 'Datenschutzrichtlinie';

  @override
  String get logOut => 'Abmelden';

  @override
  String get connected => 'Verbunden';

  @override
  String get disconnected => 'Getrennt';

  @override
  String get idLabel => 'ID';

  @override
  String get band => 'Armband';

  @override
  String get sendEmergencyAlert => 'Notfallwarnung senden?';

  @override
  String get sosDialogBody =>
      'Dies benachrichtigt die Behörden und Ihre Notfallkontakte.';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get sendSOS => 'SOS senden';

  @override
  String get geofenceAlertShort => 'Geofence-Warnung';

  @override
  String hoursAgo(Object hours) {
    return 'Vor $hours Std.';
  }

  @override
  String get tagFamily => 'Familie';

  @override
  String get tagOpenAir => 'Im Freien';

  @override
  String get tagTickets => 'Tickets';

  @override
  String get tagHistory => 'Geschichte';

  @override
  String get tagScenic => 'Malerisch';

  @override
  String get tagFree => 'Kostenlos';

  @override
  String get shareLocation => 'Standort teilen';

  @override
  String get shareMyLocation => 'Meinen Standort teilen';

  @override
  String get shareLocationDesc =>
      'Erlauben Sie Familienmitgliedern, Ihren Live-Standort zu sehen.';

  @override
  String get sharingOptions => 'Freigabeoptionen';

  @override
  String get generateSharingToken => 'Teilen-QR-Code / Token generieren';

  @override
  String get revokeAccess => 'Zugriff widerrufen';

  @override
  String get generateSharingTokenMsg => 'Teilen-Token generieren (simuliert)';

  @override
  String get accessRevokedMsg =>
      'Zugriff für die gesamte Familie widerrufen (simuliert)';

  @override
  String get settingsTheme => 'Design';

  @override
  String get settingsLanguage => 'Sprache';

  @override
  String get settingsNotifications => 'Benachrichtigungen';

  @override
  String get settingsPrivacy => 'Datenschutz & Sicherheit';

  @override
  String get system => 'System';

  @override
  String get light => 'Hell';

  @override
  String get dark => 'Dunkel';

  @override
  String get mobileVerification => 'Mobile Verifizierung';

  @override
  String get phoneNumber => 'Telefonnummer';

  @override
  String get pleaseEnterPhone => 'Bitte geben Sie eine Telefonnummer ein';

  @override
  String get pleaseSelectLanguage => 'Bitte wählen Sie eine Sprache';

  @override
  String get verificationCodeSentMock =>
      'Bestätigungscode gesendet (simuliert). Geben Sie 6 beliebige Ziffern ein.';

  @override
  String get changePhoneNumber => 'Telefonnummer ändern';

  @override
  String get enterOtpPrompt =>
      'Geben Sie den 6-stelligen Code ein, der an Ihr Telefon gesendet wurde';

  @override
  String get invalidOtp6 => 'Ungültiger Code. Bitte geben Sie 6 Ziffern ein.';

  @override
  String get sendVerificationCode => 'Bestätigungscode senden';

  @override
  String get error => 'Fehler';

  @override
  String get noData => 'Keine Daten';

  @override
  String get noDataDesc => 'Momentan keine Daten verfügbar';

  @override
  String get refresh => 'Aktualisieren';

  @override
  String get addNewTrip => 'Neue Reise hinzufügen';

  @override
  String get noUpcomingTrips =>
      'Keine bevorstehenden Reisen. Tippen Sie auf \"Neue Reise hinzufügen\", um eine zu planen!';

  @override
  String get noPastTrips => 'Keine vergangenen Reisen';

  @override
  String get activitiesNotes => 'Aktivitäten / Notizen';

  @override
  String get searchLocation => 'Ort suchen';

  @override
  String get search => 'Suchen';

  @override
  String get searchHint => 'Ortsnamen oder Adresse eingeben';

  @override
  String get noResultsFound => 'Keine Ergebnisse gefunden';
}
