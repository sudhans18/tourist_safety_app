import 'package:flutter/material.dart';
import 'package:tourist_safety_app/core/design/animated_components.dart';
import 'package:tourist_safety_app/core/design/modern_theme.dart';
import 'package:tourist_safety_app/core/widgets/app_navigation.dart';
import 'package:tourist_safety_app/l10n/app_localizations.dart';

/// Centralized typography for alerts following government app design standards.
class AlertTypography {
  static const TextStyle title = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: ModernColors.neutral900,
    fontFamily: 'Manrope',
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: 14,
    height: 1.4,
    color: ModernColors.neutral600,
    fontFamily: 'Manrope',
  );

  static const TextStyle timestamp = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: ModernColors.neutral500,
    fontFamily: 'Manrope',
  );

  static const TextStyle typeLabel = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    fontFamily: 'Manrope',
  );

  static const TextStyle appBarTitle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w800,
    color: Colors.white,
    fontFamily: 'Manrope',
  );

  static const TextStyle cardTitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: ModernColors.neutral900,
    fontFamily: 'Manrope',
  );

  static const TextStyle buttonText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    fontFamily: 'Manrope',
  );
}

/// Alert data model for type safety
class AlertData {
  final String id;
  final AlertType type;
  final String title;
  final String subtitle;
  final DateTime timestamp;
  final AlertPriority priority;
  final bool isRead;
  final bool isDismissed;
  final List<AlertAction> actions;

  const AlertData({
    required this.id,
    required this.type,
    required this.title,
    required this.subtitle,
    required this.timestamp,
    required this.priority,
    this.isRead = false,
    this.isDismissed = false,
    required this.actions,
  });
}

enum AlertType { sos, weather, geofence, fallDetection, lowBattery }
enum AlertPriority { low, medium, high, critical }

class AlertAction {
  final String label;
  final VoidCallback onTap;
  final bool isPrimary;
  final bool isEnabled;

  const AlertAction({
    required this.label,
    required this.onTap,
    this.isPrimary = false,
    this.isEnabled = true,
  });
}

class AlertConfig {
  final Color typeColor;
  final Color backgroundColor;
  final Color iconColor;
  final IconData icon;
  final String typeLabel;
  final Color? borderAccent;

  const AlertConfig({
    required this.typeColor,
    required this.backgroundColor,
    required this.iconColor,
    required this.icon,
    required this.typeLabel,
    this.borderAccent,
  });
}

/// Main AlertsScreen widget with comprehensive functionality
class AlertsScreen extends StatefulWidget {
  const AlertsScreen({super.key});

  @override
  State<AlertsScreen> createState() => _AlertsScreenState();
}

class _AlertsScreenState extends State<AlertsScreen> {
  bool _isLoading = false;
  final bool _isOffline = true;
  List<AlertData> _alerts = [];

  @override
  void initState() {
    super.initState();
    _loadAlerts();
  }

  void _loadAlerts() {
    setState(() {
      _isLoading = true;
    });

    // Simulate loading delay
    Future.delayed(const Duration(milliseconds: 800), () {
      if (mounted) {
        setState(() {
          _isLoading = false;
          _alerts = _getMockAlerts();
        });
      }
    });
  }

  List<AlertData> _getMockAlerts() {
    return [
      AlertData(
        id: '1',
        type: AlertType.sos,
        title: 'SOS Triggered',
        subtitle: 'Emergency assistance requested. Location: Central Park, New Delhi.',
        timestamp: DateTime.now().subtract(const Duration(minutes: 2)),
        priority: AlertPriority.critical,
        actions: [
          AlertAction(
            label: 'Dismiss',
            onTap: () => _dismissAlert('1'),
          ),
          AlertAction(
            label: 'View Details',
            onTap: () => _navigateToDetails('1'),
            isPrimary: true,
          ),
        ],
      ),
      AlertData(
        id: '2',
        type: AlertType.weather,
        title: 'Severe Weather Warning',
        subtitle: 'Heavy rainfall expected in your area. Stay indoors and avoid travel.',
        timestamp: DateTime.now().subtract(const Duration(minutes: 10)),
        priority: AlertPriority.high,
        actions: [
          AlertAction(
            label: 'Acknowledge',
            onTap: () => _acknowledgeAlert('2'),
          ),
          AlertAction(
            label: 'More Info',
            onTap: () => _showWeatherDetails('2'),
            isPrimary: true,
          ),
        ],
      ),
      AlertData(
        id: '3',
        type: AlertType.geofence,
        title: 'Geofence Warning',
        subtitle: 'You have entered a restricted area. Please return to the safe zone immediately.',
        timestamp: DateTime.now().subtract(const Duration(minutes: 25)),
        priority: AlertPriority.high,
        actions: [
          AlertAction(
            label: 'Dismiss',
            onTap: () => _dismissAlert('3'),
          ),
          AlertAction(
            label: 'View Map',
            onTap: () => Navigator.pushNamed(context, '/map-fullscreen'),
            isPrimary: true,
          ),
        ],
      ),
      AlertData(
        id: '4',
        type: AlertType.fallDetection,
        title: 'Fall Detected',
        subtitle: 'Sudden movement detected. Are you okay? Check your vitals for safety.',
        timestamp: DateTime.now().subtract(const Duration(minutes: 30)),
        priority: AlertPriority.medium,
        actions: [
          AlertAction(
            label: 'I\'m Fine',
            onTap: () => _dismissAlert('4'),
          ),
          AlertAction(
            label: 'Check Vitals',
            onTap: () => Navigator.pushNamed(context, '/live-vitals'),
            isPrimary: true,
          ),
        ],
      ),
      AlertData(
        id: '5',
        type: AlertType.lowBattery,
        title: 'Low Battery',
        subtitle: 'Your device battery is critically low. Please charge your device.',
        timestamp: DateTime.now().subtract(const Duration(hours: 1)),
        priority: AlertPriority.low,
        isDismissed: true,
        actions: [
          AlertAction(
            label: 'Dismissed',
            onTap: () {},
            isEnabled: false,
          ),
        ],
      ),
    ];
  }

