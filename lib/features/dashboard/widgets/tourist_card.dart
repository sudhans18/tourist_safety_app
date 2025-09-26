import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:tourist_safety_app/utils/theme/colors.dart';
import 'package:tourist_safety_app/l10n/app_localizations.dart';
import 'package:tourist_safety_app/features/dashboard/constants/dashboard_constants.dart';
import 'package:tourist_safety_app/features/dashboard/services/mock_data_service.dart';

/// Reusable tourist information card widget
class TouristCard extends StatelessWidget {
  final String touristName;
  final String touristId;
  final bool isConnected;

  const TouristCard({
    super.key,
    required this.touristName,
    required this.touristId,
    required this.isConnected,
  });

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final statusColor = isConnected
        ? DashboardMockData.statusColors['connected']!
        : DashboardMockData.statusColors['disconnected']!;
    final statusText = isConnected ? t.connected : t.disconnected;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(DashboardConstants.cardBorderRadius),
        boxShadow: const [
          BoxShadow(
            color: DashboardConstants.cardShadow,
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(DashboardConstants.cardPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: DashboardConstants.avatarRadius,
            backgroundColor: AppColors.redLight,
            child: Text(
              touristName.isNotEmpty ? touristName[0] : '?',
              style: const TextStyle(
                fontWeight: DashboardConstants.extraBold,
                color: AppColors.primaryRed,
                fontSize: 24,
              ),
            ),
          ),
          const SizedBox(width: DashboardConstants.mediumSpacing),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  touristName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: DashboardConstants.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${t.idLabel}: $touristId',
                  style: const TextStyle(color: DashboardConstants.textSecondary),
                ),
                const SizedBox(height: DashboardConstants.smallSpacing),
                Row(
                  children: [
                    Container(
                      width: DashboardConstants.statusIconSize,
                      height: DashboardConstants.statusIconSize,
                      decoration: BoxDecoration(
                        color: statusColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '${t.band}: $statusText',
                      style: TextStyle(
                        color: statusColor,
                        fontWeight: DashboardConstants.semiBold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: DashboardConstants.mediumSpacing),
          Container(
            decoration: BoxDecoration(
              color: DashboardConstants.surfaceColor,
              borderRadius: BorderRadius.circular(DashboardConstants.smallSpacing),
            ),
            padding: const EdgeInsets.all(6),
            child: QrImageView(
              data: touristId,
              version: QrVersions.auto,
              size: DashboardConstants.qrCodeSize,
            ),
          ),
        ],
      ),
    );
  }
}
