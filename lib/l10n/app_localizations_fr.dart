// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'App de Sécurité pour Touristes';

  @override
  String get selectLanguage => 'Sélectionnez votre langue préférée';

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
  String get continueText => 'Continuer';

  @override
  String get phoneVerification => 'Vérification du téléphone';

  @override
  String get enterPhoneNumber => 'Entrez votre numéro de téléphone';

  @override
  String get phoneHint => '+33XXXXXXXXX';

  @override
  String get sendOtp => 'Envoyer le code';

  @override
  String get enterOtp => 'Entrez le code';

  @override
  String get verifyOtp => 'Vérifier le code';

  @override
  String get invalidOtp => 'Code invalide. Veuillez réessayer.';

  @override
  String verificationFailed(Object error) {
    return 'Échec de la vérification : $error';
  }

  @override
  String get dashboard => 'Tableau de bord';

  @override
  String get settings => 'Paramètres';

  @override
  String get alerts => 'Alertes';

  @override
  String get family => 'Famille';

  @override
  String get safetyDashboard => 'Tableau de bord de sécurité';

  @override
  String get recentAlerts => 'Alertes récentes';

  @override
  String get liveVitals => 'Signes vitaux en direct';

  @override
  String get locationAndRisk => 'Localisation et Zone de risque';

  @override
  String get restrictedZone => 'Zone réglementée';

  @override
  String get lowRiskZone => 'Zone à faible risque';

  @override
  String youAreInZone(Object zone) {
    return 'Vous êtes dans une $zone. Restez attentif à votre environnement.';
  }

  @override
  String get safeCardTitle => 'En sécurité';

  @override
  String get safeCardDesc =>
      'Votre score de sécurité actuel est excellent. Continuez comme ça !';

  @override
  String get tourPlan => 'Programme du voyage';

  @override
  String get quickActions => 'Actions rapides';

  @override
  String get familyTracking => 'Suivi de la famille';

  @override
  String get nearbyAttractions => 'Attractions à proximité';

  @override
  String get weatherAlerts => 'Météo';

  @override
  String get offlineModeCached =>
      'Mode hors ligne - Affichage des données en cache';

  @override
  String get bandConnected => 'Bracelet connecté';

  @override
  String lastUpdatedMins(Object mins) {
    return 'Dernière mise à jour : il y a $mins min';
  }

  @override
  String get heartRate => 'Fréquence cardiaque';

  @override
  String get spo2 => 'SpO₂';

  @override
  String get temperature => 'Température';

  @override
  String get activity => 'Activité';

  @override
  String get normal => 'Normale';

  @override
  String get last1hHeartRate => 'Fréquence cardiaque (dernière heure)';

  @override
  String get tourPlanComingSoon =>
      'L\'écran du programme de voyage arrive bientôt';

  @override
  String comingSoon(Object feature) {
    return '$feature arrive bientôt';
  }

  @override
  String get shareLocationVitals => 'Partager ma position et mes signes vitaux';

  @override
  String get enableToShare => 'Activer pour partager avec la famille';

  @override
  String get sosAlerts => 'Alertes SOS';

  @override
  String get sosAlertsDesc =>
      'Les membres de votre famille seront immédiatement avertis si vous déclenchez une alerte SOS.';

  @override
  String get sharingWith => 'Partage avec';

  @override
  String get revokeAllSharing => 'Révoquer tous les partages';

  @override
  String get revokeAllSharingDesc =>
      'Ceci arrêtera le partage de votre position et de vos signes vitaux avec tout le monde.';

  @override
  String get severeWeatherWarning => 'Alerte météo sévère';

  @override
  String get severeWeatherDesc =>
      'Le service météorologique national a émis une alerte d\'orage violent pour votre région. Cherchez un abri immédiatement.';

  @override
  String get noInternetCached =>
      'Pas de connexion Internet. Affichage des alertes en cache.';

  @override
  String get appAlert => 'Alerte de l\'application';

  @override
  String get governmentAlert => 'Alerte du gouvernement';

  @override
  String get acknowledge => 'Confirmer la lecture';

  @override
  String get moreInfo => 'Plus d\'infos';

  @override
  String get dismiss => 'Ignorer';

  @override
  String get viewDetails => 'Voir les détails';

  @override
  String get viewMap => 'Voir la carte';

  @override
  String get checkVitals => 'Vérifier les signes vitaux';

  @override
  String get dismissed => 'Ignorée';

  @override
  String get geoFenceWarning => 'Alerte de géorepérage';

  @override
  String get geoFenceWarningDesc =>
      'Emily a quitté la \'Zone de sécurité\' près de l\'hôtel.';

  @override
  String get fallDetected => 'Chute détectée';

  @override
  String get fallDetectedDesc =>
      'Une chute potentielle a été détectée pour David.';

  @override
  String get lowBattery => 'Batterie faible';

  @override
  String get lowBatteryDesc =>
      'Le bracelet de sécurité de Sarah est à 20% de batterie.';

  @override
  String get geoFenceAlert => 'Alerte de géorepérage';

  @override
  String get geoFenceAlertDesc =>
      'Vous approchez d\'une zone réglementée. Veuillez faire demi-tour ou avancer avec prudence.';

  @override
  String get returnToSafety => 'Retourner en zone sûre';

  @override
  String get proceedWithCaution => 'Continuer avec prudence';

  @override
  String get locating => 'Localisation en cours...';

  @override
  String get weather => 'Météo';

  @override
  String get currentWeather => 'Météo actuelle';

  @override
  String get feelsLike => 'Ressenti';

  @override
  String get humidity => 'Humidité';

  @override
  String get wind => 'Vent';

  @override
  String get today => 'Aujourd\'hui';

  @override
  String get tomorrow => 'Demain';

  @override
  String inXDays(Object days) {
    return 'Dans $days jours';
  }

  @override
  String get nextDaysTrend => 'Tendance des températures des prochains jours';

  @override
  String get profile => 'Profil';

  @override
  String get verifiedMember => 'Membre vérifié';

  @override
  String get securityVerification => 'Sécurité et vérification';

  @override
  String get passport => 'Passeport';

  @override
  String get wallet => 'Portefeuille';

  @override
  String get personalTravelDetails => 'Détails personnels et de voyage';

  @override
  String get nationality => 'Nationalité';

  @override
  String get dateOfBirth => 'Date de naissance';

  @override
  String get itinerary => 'Itinéraire';

  @override
  String get emergencyContacts => 'Contacts d\'urgence';

  @override
  String get addContact => 'Ajouter un contact';

  @override
  String get appSettings => 'Paramètres de l\'app';

  @override
  String get notifications => 'Notifications';

  @override
  String get theme => 'Thème';

  @override
  String get language => 'Langue';

  @override
  String get supportLegal => 'Support et mentions légales';

  @override
  String get helpCenter => 'Centre d\'aide';

  @override
  String get privacyPolicy => 'Politique de confidentialité';

  @override
  String get logOut => 'Déconnexion';

  @override
  String get connected => 'Connecté';

  @override
  String get disconnected => 'Déconnecté';

  @override
  String get idLabel => 'ID';

  @override
  String get band => 'Bracelet';

  @override
  String get sendEmergencyAlert => 'Envoyer une alerte d\'urgence ?';

  @override
  String get sosDialogBody =>
      'Cela alertera les autorités et vos contacts d\'urgence.';

  @override
  String get cancel => 'Annuler';

  @override
  String get sendSOS => 'Envoyer le SOS';

  @override
  String get geofenceAlertShort => 'Alerte Geofence';

  @override
  String hoursAgo(Object hours) {
    return 'Il y a ${hours}h';
  }

  @override
  String get tagFamily => 'Famille';

  @override
  String get tagOpenAir => 'Plein air';

  @override
  String get tagTickets => 'Billets';

  @override
  String get tagHistory => 'Histoire';

  @override
  String get tagScenic => 'Pittoresque';

  @override
  String get tagFree => 'Gratuit';

  @override
  String get shareLocation => 'Partager la position';

  @override
  String get shareMyLocation => 'Partager ma position';

  @override
  String get shareLocationDesc =>
      'Autoriser les membres de la famille à voir votre position en direct.';

  @override
  String get sharingOptions => 'Options de partage';

  @override
  String get generateSharingToken => 'Générer un QR code / Jeton de partage';

  @override
  String get revokeAccess => 'Révoquer l\'accès';

  @override
  String get generateSharingTokenMsg =>
      'Générer un jeton de partage (simulation)';

  @override
  String get accessRevokedMsg =>
      'Accès révoqué pour toute la famille (simulation)';

  @override
  String get settingsTheme => 'Thème';

  @override
  String get settingsLanguage => 'Language';

  @override
  String get settingsNotifications => 'Notifications';

  @override
  String get settingsPrivacy => 'Confidentialité et sécurité';

  @override
  String get system => 'Système';

  @override
  String get light => 'Clair';

  @override
  String get dark => 'Sombre';

  @override
  String get mobileVerification => 'Vérification du mobile';

  @override
  String get emailVerification => 'Vérification de l\'e-mail';

  @override
  String get phoneNumber => 'Numéro de téléphone';

  @override
  String get pleaseEnterPhone => 'Veuillez entrer un numéro de téléphone';

  @override
  String get pleaseSelectLanguage => 'Veuillez sélectionner une langue';

  @override
  String get verificationCodeSentMock =>
      'Code de vérification envoyé (simulation). Entrez 6 chiffres.';

  @override
  String get changePhoneNumber => 'Changer de numéro de téléphone';

  @override
  String get useDifferentEmail => 'Utiliser une autre adresse e-mail';

  @override
  String get emailAddress => 'Adresse e-mail';

  @override
  String get emailHint => 'name@example.com';

  @override
  String get sendCodeToEmail =>
      'Nous enverrons un code de vérification à cet e-mail.';

  @override
  String get enterOtpPrompt =>
      'Entrez le code à 6 chiffres envoyé sur votre téléphone';

  @override
  String get invalidOtp6 => 'Code invalide. Veuillez entrer 6 chiffres.';

  @override
  String get otpHint => '------';

  @override
  String get agreeToTerms =>
      'En continuant, vous acceptez les Conditions et la Politique de confidentialité.';

  @override
  String get terms => 'Conditions';

  @override
  String get sendVerificationCode => 'Envoyer le code de vérification';

  @override
  String get error => 'Erreur';

  @override
  String get noData => 'Aucune donnée';

  @override
  String get noDataDesc => 'Aucune donnée disponible pour le moment';

  @override
  String get refresh => 'Actualiser';

  @override
  String get addNewTrip => 'Ajouter un nouveau voyage';

  @override
  String get noUpcomingTrips =>
      'No upcoming trips. Tap \"Add new trip\" to plan one!';

  @override
  String get noPastTrips => 'Aucun voyage passé';

  @override
  String get activitiesNotes => 'Activités / Notes';

  @override
  String get searchLocation => 'Rechercher un lieu';

  @override
  String get search => 'Rechercher';

  @override
  String get searchHint => 'Entrez un nom de lieu ou une adresse';

  @override
  String get noResultsFound => 'Aucun résultat trouvé';
}
