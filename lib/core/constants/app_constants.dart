import 'package:flutter/material.dart';

/// Shared UI constants and theme configuration for the entire app
class AppConstants {
  // Spacing constants
  static const double spacingXs = 4.0;
  static const double spacingSm = 8.0;
  static const double spacingMd = 16.0;
  static const double spacingLg = 24.0;
  static const double spacingXl = 32.0;
  static const double spacingXxl = 48.0;

  // Border radius constants
  static const double radiusSm = 8.0;
  static const double radiusMd = 12.0;
  static const double radiusLg = 16.0;
  static const double radiusXl = 24.0;
  static const double radiusFull = 9999.0;

  // Card constants
  static const double cardPadding = 16.0;
  static const double cardBorderRadius = 16.0;
  static const double cardElevation = 12.0;
  static const Offset cardShadowOffset = Offset(0, 4);

  // Button constants
  static const double buttonHeight = 48.0;
  static const double buttonBorderRadius = 12.0;
  static const double buttonPaddingVertical = 14.0;
  static const double buttonPaddingHorizontal = 16.0;

  // Icon constants
  static const double iconSizeSm = 16.0;
  static const double iconSizeMd = 24.0;
  static const double iconSizeLg = 32.0;
  static const double iconSizeXl = 48.0;
  static const double iconSizeXxl = 72.0;

  // Avatar constants
  static const double avatarSizeSm = 24.0;
  static const double avatarSizeMd = 32.0;
  static const double avatarSizeLg = 48.0;
  static const double avatarSizeXl = 64.0;

  // Animation constants
  static const Duration animationFast = Duration(milliseconds: 200);
  static const Duration animationNormal = Duration(milliseconds: 300);
  static const Duration animationSlow = Duration(milliseconds: 500);

  // Common colors
  static const Color primaryColor = Color(0xFFD93F34);
  static const Color primaryColorLight = Color(0xFFFEEBEA);
  static const Color secondaryColor = Color(0xFF2563EB);
  static const Color successColor = Color(0xFF22C55E);
  static const Color warningColor = Color(0xFFF59E0B);
  static const Color errorColor = Color(0xFFEF4444);
  static const Color infoColor = Color(0xFF06B6D4);

  // Text colors
  static const Color textPrimary = Color(0xFF111827);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color textMuted = Color(0xFF9CA3AF);

  // Background colors
  static const Color backgroundPrimary = Colors.white;
  static const Color backgroundSecondary = Color(0xFFF9FAFB);
  static const Color backgroundTertiary = Color(0xFFF3F4F6);

  // Border colors
  static const Color borderLight = Color(0xFFE5E7EB);
  static const Color borderMedium = Color(0xFFD1D5DB);

  // Shadow colors
  static const Color shadowLight = Color(0x14000000);
  static const Color shadowMedium = Color(0x1A000000);
  static const Color shadowHeavy = Color(0x26000000);

  // Status colors
  static const Color onlineColor = Color(0xFF22C55E);
  static const Color offlineColor = Color(0xFF6B7280);
  static const Color busyColor = Color(0xFFF59E0B);
  static const Color awayColor = Color(0xFF6B7280);

  // Alert type colors
  static const Color alertEmergency = Color(0xFFD93F34);
  static const Color alertGovernment = Color(0xFF2563EB);
  static const Color alertMedical = Color(0xFF06B6D4);
  static const Color alertSecurity = Color(0xFFF59E0B);
  static const Color alertInfo = Color(0xFF6B7280);

  // Weather colors
  static const Color weatherSunny = Color(0xFFF59E0B);
  static const Color weatherCloudy = Color(0xFF6B7280);
  static const Color weatherRainy = Color(0xFF2563EB);
  static const Color weatherStormy = Color(0xFF7C3AED);

  // Band colors
  static const Color bandConnected = Color(0xFF22C55E);
  static const Color bandDisconnected = Color(0xFF6B7280);
  static const Color bandPairing = Color(0xFFD93F34);
  static const Color bandError = Color(0xFFEF4444);
}

/// Common border radius values
class AppRadius {
  static const BorderRadius sm = BorderRadius.all(Radius.circular(AppConstants.radiusSm));
  static const BorderRadius md = BorderRadius.all(Radius.circular(AppConstants.radiusMd));
  static const BorderRadius lg = BorderRadius.all(Radius.circular(AppConstants.radiusLg));
  static const BorderRadius xl = BorderRadius.all(Radius.circular(AppConstants.radiusXl));
  static const BorderRadius full = BorderRadius.all(Radius.circular(AppConstants.radiusFull));

  static BorderRadius custom(double radius) => BorderRadius.all(Radius.circular(radius));
}

/// Common padding values
class AppPadding {
  static const EdgeInsets xs = EdgeInsets.all(AppConstants.spacingXs);
  static const EdgeInsets sm = EdgeInsets.all(AppConstants.spacingSm);
  static const EdgeInsets md = EdgeInsets.all(AppConstants.spacingMd);
  static const EdgeInsets lg = EdgeInsets.all(AppConstants.spacingLg);
  static const EdgeInsets xl = EdgeInsets.all(AppConstants.spacingXl);

  static const EdgeInsets horizontalSm = EdgeInsets.symmetric(horizontal: AppConstants.spacingSm);
  static const EdgeInsets horizontalMd = EdgeInsets.symmetric(horizontal: AppConstants.spacingMd);
  static const EdgeInsets horizontalLg = EdgeInsets.symmetric(horizontal: AppConstants.spacingLg);

  static const EdgeInsets verticalSm = EdgeInsets.symmetric(vertical: AppConstants.spacingSm);
  static const EdgeInsets verticalMd = EdgeInsets.symmetric(vertical: AppConstants.spacingMd);
  static const EdgeInsets verticalLg = EdgeInsets.symmetric(vertical: AppConstants.spacingLg);

  static EdgeInsets custom(double value) => EdgeInsets.all(value);
  static EdgeInsets symmetric(double horizontal, double vertical) =>
    EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical);
}

/// Common box shadows
class AppShadows {
  static const List<BoxShadow> light = [
    BoxShadow(
      color: AppConstants.shadowLight,
      blurRadius: 8,
      offset: AppConstants.cardShadowOffset,
    ),
  ];

  static const List<BoxShadow> medium = [
    BoxShadow(
      color: AppConstants.shadowMedium,
      blurRadius: 12,
      offset: AppConstants.cardShadowOffset,
    ),
  ];

  static const List<BoxShadow> heavy = [
    BoxShadow(
      color: AppConstants.shadowHeavy,
      blurRadius: 20,
      offset: Offset(0, 8),
    ),
  ];

  static List<BoxShadow> custom({Color? color, double? blurRadius, Offset? offset}) => [
    BoxShadow(
      color: color ?? AppConstants.shadowLight,
      blurRadius: blurRadius ?? 8,
      offset: offset ?? AppConstants.cardShadowOffset,
    ),
  ];
}

class AppTextStyles {
  static const TextStyle h1 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w800,
    color: AppConstants.textPrimary,
  );

  static const TextStyle h2 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: AppConstants.textPrimary,
  );

  static const TextStyle h3 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppConstants.textPrimary,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppConstants.textPrimary,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppConstants.textPrimary,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppConstants.textSecondary,
  );

  static const TextStyle caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppConstants.textMuted,
  );

  static const TextStyle button = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
}
