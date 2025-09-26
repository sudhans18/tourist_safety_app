import 'package:flutter/material.dart';
import 'package:tourist_safety_app/l10n/app_localizations.dart';
import 'package:tourist_safety_app/features/dashboard/constants/dashboard_constants.dart';

/// Reusable safety score card widget
class SafetyScoreCard extends StatelessWidget {
  const SafetyScoreCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: DashboardConstants.success,
        borderRadius: BorderRadius.circular(DashboardConstants.cardBorderRadius),
        boxShadow: const [
          BoxShadow(
            color: Color(0x3322C55E),
            blurRadius: 18,
            offset: Offset(0, 10),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.verified_user,
            color: Colors.white,
            size: 28,
          ),
          const SizedBox(width: DashboardConstants.mediumSpacing),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.safeCardTitle,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: DashboardConstants.extraBold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  AppLocalizations.of(context)!.safeCardDesc,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
