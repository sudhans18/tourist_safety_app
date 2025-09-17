import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:tourist_safety_app/utils/theme/colors.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  // Mock data
  final String touristName = 'Ethan Carter';
  final String touristId = '1234567890';
  final bool bandConnected = true;
  final int heartRate = 72;
  final int spo2 = 98;
  final double tempF = 98.6;
  final String activity = 'Normal';
  final bool insideRestrictedZone = true; // toggle banner
  bool _shownGeofenceSheet = false;

  int _currentTab = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Show geofence sheet once if inside restricted zone
    if (insideRestrictedZone && !_shownGeofenceSheet) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _shownGeofenceSheet = true;
        _showGeofenceSheet();
      });
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Safety Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildTouristCard(theme),
              const SizedBox(height: 16),
              _buildSafetyScoreCard(theme),
              const SizedBox(height: 16),
              _buildVitalsSection(theme),
              const SizedBox(height: 16),
              _buildMapSection(theme),
              const SizedBox(height: 12),
              _buildRiskBanner(theme),
              const SizedBox(height: 16),
              _buildRecentAlerts(theme),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryRed,
        onPressed: _confirmSOS,
        child: const Icon(Icons.warning_amber_rounded, color: Colors.white),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentTab,
        onDestinationSelected: (i) {
          setState(() => _currentTab = i);
          if (i == 0) return; // Dashboard
          if (i == 1) Navigator.pushNamed(context, '/alerts');
          if (i == 2) Navigator.pushNamed(context, '/family');
          if (i == 3) Navigator.pushNamed(context, '/settings');
        },
        destinations: const [
          NavigationDestination(
              icon: Icon(Icons.dashboard_outlined),
              selectedIcon: Icon(Icons.dashboard),
              label: 'Dashboard'),
          NavigationDestination(
              icon: Icon(Icons.notifications_outlined),
              selectedIcon: Icon(Icons.notifications),
              label: 'Alerts'),
          NavigationDestination(
              icon: Icon(Icons.family_restroom_outlined),
              selectedIcon: Icon(Icons.family_restroom),
              label: 'Family'),
          NavigationDestination(
              icon: Icon(Icons.shield_outlined),
              selectedIcon: Icon(Icons.shield),
              label: 'Safety'),
        ],
      ),
    );
  }

  Widget _buildTouristCard(ThemeData theme) {
    final statusColor =
        bandConnected ? const Color(0xFF22C55E) : const Color(0xFFEF4444);
    final statusText = bandConnected ? 'Connected' : 'Disconnected';

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
              color: Color(0x14000000), blurRadius: 12, offset: Offset(0, 4))
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: AppColors.redLight,
            child: Text(touristName[0],
                style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryRed,
                    fontSize: 24)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(touristName,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w700)),
                const SizedBox(height: 4),
                Text('ID: $touristId',
                    style: const TextStyle(color: Color(0xFF6B7280))),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                            color: statusColor, shape: BoxShape.circle)),
                    const SizedBox(width: 6),
                    Text('Band: $statusText',
                        style: TextStyle(
                            color: statusColor, fontWeight: FontWeight.w600)),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFF9FAFB),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(6),
            child: QrImageView(
              data: touristId,
              version: QrVersions.auto,
              size: 72,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSafetyScoreCard(ThemeData theme) {
    // Green aesthetic from tokens
    return Container(
      decoration: BoxDecoration(
        color: AppColors.success,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
              color: Color(0x3322C55E), blurRadius: 18, offset: Offset(0, 10))
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.verified_user, color: Colors.white, size: 28),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Safe',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 20)),
                SizedBox(height: 6),
                Text('Your current safety score is excellent. Keep it up!',
                    style: TextStyle(color: Colors.white)),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _metricCard(
      {required IconData icon, required String value, String? label}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
              color: Color(0x14000000), blurRadius: 12, offset: Offset(0, 4))
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, color: AppColors.primaryRed, size: 24),
          const SizedBox(height: 8),
          Text(value,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
          if (label != null) ...[
            const SizedBox(height: 2),
            Text(label,
                style: const TextStyle(color: Color(0xFF6B7280), fontSize: 12)),
          ],
        ],
      ),
    );
  }

  Widget _buildVitalsSection(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Live Vitals',
            style: theme.textTheme.titleMedium
                ?.copyWith(fontWeight: FontWeight.w700)),
        const SizedBox(height: 12),
        GridView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 1,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
          ),
          children: [
            _metricCard(icon: Icons.favorite_border, value: '$heartRate bpm'),
            _metricCard(icon: Icons.water_drop_outlined, value: '$spo2%'),
            _metricCard(
                icon: Icons.device_thermostat,
                value: '${tempF.toStringAsFixed(1)}°F'),
            _metricCard(icon: Icons.directions_walk, value: activity),
          ],
        ),
      ],
    );
  }

  Widget _buildMapSection(ThemeData theme) {
    // Mapbox map centered at Guwahati with a center marker
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Location & Risk Zone',
            style: theme.textTheme.titleMedium
                ?.copyWith(fontWeight: FontWeight.w700)),
        const SizedBox(height: 12),
        Container(
          height: 220,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                  color: Color(0x14000000),
                  blurRadius: 12,
                  offset: Offset(0, 4))
            ],
          ),
          clipBehavior: Clip.antiAlias,
          child: Stack(
            children: [
              MapWidget(
                // Access token is provided via AndroidManifest meta-data (MAPBOX_ACCESS_TOKEN)
                styleUri: MapboxStyles.MAPBOX_STREETS,
                cameraOptions: CameraOptions(
                  center: Point(
                      coordinates: Position(92.9376, 26.2006)), // lng, lat
                  zoom: 13.0,
                ),
                onMapCreated: (mapboxMap) {},
              ),
              const Center(
                child: Icon(Icons.location_pin,
                    color: AppColors.primaryRed, size: 36),
              ),
              Positioned(
                bottom: 8,
                right: 8,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text('Guwahati • 26.2006, 92.9376',
                      style: TextStyle(fontSize: 12)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRiskBanner(ThemeData theme) {
    final color = insideRestrictedZone ? AppColors.warning : AppColors.success;
    final text = insideRestrictedZone ? 'Restricted Zone' : 'Low-Risk Zone';

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
              color: Color(0x14000000), blurRadius: 12, offset: Offset(0, 4))
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          CircleAvatar(
              radius: 18,
              backgroundColor: color.withOpacity(0.12),
              child: Icon(Icons.shield, color: color)),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'You are in a $text. Stay aware of your surroundings.',
              style: const TextStyle(color: Color(0xFF111827)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentAlerts(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Recent Alerts',
            style: theme.textTheme.titleMedium
                ?.copyWith(fontWeight: FontWeight.w700)),
        const SizedBox(height: 12),
        ...[
          _alertTile(icon: '⚠️', title: 'Geofence Alert', timeAgo: '2h ago'),
        ],
      ],
    );
  }

  Widget _alertTile(
      {required String icon, required String title, required String timeAgo}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
              color: Color(0x14000000), blurRadius: 12, offset: Offset(0, 4))
        ],
      ),
      child: ListTile(
        leading: Text(icon, style: const TextStyle(fontSize: 24)),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(timeAgo),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {},
      ),
    );
  }

  void _confirmSOS() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: const Text('Send Emergency Alert?'),
          content: const Text(
              'This will notify authorities and your emergency contacts.'),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('Cancel')),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD93F34)),
              onPressed: () => Navigator.pop(context, true),
              child: const Text('Send SOS'),
            ),
          ],
        );
      },
    );

    if (confirmed == true && mounted) {
      Navigator.pushNamed(context, '/sos');
    }
  }

  void _showGeofenceSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: false,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: 40,
                      height: 5,
                      decoration: BoxDecoration(
                          color: const Color(0xFFE5E7EB),
                          borderRadius: BorderRadius.circular(3))),
                ],
              ),
              const SizedBox(height: 16),
              const CircleAvatar(
                  radius: 28,
                  backgroundColor: Color(0xFFFEEBEA),
                  child: Icon(Icons.warning_amber_rounded,
                      color: Color(0xFFD93F34), size: 28)),
              const SizedBox(height: 12),
              const Text('Geo-fence Alert',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
              const SizedBox(height: 8),
              const Text(
                  'You are approaching a restricted area. Please turn back or proceed with caution.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xFF6B7280))),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD93F34),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                onPressed: () => Navigator.pop(context),
                child: const Text('Return to Safety'),
              ),
              const SizedBox(height: 10),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                onPressed: () => Navigator.pop(context),
                child: const Text('Proceed with Caution'),
              ),
            ],
          ),
        );
      },
    );
  }
}
