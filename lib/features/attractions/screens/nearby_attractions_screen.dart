import 'package:flutter/material.dart';
import 'package:tourist_safety_app/l10n/app_localizations.dart';

class NearbyAttractionsScreen extends StatelessWidget {
  const NearbyAttractionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final items = [
      {
        'title': 'City Park',
        'distance': '1.2 km',
        'rating': 4.6,
        'img': 'https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?q=80&w=800',
        'tags': [t.tagFamily, t.tagOpenAir]
      },
      {
        'title': 'Heritage Museum',
        'distance': '2.0 km',
        'rating': 4.3,
        'img': 'https://images.unsplash.com/photo-1524492412937-b28074a5d7da?q=80&w=800',
        'tags': [t.tagTickets, t.tagHistory]
      },
      {
        'title': 'Riverside Walk',
        'distance': '900 m',
        'rating': 4.8,
        'img': 'https://images.unsplash.com/photo-1519817914152-22d216bb9170?q=80&w=800',
        'tags': [t.tagScenic, t.tagFree]
      },
    ];
    return Scaffold(
      appBar: AppBar(title: Text(t.nearbyAttractions)),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemBuilder: (_, i) => _cardItem(items[i]),
        separatorBuilder: (_, __) => const SizedBox(height: 14),
        itemCount: items.length,
      ),
    );
  }

  Widget _chip(String label) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: const Color(0xFFF3F4F6),
          borderRadius: BorderRadius.circular(999),
        ),
        child: Text(label, style: const TextStyle(color: Color(0xFF6B7280))),
      );

  Widget _cardItem(Map<String, Object> it) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(color: Color(0x14000000), blurRadius: 12, offset: Offset(0, 4))],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.network(it['img']! as String, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(it['title']! as String, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(Icons.place_outlined, size: 16, color: Color(0xFF6B7280)),
                          const SizedBox(width: 4),
                          Text(it['distance']! as String, style: const TextStyle(color: Color(0xFF6B7280))),
                          const SizedBox(width: 10),
                          const Icon(Icons.star_rounded, size: 16, color: Color(0xFFF59E0B)),
                          const SizedBox(width: 2),
                          Text((it['rating'] as double).toStringAsFixed(1), style: const TextStyle(color: Color(0xFF6B7280))),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8,
                        runSpacing: -6,
                        children: (it['tags'] as List<String>).map(_chip).toList(),
                      )
                    ],
                  ),
                ),
                const Icon(Icons.chevron_right),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
