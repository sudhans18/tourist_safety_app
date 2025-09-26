import 'package:flutter/material.dart';
import 'package:tourist_safety_app/core/constants/app_constants.dart';

/// Constants specific to the alerts feature
class AlertsConstants {
  // Alert card dimensions
  static const double alertCardBorderRadius = AppConstants.radiusLg;
  static const double alertCardPadding = AppConstants.spacingLg;
  static const double alertCardMarginBottom = AppConstants.spacingSm;

  // Alert type badge
  static const double alertTypeBadgePaddingHorizontal = AppConstants.spacingSm;
  static const double alertTypeBadgePaddingVertical = AppConstants.spacingXs;
  static const double alertTypeBadgeBorderRadius = AppConstants.radiusSm;

  // Alert icon
  static const double alertIconSize = AppConstants.iconSizeMd;
  static const double alertIconContainerSize = AppConstants.avatarSizeLg;

  // Alert content spacing
  static const double alertContentSpacing = AppConstants.spacingMd;
  static const double alertTitleSpacing = AppConstants.spacingSm;
  static const double alertSubtitleSpacing = AppConstants.spacingXs;
  static const double alertActionsSpacing = AppConstants.spacingMd;
  static const double alertActionSpacing = AppConstants.spacingSm;

  // Animation durations
  static const Duration alertAnimationDuration = AppConstants.animationNormal;

  // Alert colors (extending base colors)
  static const Color alertCardBackground = AppConstants.backgroundPrimary;
  static const Color alertCardDimmedBackground = AppConstants.backgroundTertiary;
  static const Color alertTimeTextColor = AppConstants.textSecondary;

  // Alert shadows
  static const List<BoxShadow> alertCardShadows = AppShadows.medium;

  // Offline banner
  static const Color offlineBannerBackground = Color(0xFFFFF3CD);
  static const Color offlineBannerText = Color(0xFFB7791F);
  static const Color offlineBannerIcon = Color(0xFFB7791F);
  static const double offlineBannerBorderRadius = AppConstants.radiusMd;
  static const double offlineBannerPadding = AppConstants.spacingMd;

  // Action button colors
  static const Color primaryActionColor = AppConstants.primaryColor;
  static const Color secondaryActionColor = AppConstants.textPrimary;
  static const Color disabledActionColor = AppConstants.textMuted;

  // Spacing between alerts
  static const double alertsListSpacing = AppConstants.spacingMd;
  static const double alertsListPadding = AppConstants.spacingMd;
}
