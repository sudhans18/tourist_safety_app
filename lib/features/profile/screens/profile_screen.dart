import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourist_safety_app/l10n/app_localizations.dart';
import 'package:tourist_safety_app/core/providers/settings_provider.dart';
import 'package:tourist_safety_app/core/providers/user_provider.dart';
import 'package:tourist_safety_app/core/services/firestore_helper.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(t.profile),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () =>
              Navigator.pushReplacementNamed(context, '/dashboard'),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Header avatar and name
          Center(
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundColor: Color(0xFFF3F4F6),
                  child: Icon(Icons.person, size: 40, color: Color(0xFF6B7280)),
                ),
                const SizedBox(height: 10),
                Text(
                  Provider.of<UserProvider>(context).userName,
                  style: const TextStyle(
                      fontWeight: FontWeight.w800, fontSize: 18),
                ),
                const SizedBox(height: 4),
                Consumer<UserProvider>(
                  builder: (context, userProvider, child) {
                    final isVerified = userProvider.isUserVerified;
                    return Text(
                      '${t.verifiedMember} ${isVerified ? '✅' : '❌'}',
                      style: TextStyle(
                          color: isVerified
                              ? const Color(0xFF22C55E)
                              : const Color(0xFFE74C3C)),
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),

          _sectionTitle(t.personalTravelDetails),
          Consumer<UserProvider>(
            builder: (context, userProvider, child) {
              return _cardList([
                _valueRowTile(Icons.flag_outlined, t.nationality,
                    userProvider.userNationality),
                _valueRowTile(Icons.cake_outlined, t.dateOfBirth,
                    userProvider.userData?.dob ?? 'Not available'),
                _valueRowTileWithChevron(Icons.event_note_outlined, t.itinerary,
                    userProvider.userItinerary),
              ]);
            },
          ),

          _sectionTitle(t.emergencyContacts),
          Consumer<UserProvider>(
            builder: (context, userProvider, child) {
              return _cardList([
                if (userProvider.emergencyContact != 'Not set')
                  _contactTile(
                      'Emergency Contact', userProvider.emergencyContact),
                _rowTile(Icons.person_add_alt_1_outlined, t.addContact),
              ]);
            },
          ),

          _sectionTitle(t.appSettings),
          _cardList([
            _rowTile(Icons.notifications_none_outlined, t.notifications),
            Consumer<SettingsProvider>(
              builder: (context, settings, child) {
                return _themeToggleTile(context, t.theme, settings.themeMode);
              },
            ),
            Consumer<SettingsProvider>(
              builder: (context, settings, child) {
                return _languageRowTile(
                    context, t.language, settings.locale.languageCode);
              },
            ),
          ]),

          _sectionTitle(t.supportLegal),
          _cardList([
            _rowTile(Icons.help_center_outlined, t.helpCenter),
            _rowTile(Icons.privacy_tip_outlined, t.privacyPolicy),
          ]),

          // Debug section - remove in production
          _sectionTitle('Debug Tools'),
          _debugCard(context),

          // Full width logout button
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 20),
            child: ElevatedButton(
              onPressed: () => _showLogoutDialog(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFD93F34),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                t.logOut,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: 3,
        onDestinationSelected: (i) {
          if (i == 0) Navigator.pushReplacementNamed(context, '/dashboard');
          if (i == 1) Navigator.pushReplacementNamed(context, '/tour-plan');
          if (i == 2) Navigator.pushReplacementNamed(context, '/alerts');
          if (i == 3) return;
        },
        destinations: [
          NavigationDestination(
              icon: const Icon(Icons.dashboard_outlined), label: t.dashboard),
          NavigationDestination(
              icon: const Icon(Icons.event_note_outlined), label: t.tourPlan),
          NavigationDestination(
              icon: const Icon(Icons.notifications_outlined), label: t.alerts),
          NavigationDestination(
              icon: const Icon(Icons.person), label: t.profile),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) => Padding(
        padding: const EdgeInsets.fromLTRB(4, 14, 4, 10),
        child: Text(title,
            style: const TextStyle(
                color: Color(0xFF6B7280), fontWeight: FontWeight.w700)),
      );

  Widget _cardList(List<Widget> children) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
                color: Color(0x14000000), blurRadius: 12, offset: Offset(0, 4))
          ],
        ),
        child: Column(children: children),
      );

  static Widget _rowTile(IconData icon, String title, {VoidCallback? onTap}) =>
      ListTile(
        leading: Icon(icon),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap ?? () {},
      );

  static Widget _valueRowTile(IconData icon, String title, String value) =>
      ListTile(
        leading: Icon(icon),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        trailing: Text(value, style: const TextStyle(color: Color(0xFF6B7280))),
      );

  static Widget _valueRowTileWithChevron(
          IconData icon, String title, String value) =>
      ListTile(
        leading: Icon(icon),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(value, style: const TextStyle(color: Color(0xFF6B7280))),
            const SizedBox(width: 8),
            const Icon(Icons.chevron_right, color: Color(0xFF6B7280)),
          ],
        ),
        onTap: () {},
      );

  static Widget _contactTile(String name, String phone) => ListTile(
        leading: const CircleAvatar(child: Icon(Icons.person_outline)),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(phone),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {},
      );

  Widget _themeToggleTile(
          BuildContext context, String title, ThemeMode currentMode) =>
      ListTile(
        leading: const Icon(Icons.palette_outlined),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        trailing: Switch(
          value: currentMode == ThemeMode.dark,
          onChanged: (value) {
            final settingsProvider =
                Provider.of<SettingsProvider>(context, listen: false);
            settingsProvider
                .setThemeMode(value ? ThemeMode.dark : ThemeMode.light);
          },
        ),
        onTap: () {
          final settingsProvider =
              Provider.of<SettingsProvider>(context, listen: false);
          final newMode =
              currentMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
          settingsProvider.setThemeMode(newMode);
        },
      );

  Widget _languageRowTile(
          BuildContext context, String title, String currentLanguage) =>
      ListTile(
        leading: const Icon(Icons.language_outlined),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              currentLanguage == 'en' ? 'English' : 'हिंदी',
              style: const TextStyle(color: Color(0xFF6B7280)),
            ),
            const SizedBox(width: 8),
            const Icon(Icons.chevron_right, color: Color(0xFF6B7280)),
          ],
        ),
        onTap: () => _showLanguageDialog(context),
      );

  void _showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(AppLocalizations.of(context)!.language),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('English'),
                onTap: () {
                  Provider.of<SettingsProvider>(context, listen: false)
                      .setLanguageCode('en');
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: const Text('हिंदी'),
                onTap: () {
                  Provider.of<SettingsProvider>(context, listen: false)
                      .setLanguageCode('hi');
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(AppLocalizations.of(context)!.logOut),
          content: const Text('Are you sure you want to log out?'),
          actions: [
            TextButton(
              child: Text(AppLocalizations.of(context)!.cancel),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text(
                AppLocalizations.of(context)!.logOut,
                style: const TextStyle(color: Color(0xFFD93F34)),
              ),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                Navigator.pushNamedAndRemoveUntil(
                    context, '/', (route) => false);
              },
            ),
          ],
        );
      },
    );
  }

  // Debug methods - remove in production
  Widget _debugCard(BuildContext context) => _cardList([
        _rowTile(Icons.bug_report, 'Add Test Data', onTap: () async {
          try {
            final firestoreHelper = FirestoreHelper();
            await firestoreHelper.addSampleUserData();

            if (!context.mounted) return;
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Sample data added to Firestore')),
            );
          } catch (e) {
            if (!context.mounted) return;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error adding sample data: $e')),
            );
          }
        }),
        _rowTile(Icons.delete, 'Delete All Users', onTap: () async {
          try {
            final firestoreHelper = FirestoreHelper();
            await firestoreHelper.deleteAllUsers();

            if (!context.mounted) return;
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('All users deleted from Firestore')),
            );
          } catch (e) {
            if (!context.mounted) return;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error deleting users: $e')),
            );
          }
        }),
      ]);
}
