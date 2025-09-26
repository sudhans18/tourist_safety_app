import 'package:flutter/material.dart';
import 'package:tourist_safety_app/core/constants/app_constants.dart';
import 'package:tourist_safety_app/core/widgets/app_widgets.dart';
import 'package:tourist_safety_app/features/sos/constants/sos_constants.dart';

/// Optimized SOS emergency header widget
class SosEmergencyHeader extends StatelessWidget {
  final EmergencyInfo emergencyInfo;

  const SosEmergencyHeader({
    super.key,
    required this.emergencyInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // SOS Avatar with pulse animation
        Container(
          width: SosConstants.headerAvatarRadius * 2,
          height: SosConstants.headerAvatarRadius * 2,
          decoration: const BoxDecoration(
            color: SosConstants.emergencyRedLight,
            shape: BoxShape.circle,
          ),
          child: const CircleAvatar(
            radius: SosConstants.headerAvatarRadius,
            backgroundColor: SosConstants.emergencyRedLight,
            child: Text(
              'SOS',
              style: TextStyle(
                color: SosConstants.emergencyRed,
                fontWeight: FontWeight.w800,
                fontSize: 18,
              ),
            ),
          ),
        ),
        const SizedBox(height: SosConstants.contentSpacing),

        // Emergency title
        Text(
          emergencyInfo.mode,
          style: const TextStyle(
            fontSize: SosConstants.emergencyTitleSize,
            fontWeight: FontWeight.w800,
            color: SosConstants.emergencyDarkRed,
          ),
        ),
        const SizedBox(height: SosConstants.contentSpacing),

        // Emergency message
        Text(
          emergencyInfo.message,
          textAlign: TextAlign.center,
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppConstants.textSecondary,
          ),
        ),
      ],
    );
  }
}

/// Optimized SOS status card widget
class SosStatusCard extends StatelessWidget {
  final String title;
  final Widget content;

  const SosStatusCard({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: AppPadding.md,
      borderRadius: AppRadius.lg,
      shadows: AppShadows.medium,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppConstants.textSecondary,
            ),
          ),
          const SizedBox(height: SosConstants.contentSpacing),
          content,
        ],
      ),
    );
  }
}

/// Optimized SOS contact row widget
class SosContactRow extends StatelessWidget {
  final String name;
  final bool isNotified;

  const SosContactRow({
    super.key,
    required this.name,
    this.isNotified = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.person_outline,
          color: AppConstants.textSecondary,
        ),
        const SizedBox(width: SosConstants.contentSpacing),
        Expanded(
          child: Text(
            name,
            style: AppTextStyles.bodyMedium,
          ),
        ),
        if (isNotified)
          Text(
            'Notified',
            style: AppTextStyles.caption.copyWith(
              color: SosConstants.successGreen,
            ),
          ),
      ],
    );
  }
}

/// Optimized SOS offline banner
class SosOfflineBanner extends StatelessWidget {
  const SosOfflineBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppOfflineBanner(
      message: 'No internet connection. Displaying cached data.',
      backgroundColor: SosConstants.offlineBannerColor,
      textColor: SosConstants.offlineTextColor,
      icon: Icons.wifi_off,
    );
  }
}

/// Optimized SOS dismiss button
class SosDismissButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SosDismissButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppElevatedButton(
      text: 'Dismiss',
      onPressed: onPressed,
      backgroundColor: SosConstants.emergencyRed,
    );
  }
}
