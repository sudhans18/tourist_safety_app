import 'package:flutter/material.dart';
import 'package:tourist_safety_app/l10n/app_localizations.dart';
import 'package:tourist_safety_app/features/dashboard/constants/dashboard_constants.dart';
import 'package:tourist_safety_app/features/dashboard/services/mock_data_service.dart';

/// Reusable quick actions grid widget
class QuickActionsGrid extends StatelessWidget {
  final Function(String) onActionTap;

  const QuickActionsGrid({super.key, required this.onActionTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.quickActions,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: DashboardConstants.bold,
          ),
        ),
        const SizedBox(height: DashboardConstants.mediumSpacing),
        Container(
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
          padding: const EdgeInsets.all(DashboardConstants.mediumSpacing),
          child: GridView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: DashboardConstants.quickActionsGridColumns,
              mainAxisSpacing: DashboardConstants.smallSpacing,
              crossAxisSpacing: DashboardConstants.smallSpacing,
              childAspectRatio: DashboardConstants.quickActionsAspectRatio,
            ),
            children: DashboardMockData.quickActions.map((action) {
              return _ActionTile(
                icon: action['icon'] as IconData,
                label: action['label'] as String,
                onTap: () => onActionTap(action['route'] as String),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

class _ActionTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ActionTile({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(DashboardConstants.mediumSpacing),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: DashboardConstants.surfaceColor,
          borderRadius: BorderRadius.circular(DashboardConstants.mediumSpacing),
          border: Border.all(color: DashboardConstants.borderColor),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 4,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: DashboardConstants.primaryRed,
              size: 22,
            ),
            const SizedBox(height: 6),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: DashboardConstants.semiBold,
                fontSize: DashboardConstants.smallFontSize,
                height: 1.1,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
