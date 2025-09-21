import 'package:flutter/material.dart';
import 'package:tourist_safety_app/l10n/app_localizations.dart';

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
                const Text('Sophia Clark',
                    style:
                        TextStyle(fontWeight: FontWeight.w800, fontSize: 18)),
                const SizedBox(height: 4),
                Text(t.verifiedMember + ' ✅',
                    style: const TextStyle(color: Color(0xFF22C55E))),
              ],
            ),
          ),
          const SizedBox(height: 18),

          _sectionTitle(t.securityVerification),
          _cardList([
            _rowTile(Icons.card_travel, t.passport),
            _rowTile(Icons.account_balance_wallet_outlined, t.wallet),
          ]),

          _sectionTitle(t.personalTravelDetails),
          _cardList([
            _rowTile(Icons.flag_outlined, t.nationality),
            _rowTile(Icons.cake_outlined, t.dateOfBirth),
            _rowTile(Icons.event_note_outlined, t.itinerary),
          ]),

          _sectionTitle(t.emergencyContacts),
          _cardList([
            _contactTile('John Doe', '+1123 456 7890'),
            _contactTile('Jane Smith', '+1987 654 3210'),
            _rowTile(Icons.person_add_alt_1_outlined, t.addContact),
          ]),

          _sectionTitle(t.appSettings),
          _cardList([
            _rowTile(Icons.notifications_none_outlined, t.notifications),
            _rowTile(Icons.palette_outlined, t.theme),
            _rowTile(Icons.language_outlined, t.language),
          ]),

          _sectionTitle(t.supportLegal),
          _cardList([
            _rowTile(Icons.help_center_outlined, t.helpCenter),
            _rowTile(Icons.privacy_tip_outlined, t.privacyPolicy),
            _rowTile(Icons.logout, t.logOut, color: const Color(0xFFD93F34)),
          ]),
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

  static Widget _rowTile(IconData icon, String title, {Color? color}) =>
      ListTile(
        leading: Icon(icon, color: color),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {},
      );

  static Widget _contactTile(String name, String phone) => ListTile(
        leading: const CircleAvatar(child: Icon(Icons.person_outline)),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(phone),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {},
      );
}
