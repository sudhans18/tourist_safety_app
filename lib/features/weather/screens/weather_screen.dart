import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:tourist_safety_app/l10n/app_localizations.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(t.weather)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _currentWeatherCard(t),
          const SizedBox(height: 16),
          _forecastStrip(t),
          const SizedBox(height: 16),
          _tempChartCard(t),
        ],
      ),
    );
  }

  Widget _currentWeatherCard(AppLocalizations t) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(color: Color(0x14000000), blurRadius: 12, offset: Offset(0, 4))],
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          const Icon(Icons.wb_sunny_outlined, size: 48, color: Color(0xFFF59E0B)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(t.currentWeather, style: const TextStyle(fontWeight: FontWeight.w700)),
                const SizedBox(height: 4),
                const Text('31°C • Sunny'),
                const SizedBox(height: 4),
                Text('${t.feelsLike}: 33°C • ${t.humidity}: 52% • ${t.wind}: 12 km/h',
                    style: const TextStyle(color: Color(0xFF6B7280))),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _forecastStrip(AppLocalizations t) {
    final items = [
      {'d': t.today, 't': '32°/25°', 'i': Icons.wb_sunny_outlined},
      {'d': t.tomorrow, 't': '31°/26°', 'i': Icons.wb_cloudy_outlined},
      {'d': t.inXDays(2), 't': '30°/24°', 'i': Icons.thunderstorm_outlined},
      {'d': t.inXDays(3), 't': '29°/23°', 'i': Icons.water_drop_outlined},
      {'d': t.inXDays(4), 't': '31°/25°', 'i': Icons.wb_sunny_outlined},
    ];
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(color: Color(0x14000000), blurRadius: 12, offset: Offset(0, 4))],
      ),
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: SizedBox(
        height: 98,
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, i) {
            final it = items[i];
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(it['i'] as IconData, color: const Color(0xFF6B7280)),
                const SizedBox(height: 6),
                Text(it['d'] as String, style: const TextStyle(fontWeight: FontWeight.w600)),
                const SizedBox(height: 4),
                Text(it['t'] as String, style: const TextStyle(color: Color(0xFF6B7280))),
              ],
            );
          },
          separatorBuilder: (_, __) => const SizedBox(width: 18),
          itemCount: items.length,
        ),
      ),
    );
  }

  Widget _tempChartCard(AppLocalizations t) {
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
          Text(t.nextDaysTrend, style: const TextStyle(fontWeight: FontWeight.w700)),
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
                    color: const Color(0xFF2563EB),
                    barWidth: 3,
                    spots: const [
                      FlSpot(0, 31),
                      FlSpot(1, 30),
                      FlSpot(2, 29),
                      FlSpot(3, 28),
                      FlSpot(4, 31),
                    ],
                    dotData: const FlDotData(show: false),
                    belowBarData: BarAreaData(show: true, color: const Color(0x1A2563EB)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