  AlertConfig _getAlertConfig(AlertType type) {
    switch (type) {
      case AlertType.sos:
        return const AlertConfig(
          typeColor: Color(0xFFD93F34),
          backgroundColor: Color(0xFFFEEBEA),
          iconColor: Color(0xFFD93F34),
          icon: Icons.sos,
          typeLabel: 'Emergency Alert',
          borderAccent: Color(0xFFD93F34),
        );
      case AlertType.weather:
        return const AlertConfig(
          typeColor: Color(0xFF2563EB),
          backgroundColor: Color(0xFFE0EAFF),
          iconColor: Color(0xFF2563EB),
          icon: Icons.cloud,
          typeLabel: 'Government Alert',
          borderAccent: Color(0xFF2563EB),
        );
      case AlertType.geofence:
        return const AlertConfig(
          typeColor: Color(0xFFF59E0B),
          backgroundColor: Color(0xFFFFF7ED),
          iconColor: Color(0xFFF59E0B),
          icon: Icons.location_on,
          typeLabel: 'Location Alert',
        );
      case AlertType.fallDetection:
        return const AlertConfig(
          typeColor: Color(0xFF06B6D4),
          backgroundColor: Color(0xFFE0F7FA),
          iconColor: Color(0xFF06B6D4),
          icon: Icons.health_and_safety,
          typeLabel: 'Health Alert',
        );
      case AlertType.lowBattery:
        return const AlertConfig(
          typeColor: ModernColors.neutral500,
          backgroundColor: ModernColors.neutral100,
          iconColor: ModernColors.neutral500,
          icon: Icons.battery_2_bar,
          typeLabel: 'System Alert',
        );
    }
  }

