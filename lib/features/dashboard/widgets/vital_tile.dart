import 'package:flutter/material.dart';
import 'package:tourist_safety_app/features/dashboard/constants/dashboard_constants.dart';

/// Reusable vital sign tile widget
class VitalTile extends StatelessWidget {
  final String title;
  final String value;
  final String unit;
  final IconData icon;

  const VitalTile({
    super.key,
    required this.title,
    required this.value,
    required this.unit,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: DashboardConstants.primaryRed,
          ),
          const Spacer(),
          Text(
            title,
            style: const TextStyle(color: DashboardConstants.textSecondary),
          ),
          const SizedBox(height: 6),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontWeight: DashboardConstants.extraBold,
                  fontSize: 22,
                ),
              ),
              if (unit.isNotEmpty) ...[
                const SizedBox(width: 4),
                Text(
                  unit,
                  style: const TextStyle(color: DashboardConstants.textSecondary),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
