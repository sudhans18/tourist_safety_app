import 'package:flutter/material.dart';
import 'package:tourist_safety_app/l10n/app_localizations.dart';

class AlertsScreen extends StatelessWidget {
  const AlertsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.alerts),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () =>
              Navigator.pushReplacementNamed(context, '/dashboard'),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Offline banner
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF7D6),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xFFF5E8A3)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.wifi_off, color: Color(0xFF856404)),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      AppLocalizations.of(context)!.noInternetCached,
                      style: const TextStyle(color: Color(0xFF856404)),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // Alerts list (mock)
            _alertCard(
              context,
              typeColor: const Color(0xFFD93F34),
              typeLabel: AppLocalizations.of(context)!.appAlert,
              title: 'SOS Triggered',
              time: '2 min ago',
              subtitle:
                  'John activated the SOS button. Location: Central Park.',
              actions: [
                _secondaryButton(AppLocalizations.of(context)!.dismiss, onTap: () {}),
                _primaryButton(AppLocalizations.of(context)!.viewDetails, onTap: () {}),
              ],
              leading: const CircleAvatar(
                backgroundColor: Color(0xFFFEEBEA),
                child: Icon(Icons.sos, color: Color(0xFFD93F34)),
              ),
            ),
            _alertCard(
              context,
              typeColor: const Color(0xFF2563EB),
              typeLabel: AppLocalizations.of(context)!.governmentAlert,
              title: AppLocalizations.of(context)!.severeWeatherWarning,
              time: '10 min ago',
              subtitle: AppLocalizations.of(context)!.severeWeatherDesc,
              actions: [
                _secondaryButton(AppLocalizations.of(context)!.acknowledge, onTap: () {}),
                _primaryButton(AppLocalizations.of(context)!.moreInfo, onTap: () {}),
              ],
              borderAccent: const Color(0xFF2563EB),
              leading: const CircleAvatar(
                backgroundColor: Color(0xFFE0EAFF),
                child: Icon(Icons.shield, color: Color(0xFF2563EB)),
              ),
            ),
            _alertCard(
              context,
              typeColor: const Color(0xFFF59E0B),
              typeLabel: AppLocalizations.of(context)!.appAlert,
              title: AppLocalizations.of(context)!.geoFenceWarning,
              time: '25 min ago',
              subtitle: AppLocalizations.of(context)!.geoFenceWarningDesc,
              actions: [
                _secondaryButton(AppLocalizations.of(context)!.dismiss, onTap: () {}),
                _primaryButton(AppLocalizations.of(context)!.viewMap, onTap: () => Navigator.pushNamed(context, '/map-fullscreen')),
              ],
              leading: const CircleAvatar(
                backgroundColor: Color(0xFFFFF7ED),
                child: Icon(Icons.route, color: Color(0xFFF59E0B)),
              ),
            ),
            _alertCard(
              context,
              typeColor: const Color(0xFF06B6D4),
              typeLabel: AppLocalizations.of(context)!.appAlert,
              title: AppLocalizations.of(context)!.fallDetected,
              time: '30 min ago',
              subtitle: AppLocalizations.of(context)!.fallDetectedDesc,
              actions: [
                _secondaryButton(AppLocalizations.of(context)!.dismiss, onTap: () {}),
                _primaryButton(AppLocalizations.of(context)!.checkVitals, onTap: () => Navigator.pushNamed(context, '/live-vitals')),
              ],
              leading: const CircleAvatar(
                backgroundColor: Color(0xFFE6FBFF),
                child: Icon(Icons.downhill_skiing, color: Color(0xFF06B6D4)),
              ),
            ),
            _alertCard(
              context,
              typeColor: const Color(0xFF6B7280),
              typeLabel: AppLocalizations.of(context)!.appAlert,
              title: AppLocalizations.of(context)!.lowBattery,
              time: '1 hour ago',
              subtitle: AppLocalizations.of(context)!.lowBatteryDesc,
              actions: [
                _disabledButton(AppLocalizations.of(context)!.dismissed),
              ],
              isDimmed: true,
              leading: const CircleAvatar(
                backgroundColor: Color(0xFFF3F4F6),
                child: Icon(Icons.battery_2_bar, color: Color(0xFF6B7280)),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: 2,
        onDestinationSelected: (i) {
          if (i == 0) Navigator.pushReplacementNamed(context, '/dashboard');
          if (i == 1) Navigator.pushReplacementNamed(context, '/tour-plan');
          if (i == 2) return; // Alerts
          if (i == 3) Navigator.pushReplacementNamed(context, '/profile');
        },
        destinations: [
          NavigationDestination(icon: const Icon(Icons.dashboard_outlined), label: AppLocalizations.of(context)!.dashboard),
          NavigationDestination(icon: const Icon(Icons.event_note_outlined), label: AppLocalizations.of(context)!.tourPlan),
          NavigationDestination(icon: const Icon(Icons.notifications), label: AppLocalizations.of(context)!.alerts),
          NavigationDestination(icon: const Icon(Icons.person_outline), label: AppLocalizations.of(context)!.profile),
        ],
      ),
    );
  }

  static Widget _alertCard(
    BuildContext context, {
    required Color typeColor,
    required String typeLabel,
    required String title,
    required String time,
    required String subtitle,
    required List<Widget> actions,
    Widget? leading,
    Color? borderAccent,
    bool isDimmed = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: isDimmed ? const Color(0xFFF9FAFB) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
              color: Color(0x14000000), blurRadius: 12, offset: Offset(0, 4)),
        ],
        border: borderAccent != null
            ? Border(left: BorderSide(color: borderAccent, width: 3))
            : null,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                leading ?? const SizedBox.shrink(),
                if (leading != null) const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: typeColor.withAlpha(26),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              typeLabel,
                              style: TextStyle(
                                  color: typeColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12),
                            ),
                          ),
                          const Spacer(),
                          Text(time,
                              style: const TextStyle(color: Color(0xFF6B7280))),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(title,
                          style: const TextStyle(
                              fontWeight: FontWeight.w800, fontSize: 16)),
                      const SizedBox(height: 6),
                      Text(subtitle,
                          style: const TextStyle(color: Color(0xFF6B7280))),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                for (final a in actions) ...[
                  a,
                  const SizedBox(width: 10),
                ]
              ],
            ),
          ],
        ),
      ),
    );
  }

  static Widget _primaryButton(String label, {required VoidCallback onTap}) {
    return Expanded(
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFD93F34),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
        child: Text(label),
      ),
    );
  }

  static Widget _secondaryButton(String label, {required VoidCallback onTap}) {
    return Expanded(
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
        child: Text(label),
      ),
    );
  }

  static Widget _disabledButton(String label) {
    return Expanded(
      child: OutlinedButton(
        onPressed: null,
        style: OutlinedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
        child: Text(label),
      ),
    );
  }
}