  String _formatTimeAgo(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inMinutes < 1) {
      return 'Just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} min ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hour${difference.inHours > 1 ? 's' : ''} ago';
    } else {
      return '${difference.inDays} day${difference.inDays > 1 ? 's' : ''} ago';
    }
  }

  void _dismissAlert(String alertId) {
    setState(() {
      final index = _alerts.indexWhere((alert) => alert.id == alertId);
      if (index != -1) {
        _alerts[index] = AlertData(
          id: _alerts[index].id,
          type: _alerts[index].type,
          title: _alerts[index].title,
          subtitle: _alerts[index].subtitle,
          timestamp: _alerts[index].timestamp,
          priority: _alerts[index].priority,
          isRead: true,
          isDismissed: true,
          actions: _alerts[index].actions,
        );
      }
    });
    
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Alert dismissed'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _acknowledgeAlert(String alertId) {
    _dismissAlert(alertId);
  }

  void _navigateToDetails(String alertId) {
    // Navigate to alert details screen
    Navigator.pushNamed(context, '/alert-details', arguments: alertId);
  }

  void _showWeatherDetails(String alertId) {
    // Navigate to weather details
    Navigator.pushNamed(context, '/weather-details');
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: AppNavigation.buildSideDrawer(context),
      appBar: AppNavigation.buildAppBar(context, title: t.alerts),
      body: _buildBody(),
      bottomNavigationBar: AppNavigation.buildBottomNavigation(context, 2),
    );
  }

  Widget _buildBody() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/onboarding_background.jpg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Color.fromRGBO(0, 0, 0, 0.35),
            BlendMode.darken,
          ),
        ),
      ),
      child: SafeArea(
        child: _isLoading ? _buildLoadingState() : _buildAlertsList(),
      ),
    );
  }

  Widget _buildLoadingState() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
          SizedBox(height: 16),
          Text(
            'Loading alerts...',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Manrope',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAlertsList() {
    if (_alerts.isEmpty) {
      return _buildEmptyState();
    }

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      children: [
        if (_isOffline) _buildOfflineBanner(),
        if (_isOffline) const SizedBox(height: 12),
        ..._alerts.map((alert) => _buildAlertCard(alert)),
        const SizedBox(height: 80), // Extra space for bottom nav
      ],
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.notifications_off_outlined,
            size: 64,
            color: Colors.white.withValues(alpha: 0.7),
          ),
          const SizedBox(height: 16),
          Text(
            'No Alerts',
            style: AlertTypography.appBarTitle.copyWith(
              fontSize: 20,
              color: Colors.white.withValues(alpha: 0.9),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'You\'re all caught up! No new alerts to display.',
            style: AlertTypography.subtitle.copyWith(
              color: Colors.white.withValues(alpha: 0.7),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildOfflineBanner() {
    return SurfaceCard(
      color: const Color(0xFFFFF7D6),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      child: Row(
        children: [
          const Icon(Icons.wifi_off, color: Color(0xFF856404), size: 20),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              'No internet connection. Showing cached alerts.',
              style: AlertTypography.subtitle.copyWith(
                color: const Color(0xFF856404),
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAlertCard(AlertData alert) {
    final config = _getAlertConfig(alert.type);
    final timeAgo = _formatTimeAgo(alert.timestamp);
    final isDimmed = alert.isDismissed;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: isDimmed ? ModernColors.neutral100 : Colors.white,
        borderRadius: ModernBorderRadius.large,
        boxShadow: ModernShadows.medium,
        border: config.borderAccent != null
            ? Border(left: BorderSide(color: config.borderAccent!, width: 3))
            : null,
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: ModernBorderRadius.large,
        child: InkWell(
          borderRadius: ModernBorderRadius.large,
          onTap: isDimmed ? null : () => _navigateToDetails(alert.id),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: config.backgroundColor,
                      radius: 20,
                      child: Icon(
                        config.icon,
                        color: config.iconColor,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: config.typeColor.withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  config.typeLabel,
                                  style: AlertTypography.typeLabel.copyWith(
                                    color: config.typeColor,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Text(
                                timeAgo,
                                style: AlertTypography.timestamp,
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            alert.title,
                            style: AlertTypography.cardTitle.copyWith(
                              color: isDimmed
                                  ? ModernColors.neutral500
                                  : ModernColors.neutral900,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            alert.subtitle,
                            style: AlertTypography.subtitle.copyWith(
                              color: isDimmed
                                  ? ModernColors.neutral400
                                  : ModernColors.neutral600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    for (int i = 0; i < alert.actions.length; i++) ...[
                      _buildActionButton(alert.actions[i], isDimmed),
                      if (i < alert.actions.length - 1) const SizedBox(width: 10),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton(AlertAction action, bool isDimmed) {
    if (!action.isEnabled || isDimmed) {
      return Expanded(
        child: OutlinedButton(
          onPressed: null,
          style: OutlinedButton.styleFrom(
            shape: const RoundedRectangleBorder(
              borderRadius: ModernBorderRadius.medium,
            ),
            padding: const EdgeInsets.symmetric(vertical: 12),
          ),
          child: Text(
            action.label,
            style: AlertTypography.buttonText,
          ),
        ),
      );
    }

    if (action.isPrimary) {
      return Expanded(
        child: ElevatedButton(
          onPressed: action.onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: ModernColors.primaryRed,
            foregroundColor: Colors.white,
            shape: const RoundedRectangleBorder(
              borderRadius: ModernBorderRadius.medium,
            ),
            padding: const EdgeInsets.symmetric(vertical: 12),
          ),
          child: Text(
            action.label,
            style: AlertTypography.buttonText.copyWith(color: Colors.white),
          ),
        ),
      );
    }

    return Expanded(
      child: OutlinedButton(
        onPressed: action.onTap,
        style: OutlinedButton.styleFrom(
          foregroundColor: ModernColors.primaryRed,
          side: const BorderSide(color: ModernColors.primaryRed),
          shape: const RoundedRectangleBorder(
            borderRadius: ModernBorderRadius.medium,
          ),
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
        child: Text(
          action.label,
          style: AlertTypography.buttonText.copyWith(
            color: ModernColors.primaryRed,
          ),
        ),
      ),
    );
  }

}
