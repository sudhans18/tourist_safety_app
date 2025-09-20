import 'package:flutter/material.dart';
import 'package:tourist_safety_app/l10n/app_localizations.dart';

class NearbyAttractionsScreen extends StatelessWidget {
  const NearbyAttractionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(t.nearbyAttractions)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: const ListTile(
              leading: Icon(Icons.park_outlined),
              title: Text('City Park'),
              subtitle: Text('1.2 km • Family friendly'),
              trailing: Icon(Icons.chevron_right),
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: const ListTile(
              leading: Icon(Icons.museum_outlined),
              title: Text('Heritage Museum'),
              subtitle: Text('2.0 km • Tickets required'),
              trailing: Icon(Icons.chevron_right),
            ),
          ),
        ],
      ),
    );
  }
}
