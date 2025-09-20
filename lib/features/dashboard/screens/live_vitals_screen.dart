import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:tourist_safety_app/l10n/app_localizations.dart';

class LiveVitalsScreen extends StatelessWidget {
  const LiveVitalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(t.liveVitals),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Offline banner
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F4F6),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.wifi_off, color: Color(0xFF6B7280)),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(t.offlineModeCached,
                          style: const TextStyle(color: Color(0xFF6B7280))),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              // Band status
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFFEEBEA),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    const Icon(Icons.bluetooth, color: Color(0xFFD93F34)),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(t.bandConnected, style: const TextStyle(fontWeight: FontWeight.w700)),
                          const SizedBox(height: 2),
                          Text(t.lastUpdatedMins('2'), style: const TextStyle(color: Color(0xFF6B7280))),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 12),
              GridView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 1.2,
                ),
                children: [
                  _VitalTile(title: t.heartRate, value: '72', unit: 'bpm', icon: Icons.favorite_outline),
                  _VitalTile(title: t.spo2, value: '98', unit: '%', icon: Icons.water_drop_outlined),
                  _VitalTile(title: t.temperature, value: '36.6', unit: '°C', icon: Icons.device_thermostat),
                  _VitalTile(title: t.activity, value: t.normal, unit: '', icon: Icons.directions_walk),
                ],
              ),
              const SizedBox(height: 16),
              const _VitalsChartCard(),
            ],
          ),
        ),
      ),
    );
  }
}

class _VitalTile extends StatelessWidget {
  final String title;
  final String value;
  final String unit;
  final IconData icon;
  const _VitalTile({required this.title, required this.value, required this.unit, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(color: Color(0x14000000), blurRadius: 12, offset: Offset(0, 4))],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: const Color(0xFFD93F34)),
          const Spacer(),
          Text(title, style: const TextStyle(color: Color(0xFF6B7280))),
          const SizedBox(height: 6),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(value, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 22)),
              if (unit.isNotEmpty) ...[
                const SizedBox(width: 4),
                Text(unit, style: const TextStyle(color: Color(0xFF6B7280))),
              ]
            ],
          ),
        ],
      ),
    );
  }
}

class _VitalsChartCard extends StatelessWidget {
  const _VitalsChartCard();

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(color: Color(0x14000000), blurRadius: 12, offset: Offset(0, 4))],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(t.last1hHeartRate, style: const TextStyle(fontWeight: FontWeight.w700)),
          const SizedBox(height: 12),
          SizedBox(
            height: 180,
            child: LineChart(
              LineChartData(
                gridData: const FlGridData(show: true, drawVerticalLine: false),
                titlesData: const FlTitlesData(show: false),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    isCurved: true,
                    color: const Color(0xFFD93F34),
                    barWidth: 3,
                    spots: const [
                      FlSpot(0, 70),
                      FlSpot(2, 72),
                      FlSpot(4, 75),
                      FlSpot(6, 74),
                      FlSpot(8, 73),
                      FlSpot(10, 76),
                      FlSpot(12, 72),
                    ],
                    dotData: const FlDotData(show: false),
                    belowBarData: BarAreaData(show: true, color: const Color(0xFFFEEBEA)),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
