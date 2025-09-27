import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:tourist_safety_app/utils/theme/colors.dart';
import 'package:tourist_safety_app/features/zones/widgets/dashboard_mini_map.dart';
import 'package:provider/provider.dart';
import 'package:tourist_safety_app/core/providers/user_provider.dart';
import 'package:tourist_safety_app/features/common/widgets/state_widgets.dart';
import 'package:flutter/services.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  // Mock vitals for UI placeholder (can be replaced when vitals service is available)
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
            icon: const Icon(Icons.person_outline),
            onPressed: () => Navigator.pushNamed(context, '/profile'),
          ),
        ],
      ),
      body: SafeArea(
        child: Consumer<UserProvider>(
          builder: (context, userProvider, _) {
            // Loading state (initial)
            if (userProvider.isLoading && userProvider.userData == null) {
              return const Padding(
                padding: EdgeInsets.all(16.0),
                child: DashboardSkeleton(),
              );
            }

            // Error state (no cached data)
            if (userProvider.error != null && userProvider.userData == null) {
              return ErrorView(
                title: 'Error',
                message: userProvider.error!,
                onRetry: () => userProvider.retry(),
              );
            }

            // Empty state
            if (userProvider.userData == null) {
              return EmptyView(
                title: 'No Data',
                message: 'Unable to load user information. Please try again.',
                action: ElevatedButton(
                  onPressed: () => userProvider.refresh(),
                  child: const Text('Refresh'),
                ),
              );
            }

            // Content with pull-to-refresh; keep cached while refreshing
            return RefreshIndicator(
              onRefresh: () => userProvider.refresh(),
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildTouristCard(theme, userProvider),
                    const SizedBox(height: 16),
                    _buildSafetyScoreCard(theme),
                    const SizedBox(height: 16),
                    _buildQuickActions(theme),
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
            );
          },
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
          if (i == 1) Navigator.pushNamed(context, '/tour-plan');
          if (i == 2) Navigator.pushNamed(context, '/alerts');
          if (i == 3) Navigator.pushNamed(context, '/profile');
        },
        destinations: const [
          NavigationDestination(
              icon: Icon(Icons.dashboard_outlined),
              selectedIcon: Icon(Icons.dashboard),
              label: 'Dashboard'),
          NavigationDestination(
              icon: Icon(Icons.event_note_outlined),
              selectedIcon: Icon(Icons.event_note),
              label: 'Tour Plan'),
          NavigationDestination(
              icon: Icon(Icons.notifications_outlined),
              selectedIcon: Icon(Icons.notifications),
              label: 'Alerts'),
          NavigationDestination(
              icon: Icon(Icons.person_outline),
              selectedIcon: Icon(Icons.person),
              label: 'Profile'),
        ],
      ),
    );
  }

  Widget _buildTouristCard(ThemeData theme, UserProvider userProvider) {
    final statusColor =
        bandConnected ? const Color(0xFF22C55E) : const Color(0xFFEF4444);
    final statusText = bandConnected ? 'Connected' : 'Disconnected';
    final touristName = userProvider.userName;
    final touristId = userProvider.walletAddress;

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
            child: Text(touristName.isNotEmpty ? touristName[0] : '?',
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
                Text('You are safe',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 20)),
                SizedBox(height: 6),
                Text('All safety systems are operational and monitoring your location.',
                    style: TextStyle(color: Colors.white)),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildQuickActions(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Quick Actions',
            style: theme.textTheme.titleMedium
                ?.copyWith(fontWeight: FontWeight.w700)),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(color: Color(0x14000000), blurRadius: 12, offset: Offset(0, 4)),
            ],
          ),
          padding: const EdgeInsets.all(12),
          child: GridView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 0.95,
            ),
            children: [
              _actionTile(Icons.monitor_heart_outlined, 'Live Vitals',
                  onTap: () => Navigator.pushNamed(context, '/live-vitals')),
              _actionTile(Icons.family_restroom, 'Family Tracking',
                  onTap: () => Navigator.pushNamed(context, '/family')),
              _actionTile(Icons.park_outlined, 'Nearby Attractions',
                  onTap: () => Navigator.pushNamed(context, '/nearby-attractions')),
              _actionTile(Icons.wb_sunny_outlined, 'Weather',
                  onTap: () => Navigator.pushNamed(context, '/weather')),
            ],
          ),
        ),
      ],
    );
  }

  Widget _actionTile(IconData icon, String label, {VoidCallback? onTap}) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF9FAFB),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFE5E7EB)),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: AppColors.primaryRed, size: 22),
            const SizedBox(height: 6),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 10,
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

  Widget _buildMapSection(ThemeData theme) {
    // Mapbox mini map with zones and user puck
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Location & Risk',
            style: theme.textTheme.titleMedium
                ?.copyWith(fontWeight: FontWeight.w700)),
        const SizedBox(height: 12),
        const DashboardMiniMap(),
      ],
    );
  }

  Widget _buildRiskBanner(ThemeData theme) {
    final color = insideRestrictedZone ? AppColors.warning : AppColors.success;
    final text = insideRestrictedZone
        ? 'Restricted Zone'
        : 'Low Risk Zone';

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
              backgroundColor:
                  color.withAlpha((255 * 0.12).round()), // Fix applied here
              child: Icon(Icons.shield, color: color)),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'You are in $text',
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
          _alertTile(icon: '⚠️', title: 'Geofence Alert', timeAgo: '2 hours ago'),
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
          title: const Text('Send Emergency Alert'),
          content: const Text('Are you in danger? This will send your location and emergency signal to authorities and your emergency contacts.'),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('Cancel')),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD93F34)),
              onPressed: () async {
                // Add strong vibration for SOS button press
                await _triggerStrongVibration();
                if (context.mounted) {
                  Navigator.pop(context, true);
                }
              },
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

  Future<void> _triggerStrongVibration() async {
    try {
      // Much stronger, longer vibration pattern - like real vibration
      for (int i = 0; i < 8; i++) {
        HapticFeedback.heavyImpact();
        await Future.delayed(const Duration(milliseconds: 80));
      }

      // Extra strong final burst
      await Future.delayed(const Duration(milliseconds: 200));
      for (int i = 0; i < 3; i++) {
        HapticFeedback.heavyImpact();
        await Future.delayed(const Duration(milliseconds: 50));
      }
    } catch (e) {
      // Fallback if haptic feedback fails
      HapticFeedback.heavyImpact();
    }
  }

  void _showGeofenceSheet() async {
    // Strong vibration pattern for geofencing alerts
    await _triggerStrongVibration();

    if (!mounted) return;

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
              const Text('Geofence Alert',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
              const SizedBox(height: 8),
              const Text(
                  'You have entered a restricted area. This zone may be unsafe or require special permissions.',
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
