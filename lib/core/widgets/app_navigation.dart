import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourist_safety_app/core/providers/user_provider.dart';
import 'package:tourist_safety_app/core/design/modern_theme.dart';
import 'package:tourist_safety_app/l10n/app_localizations.dart';

class AppNavigation {
  static Widget buildBottomNavigation(BuildContext context, int currentIndex) {
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
        selectedIndex: currentIndex,
        backgroundColor: Colors.transparent,
        elevation: 0,
        onDestinationSelected: (i) {
          _handleNavigation(context, i, currentIndex);
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

  static Widget buildSideDrawer(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final userProvider = Provider.of<UserProvider>(context);
    
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          // Header with user info
          Container(
            height: 132,
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
                padding: const EdgeInsets.all(12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Avatar
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: 60,
                          height: 60,
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
                                fontSize: 24,
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        if (userProvider.isUserVerified)
                          Positioned(
                            bottom: -2,
                            right: -2,
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: ModernColors.success,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 1.5,
                                ),
                              ),
                              child: const Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 12,
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(width: 8),
                    // Name and ID beside profile pic
                    Flexible(
                      fit: FlexFit.loose,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            userProvider.userName,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                '${t.idLabel}:',
                                style: const TextStyle(
                                  fontSize: 9,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white70,
                                ),
                              ),
                              const SizedBox(width: 4),
                              Flexible(
                                fit: FlexFit.loose,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withValues(alpha: 0.3),
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                  child: Text(
                                    userProvider.walletAddress.length > 16
                                        ? '${userProvider.walletAddress.substring(0, 8)}...${userProvider.walletAddress.substring(userProvider.walletAddress.length - 8)}'
                                        : userProvider.walletAddress,
                                    style: const TextStyle(
                                      fontSize: 8,
                                      fontFamily: 'monospace',
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
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
              padding: const EdgeInsets.symmetric(vertical: 2),
              children: [
                _buildDrawerItem(
                  context,
                  icon: Icons.dashboard_outlined,
                  title: t.dashboard,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushReplacementNamed(context, '/dashboard');
                  },
                ),
                _buildDrawerItem(
                  context,
                  icon: Icons.family_restroom,
                  title: t.family,
                  subtitle: t.familyTracking,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/family');
                  },
                ),
                _buildDrawerItem(
                  context,
                  icon: Icons.park_outlined,
                  title: t.nearbyAttractions,
                  subtitle: 'Discover local spots',
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/nearby-attractions');
                  },
                ),
                _buildDrawerItem(
                  context,
                  icon: Icons.wb_sunny_outlined,
                  title: t.weather,
                  subtitle: t.currentWeather,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/weather');
                  },
                ),
                _buildDrawerItem(
                  context,
                  icon: Icons.monitor_heart_outlined,
                  title: t.liveVitals,
                  subtitle: t.checkVitals,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/live-vitals');
                  },
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.red.shade600, Colors.red.shade700],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.red.withValues(alpha: 0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.warning_amber_rounded,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                    title: const Text(
                      'Emergency SOS',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    subtitle: const Text(
                      'Quick emergency access',
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.white70,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/sos');
                    },
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                    dense: true,
                    visualDensity: VisualDensity.compact,
                  ),
                ),
                const Divider(height: 8),
                _buildDrawerItem(
                  context,
                  icon: Icons.hotel,
                  title: 'Hotel Bookings',
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/hotel-bookings');
                  },
                ),
                _buildDrawerItem(
                  context,
                  icon: Icons.restaurant,
                  title: 'Local Cuisine',
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/local-cuisine');
                  },
                ),
                _buildDrawerItem(
                  context,
                  icon: Icons.directions_bus,
                  title: 'Transportation',
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/transportation');
                  },
                ),
                _buildDrawerItem(
                  context,
                  icon: Icons.language,
                  title: 'Language Guide',
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/language-guide');
                  },
                ),
                _buildDrawerItem(
                  context,
                  icon: Icons.local_hospital,
                  title: 'Medical Help',
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/medical-help');
                  },
                ),
                const Divider(height: 8),
                _buildDrawerItem(
                  context,
                  icon: Icons.settings,
                  title: 'Settings',
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/settings');
                  },
                ),
                _buildDrawerItem(
                  context,
                  icon: Icons.help_outline,
                  title: 'Help & Support',
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/help');
                  },
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildDrawerItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    String? subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: ModernColors.neutral100,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: ModernColors.primaryRed, size: 18),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: ModernColors.neutral900,
        ),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle,
              style: const TextStyle(
                fontSize: 11,
                color: ModernColors.neutral600,
              ),
            )
          : null,
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 1),
      dense: true,
      visualDensity: VisualDensity.compact,
    );
  }

  static void _handleNavigation(BuildContext context, int index, int currentIndex) {
    if (index == currentIndex) return;
    
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/dashboard');
        break;
      case 1:
        Navigator.pushNamed(context, '/map-fullscreen');
        break;
      case 2:
        Navigator.pushNamed(context, '/alerts');
        break;
      case 3:
        Navigator.pushNamed(context, '/tour-plan');
        break;
      case 4:
        Navigator.pushNamed(context, '/profile');
        break;
    }
  }

  static AppBar buildAppBar(
    BuildContext context, {
    required String title,
    List<Widget>? actions,
    bool showMenuButton = true,
  }) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      leading: showMenuButton
          ? Builder(
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
            )
          : null,
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w800,
          color: Colors.white,
        ),
      ),
      actions: actions ??
          [
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
    );
  }
}
