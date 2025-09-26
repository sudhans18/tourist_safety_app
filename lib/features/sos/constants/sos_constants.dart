import 'package:flutter/material.dart';
import 'package:tourist_safety_app/core/constants/app_constants.dart';

/// Constants specific to the SOS feature
class SosConstants {
  // Emergency colors
  static const Color emergencyRed = Color(0xFFD93F34);
  static const Color emergencyRedLight = Color(0xFFFEEBEA);
  static const Color emergencyDarkRed = Color(0xFFB91C1C);

  // Status colors
  static const Color successGreen = Color(0xFF22C55E);
  static const Color warningOrange = Color(0xFFB7791F);
  static const Color offlineBannerColor = Color(0xFFFFF3CD);
  static const Color offlineTextColor = Color(0xFFB7791F);

  // Layout constants
  static const double headerAvatarRadius = 36.0;
  static const double cardPadding = AppConstants.spacingMd;
  static const double cardBorderRadius = AppConstants.radiusLg;
  static const double sectionSpacing = AppConstants.spacingMd;
  static const double contentSpacing = AppConstants.spacingSm;

  // Text sizes
  static const double emergencyTitleSize = 24.0;
  static const double etaNumberSize = 42.0;

  // Animation and timing
  static const Duration pulseAnimationDuration = Duration(seconds: 2);
}

/// SOS status information
class SosStatus {
  final String eta;
  final String responderName;
  final bool isConnected;
  final List<String> notifiedContacts;

  const SosStatus({
    required this.eta,
    required this.responderName,
    required this.isConnected,
    required this.notifiedContacts,
  });

  static const SosStatus mock = SosStatus(
    eta: '5 MIN',
    responderName: 'John Doe',
    isConnected: false,
    notifiedContacts: ['Jane Doe', 'Family Group'],
  );
}

/// SOS emergency information
class EmergencyInfo {
  final String mode;
  final String message;
  final bool isActive;

  const EmergencyInfo({
    required this.mode,
    required this.message,
    required this.isActive,
  });

  static const EmergencyInfo active = EmergencyInfo(
    mode: 'EMERGENCY MODE',
    message: 'SOS has been triggered. Help is on the way.',
    isActive: true,
  );
}
