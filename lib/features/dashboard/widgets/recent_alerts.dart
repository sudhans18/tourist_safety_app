import 'package:flutter/material.dart';
import 'package:tourist_safety_app/l10n/app_localizations.dart';
import 'package:tourist_safety_app/features/dashboard/constants/dashboard_constants.dart';
import 'package:tourist_safety_app/features/dashboard/services/mock_data_service.dart';

/// Reusable recent alerts widget
class RecentAlerts extends StatelessWidget {
  const RecentAlerts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.recentAlerts,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: DashboardConstants.bold,
          ),
        ),
        const SizedBox(height: DashboardConstants.mediumSpacing),
        _AlertTile(
          icon: DashboardMockData.recentAlert['icon'] as String,
          title: DashboardMockData.recentAlert['title'] as String,
          timeAgo: DashboardMockData.recentAlert['timeAgo'] as String,
        ),
      ],
    );
  }
}

class _AlertTile extends StatelessWidget {
  final String icon;
  final String title;
  final String timeAgo;

  const _AlertTile({
    required this.icon,
    required this.title,
    required this.timeAgo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
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
      child: ListTile(
        leading: Text(
          icon,
          style: const TextStyle(fontSize: 24),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: DashboardConstants.semiBold),
        ),
        subtitle: Text(timeAgo),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {},
      ),
    );
  }
}
