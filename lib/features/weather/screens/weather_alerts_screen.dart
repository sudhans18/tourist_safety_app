import 'package:flutter/material.dart';
import 'package:tourist_safety_app/l10n/app_localizations.dart';

class WeatherAlertsScreen extends StatelessWidget {
  const WeatherAlertsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(t.weatherAlerts)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFE0EAFF),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.cloudy_snowing, color: Color(0xFF2563EB)),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(t.severeWeatherWarning, style: const TextStyle(fontWeight: FontWeight.w700)),
                      const SizedBox(height: 4),
                      Text(t.severeWeatherDesc,
                          style: const TextStyle(color: Color(0xFF374151))),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
