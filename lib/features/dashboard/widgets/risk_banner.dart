import 'package:flutter/material.dart';
import 'package:tourist_safety_app/l10n/app_localizations.dart';
import 'package:tourist_safety_app/features/dashboard/constants/dashboard_constants.dart';

/// Reusable risk zone banner widget
class RiskBanner extends StatelessWidget {
  final bool isInRestrictedZone;

  const RiskBanner({super.key, required this.isInRestrictedZone});

  @override
  Widget build(BuildContext context) {
    final color = isInRestrictedZone ? DashboardConstants.warning : DashboardConstants.success;
    final text = isInRestrictedZone
        ? AppLocalizations.of(context)!.restrictedZone
        : AppLocalizations.of(context)!.lowRiskZone;

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
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: color.withAlpha((255 * 0.12).round()),
            child: Icon(
              Icons.shield,
              color: color,
            ),
          ),
          const SizedBox(width: DashboardConstants.mediumSpacing),
          Expanded(
            child: Text(
              AppLocalizations.of(context)!.youAreInZone(text),
              style: const TextStyle(color: DashboardConstants.textPrimary),
            ),
          ),
        ],
      ),
    );
  }
}
