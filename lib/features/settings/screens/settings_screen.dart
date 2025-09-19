import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourist_safety_app/core/providers/settings_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsProvider>();
    final themeSubtitle = settings.themeMode == ThemeMode.system
        ? 'System'
        : settings.themeMode == ThemeMode.light
            ? 'Light'
            : 'Dark';
    final languageSubtitle = settings.locale.languageCode == 'hi' ? 'Hindi' : 'English';
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pushReplacementNamed(context, '/dashboard'),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _settingsTile(
              icon: Icons.palette_outlined,
              title: 'Theme',
              subtitle: themeSubtitle,
              onTap: () => _showThemeDialog(context),
            ),
            const SizedBox(height: 12),
            _settingsTile(
              icon: Icons.language_outlined,
              title: 'Language',
              subtitle: languageSubtitle,
              onTap: () => _showLanguageDialog(context),
            ),
            const SizedBox(height: 12),
            _settingsTile(
              icon: Icons.notifications_outlined,
              title: 'Notifications',
              subtitle: 'Enabled',
              onTap: () {},
            ),
            const SizedBox(height: 12),
            _settingsTile(
              icon: Icons.lock_outline,
              title: 'Privacy & Security',
              subtitle: 'Standard',
              onTap: () {},
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: 3,
        onDestinationSelected: (i) {
          if (i == 0) Navigator.pushReplacementNamed(context, '/dashboard');
          if (i == 1) Navigator.pushReplacementNamed(context, '/alerts');
          if (i == 2) Navigator.pushReplacementNamed(context, '/family');
          if (i == 3) return;
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.dashboard_outlined), label: 'Dashboard'),
          NavigationDestination(icon: Icon(Icons.notifications_outlined), label: 'Alerts'),
          NavigationDestination(icon: Icon(Icons.family_restroom_outlined), label: 'Family'),
          NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }

  void _showThemeDialog(BuildContext context) {
    final settings = context.read<SettingsProvider>();
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.brightness_auto_outlined),
              title: const Text('System default'),
              onTap: () {
                settings.setThemeMode(ThemeMode.system);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.light_mode_outlined),
              title: const Text('Light'),
              onTap: () {
                settings.setThemeMode(ThemeMode.light);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.dark_mode_outlined),
              title: const Text('Dark'),
              onTap: () {
                settings.setThemeMode(ThemeMode.dark);
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 8),
          ],
        );
      },
    );
  }

  void _showLanguageDialog(BuildContext context) {
    final settings = context.read<SettingsProvider>();
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.translate),
              title: const Text('English'),
              onTap: () {
                settings.setLanguageCode('en');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.translate),
              title: const Text('हिंदी (Hindi)'),
              onTap: () {
                settings.setLanguageCode('hi');
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 8),
          ],
        );
      },
    );
  }

  Widget _settingsTile({
    required IconData icon,
    required String title,
    String? subtitle,
    required VoidCallback onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(color: Color(0x14000000), blurRadius: 12, offset: Offset(0, 4))],
      ),
      child: ListTile(
        leading: Icon(icon),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: subtitle != null ? Text(subtitle) : null,
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}
