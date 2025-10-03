import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:tourist_safety_app/features/zones/widgets/dashboard_mini_map.dart';
import 'package:tourist_safety_app/features/common/screens/placeholder_screen.dart';
import 'package:provider/provider.dart';
import 'package:tourist_safety_app/core/providers/user_provider.dart';
import 'package:tourist_safety_app/features/common/widgets/state_widgets.dart';
import 'package:flutter/services.dart';
import 'package:tourist_safety_app/core/design/animated_components.dart';
import 'package:tourist_safety_app/core/design/modern_theme.dart';
import 'package:tourist_safety_app/l10n/app_localizations.dart';

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
    final t = AppLocalizations.of(context)!;

    // Show geofence sheet once if inside restricted zone
    if (insideRestrictedZone && !_shownGeofenceSheet) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _shownGeofenceSheet = true;
        _showGeofenceSheet();
      });
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: _buildSideNavDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: Builder(
          builder: (context) => GestureDetector(
            onTap: () => Scaffold.of(context).openDrawer(),
            child: Container(
              margin: const EdgeInsets.only(left: 16),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
              ),
              child: const Icon(Icons.menu, color: Colors.white),
            ),
          ),
        ),
        title: Text(
          t.appTitle,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/profile'),
            child: Container(
              margin: const EdgeInsets.only(right: 16),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
              ),
              child: const Icon(Icons.person_outline, color: Colors.white),
            ),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/images/onboarding_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withValues(alpha: 0.35),
              BlendMode.darken,
            ),
          ),
        ),
        child: SafeArea(
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
                  title: t.error,
                  message: userProvider.error!,
                  onRetry: () => userProvider.retry(),
                );
              }

              // Empty state
              if (userProvider.userData == null) {
                return EmptyView(
                  title: t.noData,
                  message: t.noDataDesc,
                  action: ElevatedButton(
                    onPressed: () => userProvider.refresh(),
                    child: Text(t.refresh),
                  ),
                );
              }

              // Content with pull-to-refresh; keep cached while refreshing
              return RefreshIndicator(
                onRefresh: () => userProvider.refresh(),
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      _buildHeroSection(userProvider),
                      _buildMainContent(theme, userProvider),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: AnimatedFAB(
        onPressed: _confirmSOS,
        icon: Icons.warning_amber_rounded,
        backgroundColor: const Color(0xFFFF4757),
        heroTag: 'sos_fab',
      ),
      bottomNavigationBar: _buildModernBottomNav(),
    );
  }

  Widget _buildHeroSection(UserProvider userProvider) {
    final t = AppLocalizations.of(context)!;
    final touristName = userProvider.userName;
    final touristId = userProvider.walletAddress;
    final statusColor = bandConnected ? ModernColors.success : ModernColors.error;
    final statusText = bandConnected ? t.connected : t.disconnected;

    return Container(
      padding: const EdgeInsets.fromLTRB(24, 40, 24, 32),
      child: Column(
        children: [
          // Profile section (neutral surface)
          SurfaceCard(
            borderRadius: 16,
            child: Row(
              children: [
                // Animated avatar
                TweenAnimationBuilder<double>(
                  duration: const Duration(milliseconds: 800),
                  tween: Tween(begin: 0.0, end: 1.0),
                  builder: (context, value, child) {
                    return Transform.scale(
                      scale: value,
                      child: Container(
                        width: 64,
                        height: 64,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ModernColors.primaryRed,
                          border: Border.all(
                            color: ModernColors.primaryRedLight,
                            width: 2,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            touristName.isNotEmpty ? touristName[0].toUpperCase() : '?',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        touristName,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: ModernColors.neutral900,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${t.idLabel}: $touristId',
                        style: const TextStyle(
                          fontSize: 14,
                          color: ModernColors.neutral600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: statusColor.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: statusColor.withValues(alpha: 0.4),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: statusColor,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              '${t.band}: $statusText',
                              style: TextStyle(
                                color: statusColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // QR Code with glassmorphism
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.9),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: QrImageView(
                    data: touristId,
                    version: QrVersions.auto,
                    size: 60,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          // Safety status summary
          SurfaceCard(
            child: Row(
              children: [
                Icon(
                  bandConnected ? Icons.verified_user : Icons.warning_amber_rounded,
                  color: statusColor,
                  size: 28,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        bandConnected ? t.safeCardTitle : t.safetyDashboard,
                        style: const TextStyle(
                          color: ModernColors.neutral900,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        bandConnected
                            ? t.safeCardDesc
                            : AppLocalizations.of(context)!.checkVitals,
                        style: const TextStyle(
                          color: ModernColors.neutral600,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainContent(ThemeData theme, UserProvider userProvider) {
    final t = AppLocalizations.of(context)!;
    return Container(
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Quick Actions with staggered animation
            Text(
              t.quickActions,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            _buildModernQuickActions(),
            const SizedBox(height: 32),
            
            // Live Vitals
            _buildLiveVitals(),
            const SizedBox(height: 32),
            
            // Location & Risk
            Text(
              t.locationAndRisk,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            _buildLocationSection(),
            const SizedBox(height: 32),
            
            // Recent Activity
            Text(
              t.recentAlerts,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            _buildRecentActivity(),
            const SizedBox(height: 100), // Space for bottom nav
          ],
        ),
      ),
    );
  }

  Widget _buildModernBottomNav() {
    final t = AppLocalizations.of(context)!;
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        boxShadow: ModernShadows.large,
      ),
      child: NavigationBar(
        selectedIndex: _currentTab,
        backgroundColor: Colors.transparent,
        elevation: 0,
        onDestinationSelected: (i) {
          setState(() => _currentTab = i);
          if (i == 0) return; // Dashboard
          if (i == 1) Navigator.pushNamed(context, '/map-fullscreen');
          if (i == 2) Navigator.pushNamed(context, '/alerts');
          if (i == 3) Navigator.pushNamed(context, '/tour-plan');
          if (i == 4) Navigator.pushNamed(context, '/profile');
        },
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.dashboard_outlined),
            selectedIcon: const Icon(Icons.dashboard),
            label: t.dashboard,
          ),
          const NavigationDestination(
            icon: Icon(Icons.map_outlined),
            selectedIcon: Icon(Icons.map, color: ModernColors.primaryRed),
            label: 'Map',
          ),
          NavigationDestination(
            icon: Stack(
              children: [
                const Icon(Icons.notifications_outlined),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 12,
                      minHeight: 12,
                    ),
                    child: const Text(
                      '!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            selectedIcon: Stack(
              children: [
                const Icon(Icons.notifications),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 12,
                      minHeight: 12,
                    ),
                    child: const Text(
                      '!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            label: t.alerts,
          ),
          NavigationDestination(
            icon: const Icon(Icons.event_note_outlined),
            selectedIcon: const Icon(Icons.event_note),
            label: t.tourPlan,
          ),
          NavigationDestination(
            icon: const Icon(Icons.person_outline),
            selectedIcon: const Icon(Icons.person),
            label: t.profile,
          ),
        ],
      ),
    );
  }

  Widget _buildSideNavDrawer() {
    final t = AppLocalizations.of(context)!;
    final userProvider = Provider.of<UserProvider>(context);
    
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          // Header with user info
          Container(
            height: 180,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage('assets/images/onboarding_background.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withValues(alpha: 0.4),
                  BlendMode.darken,
                ),
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Avatar and user info
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 56,
                            height: 56,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ModernColors.primaryRed,
                              border: Border.all(
                                color: Colors.white,
                                width: 2,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                userProvider.userName.isNotEmpty 
                                  ? userProvider.userName[0].toUpperCase() 
                                  : '?',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            userProvider.userName,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 2),
                          Text(
                            t.idLabel,
                            style: const TextStyle(
                              fontSize: 10,
                              color: Colors.white70,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                            margin: const EdgeInsets.only(top: 2),
                            decoration: BoxDecoration(
                              color: Colors.black.withValues(alpha: 0.3),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              userProvider.walletAddress.length > 16
                                  ? '${userProvider.walletAddress.substring(0, 8)}...${userProvider.walletAddress.substring(userProvider.walletAddress.length - 8)}'
                                  : userProvider.walletAddress,
                              style: const TextStyle(
                                fontSize: 9,
                                color: Colors.white,
                                fontFamily: 'monospace',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    // QR Code
                    Container(
                      width: 70,
                      height: 70,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.1),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: QrImageView(
                        data: userProvider.walletAddress,
                        version: QrVersions.auto,
                        size: 54,
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          
          // Navigation items
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 8),
              children: [
                _buildDrawerItem(
                  icon: Icons.dashboard_outlined,
                  title: t.dashboard,
                  onTap: () => Navigator.pop(context),
                ),
                _buildDrawerItem(
                  icon: Icons.family_restroom,
                  title: t.family,
                  subtitle: t.familyTracking,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/family');
                  },
                ),
                _buildDrawerItem(
                  icon: Icons.park_outlined,
                  title: t.nearbyAttractions,
                  subtitle: 'Discover local spots',
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/nearby-attractions');
                  },
                ),
                _buildDrawerItem(
                  icon: Icons.wb_sunny_outlined,
                  title: t.weather,
                  subtitle: t.currentWeather,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/weather');
                  },
                ),
                _buildDrawerItem(
                  icon: Icons.monitor_heart_outlined,
                  title: t.liveVitals,
                  subtitle: t.checkVitals,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/live-vitals');
                  },
                ),
                _buildDrawerItem(
                  icon: Icons.warning_amber_rounded,
                  title: 'Emergency SOS',
                  subtitle: 'Quick emergency access',
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/sos');
                  },
                ),
                const Divider(height: 32),
                _buildDrawerItem(
                  icon: Icons.hotel,
                  title: 'Hotel Bookings',
                  subtitle: 'Find & book hotels',
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const PlaceholderScreen(title: 'Hotel Bookings')));
                  },
                ),
                _buildDrawerItem(
                  icon: Icons.restaurant,
                  title: 'Local Cuisine',
                  subtitle: 'Discover local food',
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const PlaceholderScreen(title: 'Local Cuisine')));
                  },
                ),
                _buildDrawerItem(
                  icon: Icons.directions_bus,
                  title: 'Transportation',
                  subtitle: 'Public transport info',
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const PlaceholderScreen(title: 'Transportation')));
                  },
                ),
                _buildDrawerItem(
                  icon: Icons.language,
                  title: 'Language Guide',
                  subtitle: 'Local language help',
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const PlaceholderScreen(title: 'Language Guide')));
                  },
                ),
                _buildDrawerItem(
                  icon: Icons.local_hospital,
                  title: 'Medical Help',
                  subtitle: 'Nearby hospitals & clinics',
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const PlaceholderScreen(title: 'Medical Help')));
                  },
                ),
                const Divider(height: 32),
                _buildDrawerItem(
                  icon: Icons.settings,
                  title: 'Settings',
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/profile');
                  },
                ),
                _buildDrawerItem(
                  icon: Icons.help_outline,
                  title: 'Help & Support',
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const PlaceholderScreen(title: 'Help & Support')));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    String? subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: ModernColors.neutral100,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: ModernColors.primaryRed, size: 20),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: ModernColors.neutral900,
        ),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle,
              style: const TextStyle(
                fontSize: 12,
                color: ModernColors.neutral600,
              ),
            )
          : null,
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
    );
  }

  Widget _buildModernQuickActions() {
    final t = AppLocalizations.of(context)!;
    final actions = [
      _ModernActionTile(
        icon: Icons.monitor_heart_outlined,
        title: t.liveVitals,
        subtitle: t.checkVitals,
        gradient: ModernColors.primaryGradient,
        onTap: () => Navigator.pushNamed(context, '/live-vitals'),
      ),
      _ModernActionTile(
        icon: Icons.family_restroom,
        title: t.family,
        subtitle: t.familyTracking,
        gradient: ModernColors.infoGradient,
        onTap: () => Navigator.pushNamed(context, '/family'),
      ),
      _ModernActionTile(
        icon: Icons.park_outlined,
        title: t.nearbyAttractions,
        subtitle: t.nearbyAttractions,
        gradient: ModernColors.successGradient,
        onTap: () => Navigator.pushNamed(context, '/nearby-attractions'),
      ),
      _ModernActionTile(
        icon: Icons.wb_sunny_outlined,
        title: t.weather,
        subtitle: AppLocalizations.of(context)!.currentWeather,
        gradient: ModernColors.warningGradient,
        onTap: () => Navigator.pushNamed(context, '/weather'),
      ),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 1.1,
      ),
      itemCount: actions.length,
      itemBuilder: (context, index) {
        return TweenAnimationBuilder<double>(
          duration: Duration(milliseconds: 300 + (index * 100)),
          tween: Tween(begin: 0.0, end: 1.0),
          builder: (context, value, child) {
            return Transform.translate(
              offset: Offset(0, 20 * (1 - value)),
              child: Opacity(
                opacity: value,
                child: actions[index],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildLiveVitals() {
    return SurfaceCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: ModernColors.neutral100,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: ModernColors.neutral200),
                ),
                child: const Icon(Icons.favorite, color: ModernColors.primaryRed, size: 24),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.liveVitals,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: ModernColors.neutral900,
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.checkVitals,
                      style: const TextStyle(
                        fontSize: 14,
                        color: ModernColors.neutral600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: _VitalCard(
                  title: AppLocalizations.of(context)!.heartRate,
                  value: heartRate.toString(),
                  unit: 'BPM',
                  color: ModernColors.primaryRed,
                  icon: Icons.favorite,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _VitalCard(
                  title: AppLocalizations.of(context)!.spo2,
                  value: spo2.toString(),
                  unit: '%',
                  color: ModernColors.info,
                  icon: Icons.air,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _VitalCard(
                  title: AppLocalizations.of(context)!.temperature,
                  value: tempF.toStringAsFixed(1),
                  unit: '°F',
                  color: ModernColors.warning,
                  icon: Icons.thermostat,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLocationSection() {
    final t = AppLocalizations.of(context)!;
    return Column(
      children: [
        const SurfaceCard(
          height: 200,
          child: DashboardMiniMap(),
        ),
        const SizedBox(height: 16),
        SurfaceCard(
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: insideRestrictedZone 
                    ? ModernColors.warning.withValues(alpha: 0.2)
                    : ModernColors.success.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.shield,
                  color: insideRestrictedZone ? ModernColors.warning : ModernColors.success,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      insideRestrictedZone ? t.restrictedZone : t.lowRiskZone,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: ModernColors.neutral900,
                      ),
                    ),
                    Text(
                      t.youAreInZone(insideRestrictedZone ? t.restrictedZone : t.lowRiskZone),
                      style: const TextStyle(
                        fontSize: 14,
                        color: ModernColors.neutral600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRecentActivity() {
    final t = AppLocalizations.of(context)!;
    final activities = [
      {
        'icon': Icons.warning_amber_rounded,
        'title': t.geofenceAlertShort,
        'subtitle': t.geoFenceAlertDesc,
        'time': t.hoursAgo(2),
        'color': ModernColors.warning,
      },
      {
        'icon': Icons.verified,
        'title': t.appAlert,
        'subtitle': t.bandConnected,
        'time': t.hoursAgo(4),
        'color': ModernColors.success,
      },
      {
        'icon': Icons.share_location,
        'title': t.shareLocation,
        'subtitle': t.shareLocationDesc,
        'time': t.hoursAgo(6),
        'color': ModernColors.info,
      },
    ];
    return Column(
      children: activities.map((activity) {
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          child: SurfaceCard(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: ModernColors.neutral100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Icon(
                      activity['icon'] as IconData,
                      color: activity['color'] as Color,
                      size: 20,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        activity['title'] as String,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: ModernColors.neutral900,
                        ),
                      ),
                      Text(
                        activity['subtitle'] as String,
                        style: const TextStyle(
                          fontSize: 14,
                          color: ModernColors.neutral600,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  activity['time'] as String,
                  style: const TextStyle(
                    fontSize: 12,
                    color: ModernColors.neutral500,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  
  

  void _confirmSOS() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Text(AppLocalizations.of(context)!.sendEmergencyAlert),
          content: Text(AppLocalizations.of(context)!.sosDialogBody),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: Text(AppLocalizations.of(context)!.cancel)),
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
              child: Text(AppLocalizations.of(context)!.sendSOS),
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
        final t = AppLocalizations.of(context)!;
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
              Text(
                t.geofenceAlertShort,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
              const SizedBox(height: 8),
              Text(
                t.geoFenceAlertDesc,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Color(0xFF6B7280))),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD93F34),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                onPressed: () => Navigator.pop(context),
                child: Text(t.returnToSafety),
              ),
              const SizedBox(height: 10),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                onPressed: () => Navigator.pop(context),
                child: Text(t.proceedWithCaution),
              ),
            ],
          ),
        );
      },
    );
  }

}

// Modern Action Tile Widget
class _ModernActionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final List<Color> gradient;
  final VoidCallback onTap;

  const _ModernActionTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.gradient,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SurfaceCard(
      onTap: onTap,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: ModernColors.neutral100,
              border: Border.all(color: ModernColors.neutral200),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: ModernColors.primaryRed, size: 24),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: ModernColors.neutral900,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 12,
              color: ModernColors.neutral600,
            ),
          ),
        ],
      ),
    );
  }
}

// Vital Card Widget
class _VitalCard extends StatelessWidget {
  final String title;
  final String value;
  final String unit;
  final Color color;
  final IconData icon;

  const _VitalCard({
    required this.title,
    required this.value,
    required this.unit,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.2)),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(height: 8),
          AnimatedCounter(
            value: int.tryParse(value.split('.')[0]) ?? 0,
            textStyle: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: color,
            ),
            suffix: value.contains('.') ? '.${value.split('.')[1]}' : '',
          ),
          Text(
            unit,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: const TextStyle(
              fontSize: 10,
              color: ModernColors.neutral600,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
