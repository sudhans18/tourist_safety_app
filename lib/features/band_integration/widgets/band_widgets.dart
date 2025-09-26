import 'package:flutter/material.dart';
import 'package:tourist_safety_app/core/constants/app_constants.dart';
import 'package:tourist_safety_app/core/widgets/app_widgets.dart';
import 'package:tourist_safety_app/features/band_integration/constants/band_constants.dart';

/// Optimized band scanning animation widget
class BandScanningAnimation extends StatelessWidget {
  final AnimationController controller;

  const BandScanningAnimation({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: Tween(begin: 0.95, end: 1.05).animate(
        CurvedAnimation(
          parent: controller,
          curve: Curves.easeInOut,
        ),
      ),
      child: Container(
        width: BandConstants.avatarSize,
        height: BandConstants.avatarSize,
        decoration: const BoxDecoration(
          color: BandConstants.bandLightColor,
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.bluetooth,
          color: BandConstants.bandPrimaryColor,
          size: BandConstants.bandIconSize,
        ),
      ),
    );
  }
}

/// Optimized band device list tile widget
class BandDeviceTile extends StatelessWidget {
  final BandDevice device;
  final bool selected;
  final VoidCallback onTap;

  const BandDeviceTile({
    super.key,
    required this.device,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(BandConstants.cardPadding),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(BandConstants.cardBorderRadius),
          border: Border.all(color: BandConstants.bandBorderColor),
        ),
        child: Row(
          children: [
            const CircleAvatar(
              radius: BandConstants.listTileAvatarRadius,
              backgroundColor: BandConstants.bandLightColor,
              child: Icon(
                Icons.watch,
                color: BandConstants.bandPrimaryColor,
              ),
            ),
            const SizedBox(width: BandConstants.contentSpacing),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    device.name,
                    style: AppTextStyles.bodyLarge.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: BandConstants.contentSpacing),

                  Text(
                    'Band ID: ${device.id}',
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: BandConstants.bandTextColor,
                    ),
                  ),
                ],
              ),
            ),

            Icon(
              selected
                  ? Icons.radio_button_checked
                  : Icons.radio_button_unchecked,
              color: BandConstants.bandPrimaryColor,
            ),
          ],
        ),
      ),
    );
  }
}

/// Optimized band connection buttons
class BandConnectionButtons extends StatelessWidget {
  final bool canConnect;
  final bool canSkip;
  final VoidCallback onConnect;
  final VoidCallback onSkip;

  const BandConnectionButtons({
    super.key,
    required this.canConnect,
    required this.canSkip,
    required this.onConnect,
    required this.onSkip,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppElevatedButton(
          text: 'Connect',
          onPressed: canConnect ? onConnect : null,
          backgroundColor: BandConstants.bandPrimaryColor,
        ),

        const SizedBox(height: BandConstants.contentSpacing),

        AppOutlinedButton(
          text: 'Skip for now',
          onPressed: canSkip ? onSkip : null,
        ),
      ],
    );
  }
}

/// Optimized band pairing header
class BandPairingHeader extends StatelessWidget {
  const BandPairingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Searching for your band',
          style: AppTextStyles.h3.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: BandConstants.contentSpacing),

        Text(
          'Make sure your band is nearby and in pairing mode',
          style: AppTextStyles.bodyMedium.copyWith(
            color: BandConstants.bandTextColor,
          ),
        ),
      ],
    );
  }
}
