import 'package:flutter/material.dart';
import 'package:tourist_safety_app/core/constants/app_constants.dart';
import 'package:tourist_safety_app/core/widgets/app_widgets.dart';
import 'package:tourist_safety_app/l10n/app_localizations.dart';

/// Alert type configuration
class AlertType {
  final Color color;
  final Color backgroundColor;
  final IconData icon;

  const AlertType({
    required this.color,
    required this.backgroundColor,
    required this.icon,
  });

  static const AlertType emergency = AlertType(
    color: AppConstants.alertEmergency,
    backgroundColor: Color(0xFFFEEBEA),
    icon: Icons.sos,
  );

  static const AlertType government = AlertType(
    color: AppConstants.alertGovernment,
    backgroundColor: Color(0xFFE0EAFF),
    icon: Icons.shield,
  );

  static const AlertType medical = AlertType(
    color: AppConstants.alertMedical,
    backgroundColor: Color(0xFFE6FBFF),
    icon: Icons.local_hospital,
  );

  static const AlertType security = AlertType(
    color: AppConstants.alertSecurity,
    backgroundColor: Color(0xFFFFF7ED),
    icon: Icons.security,
  );

  static const AlertType info = AlertType(
    color: AppConstants.alertInfo,
    backgroundColor: Color(0xFFF3F4F6),
    icon: Icons.info,
  );
}

/// Alert data model
class AlertData {
  final String id;
  final String title;
  final String subtitle;
  final String time;
  final AlertType type;
  final List<AlertAction> actions;
  final bool isDimmed;

  const AlertData({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.type,
    required this.actions,
    this.isDimmed = false,
  });
}

/// Alert action model
class AlertAction {
  final String label;
  final VoidCallback onTap;
  final bool isPrimary;

  const AlertAction({
    required this.label,
    required this.onTap,
    this.isPrimary = false,
  });
}

/// Optimized alert card widget
class AlertCard extends StatelessWidget {
  final AlertData alert;
  final VoidCallback? onTap;

  const AlertCard({
    super.key,
    required this.alert,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: onTap,
      padding: AppPadding.lg,
      backgroundColor: alert.isDimmed ? AppConstants.backgroundTertiary : null,
      borderRadius: AppRadius.lg,
      shadows: AppShadows.medium,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with type badge and time
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Leading icon
              CircleAvatar(
                radius: AppConstants.avatarSizeMd,
                backgroundColor: alert.type.backgroundColor,
                child: Icon(
                  alert.type.icon,
                  color: alert.type.color,
                  size: AppConstants.iconSizeMd,
                ),
              ),
              const SizedBox(width: AppConstants.spacingMd),

              // Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Type badge and time
                    Row(
                      children: [
                        Container(
                          padding: AppPadding.horizontalSm.copyWith(
                            top: AppConstants.spacingXs,
                            bottom: AppConstants.spacingXs,
                          ),
                          decoration: BoxDecoration(
                            color: alert.type.color.withValues(alpha: 0.1),
                            borderRadius: AppRadius.sm,
                          ),
                          child: Text(
                            _getAlertTypeLabel(context, alert.type),
                            style: TextStyle(
                              color: alert.type.color,
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          alert.time,
                          style: AppTextStyles.caption,
                        ),
                      ],
                    ),
                    const SizedBox(height: AppConstants.spacingSm),

                    // Title
                    Text(
                      alert.title,
                      style: AppTextStyles.bodyLarge.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: AppConstants.spacingXs),

                    // Subtitle
                    Text(
                      alert.subtitle,
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppConstants.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: AppConstants.spacingMd),

          // Actions
          Row(
            children: alert.actions.map((action) {
              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    right: action != alert.actions.last ? AppConstants.spacingSm : 0,
                  ),
                  child: action.isPrimary
                    ? AppElevatedButton(
                        text: action.label,
                        onPressed: action.onTap,
                        backgroundColor: alert.type.color,
                      )
                    : AppOutlinedButton(
                        text: action.label,
                        onPressed: action.onTap,
                      ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  String _getAlertTypeLabel(BuildContext context, AlertType type) {
    final t = AppLocalizations.of(context)!;
    if (type == AlertType.emergency) return t.appAlert;
    if (type == AlertType.government) return t.governmentAlert;
    if (type == AlertType.medical) return 'Medical Alert'; // Fallback for missing key
    if (type == AlertType.security) return 'Security Alert'; // Fallback for missing key
    return t.appAlert;
  }
}

/// Mock alert data provider
class MockAlertProvider {
  static List<AlertData> getMockAlerts(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return [
      const AlertData(
        id: '1',
        title: 'SOS Triggered',
        subtitle: 'John activated the SOS button. Location: Central Park.',
        time: '2 min ago',
        type: AlertType.emergency,
        actions: [
          AlertAction(label: 'Dismiss', onTap: _mockAction),
          AlertAction(label: 'View Details', onTap: _mockAction, isPrimary: true),
        ],
      ),
      AlertData(
        id: '2',
        title: t.severeWeatherWarning,
        subtitle: t.severeWeatherDesc,
        time: '10 min ago',
        type: AlertType.government,
        actions: [
          const AlertAction(label: 'Acknowledge', onTap: _mockAction),
          const AlertAction(label: 'More Info', onTap: _mockAction, isPrimary: true),
        ],
      ),
      AlertData(
        id: '3',
        title: t.geoFenceWarning,
        subtitle: t.geoFenceWarningDesc,
        time: '25 min ago',
        type: AlertType.security,
        actions: [
          const AlertAction(label: 'Dismiss', onTap: _mockAction),
          const AlertAction(label: 'View Map', onTap: _mockAction, isPrimary: true),
        ],
      ),
      AlertData(
        id: '4',
        title: t.fallDetected,
        subtitle: t.fallDetectedDesc,
        time: '30 min ago',
        type: AlertType.medical,
        actions: [
          const AlertAction(label: 'Dismiss', onTap: _mockAction),
          const AlertAction(label: 'Check Vitals', onTap: _mockAction, isPrimary: true),
        ],
      ),
      AlertData(
        id: '5',
        title: t.lowBattery,
        subtitle: t.lowBatteryDesc,
        time: '1 hour ago',
        type: AlertType.info,
        actions: [
          const AlertAction(label: 'Dismissed', onTap: _mockAction),
        ],
        isDimmed: true,
      ),
    ];
  }

  static void _mockAction() {
    // Mock action implementation
  }
}
