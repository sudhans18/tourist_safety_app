import 'package:flutter/material.dart';
import 'package:tourist_safety_app/core/constants/app_constants.dart';

/// Constants specific to the band integration feature
class BandConstants {
  // Band colors
  static const Color bandPrimaryColor = Color(0xFFD93F34);
  static const Color bandLightColor = Color(0xFFFEEBEA);
  static const Color bandBorderColor = Color(0xFFD1D5DB);
  static const Color bandTextColor = Color(0xFF6B7280);

  // Animation and timing
  static const Duration scanAnimationDuration = Duration(seconds: 2);
  static const Duration mockScanDelay = Duration(seconds: 2);

  // Layout constants
  static const double avatarSize = 160.0;
  static const double bandIconSize = 72.0;
  static const double listTileAvatarRadius = 24.0;
  static const double cardPadding = AppConstants.spacingMd;
  static const double cardBorderRadius = AppConstants.radiusLg;
  static const double sectionSpacing = AppConstants.spacingMd;
  static const double contentSpacing = AppConstants.spacingSm;

  // Text sizes
  static const double titleSize = 24.0;
  static const double subtitleSize = 16.0;
}

/// Band connection states
enum BandConnectionState {
  scanning,
  found,
  connecting,
  connected,
  failed,
}

/// Band device information
class BandDevice {
  final String name;
  final String id;
  final String? signalStrength;
  final bool isCompatible;

  const BandDevice({
    required this.name,
    required this.id,
    this.signalStrength,
    this.isCompatible = true,
  });

  static const BandDevice mock = BandDevice(
    name: 'Safety Band',
    id: '123456',
    signalStrength: 'Strong',
    isCompatible: true,
  );
}

/// Band pairing status
class BandPairingStatus {
  final BandConnectionState state;
  final BandDevice? device;
  final String? errorMessage;

  const BandPairingStatus({
    required this.state,
    this.device,
    this.errorMessage,
  });

  static const BandPairingStatus scanning = BandPairingStatus(
    state: BandConnectionState.scanning,
  );

  static const BandPairingStatus found = BandPairingStatus(
    state: BandConnectionState.found,
    device: BandDevice.mock,
  );
}
