import 'package:flutter/material.dart';

/// Dashboard-specific constants for colors, dimensions, and other values
class DashboardConstants {
  // Colors
  static const Color primaryRed = Color(0xFFD93F34);
  static const Color redLight = Color(0xFFFEEBEA);
  static const Color success = Color(0xFF22C55E);
  static const Color warning = Color(0xFFF59E0B);
  static const Color cardShadow = Color(0x14000000);
  static const Color surfaceColor = Color(0xFFF9FAFB);
  static const Color borderColor = Color(0xFFE5E7EB);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color textPrimary = Color(0xFF111827);

  // Dimensions
  static const double cardBorderRadius = 16.0;
  static const double cardPadding = 16.0;
  static const double cardElevation = 2.0;
  static const double smallSpacing = 8.0;
  static const double mediumSpacing = 12.0;
  static const double largeSpacing = 16.0;
  static const double extraLargeSpacing = 24.0;

  // Animation durations
  static const Duration fastAnimation = Duration(milliseconds: 200);
  static const Duration mediumAnimation = Duration(milliseconds: 320);
  static const Duration slowAnimation = Duration(milliseconds: 500);

  // Grid configurations
  static const int quickActionsGridColumns = 4;
  static const double quickActionsAspectRatio = 0.95;
  static const double vitalsGridAspectRatio = 1.2;

  // Chart dimensions
  static const double chartHeight = 180.0;
  static const double qrCodeSize = 72.0;
  static const double avatarRadius = 28.0;
  static const double statusIconSize = 8.0;

  // Typography
  static const double titleFontSize = 18.0;
  static const double subtitleFontSize = 16.0;
  static const double bodyFontSize = 14.0;
  static const double captionFontSize = 12.0;
  static const double smallFontSize = 10.0;

  // Font weights
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;
}
