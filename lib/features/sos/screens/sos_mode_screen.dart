import 'package:flutter/material.dart';

class SosModeScreen extends StatelessWidget {
  const SosModeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SOS'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Offline banner style
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF3CD),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.wifi_off, color: Color(0xFFB7791F)),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'No internet connection. Displaying cached data.',
                        style: TextStyle(color: Color(0xFFB7791F)),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // SOS Header
              const Column(
                children: [
                  CircleAvatar(radius: 36, backgroundColor: Color(0xFFFEEBEA), child: Text('SOS', style: TextStyle(color: Color(0xFFD93F34), fontWeight: FontWeight.w800))),
                  SizedBox(height: 16),
                  Text('EMERGENCY MODE', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: Color(0xFFB91C1C))),
                  SizedBox(height: 8),
                  Text('SOS has been triggered. Help is on the way.', textAlign: TextAlign.center, style: TextStyle(color: Color(0xFF6B7280))),
                ],
              ),
              const SizedBox(height: 24),

              // ETA Card
              const _SosCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('RESPONDER ETA', style: TextStyle(color: Color(0xFF6B7280))),
                    SizedBox(height: 8),
                    Text('5 MIN', style: TextStyle(fontSize: 42, fontWeight: FontWeight.w900)),
                    SizedBox(height: 4),
                    Text('John Doe is en route.', style: TextStyle(color: Color(0xFF6B7280))),
                  ],
                ),
              ),
              const SizedBox(height: 12),

              // Contacts Card
              const _SosCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Notifying Emergency Contacts', style: TextStyle(fontWeight: FontWeight.w700)),
                    SizedBox(height: 12),
                    _ContactRow(name: 'Jane Doe'),
                    SizedBox(height: 8),
                    _ContactRow(name: 'Family Group'),
                  ],
                ),
              ),
              const SizedBox(height: 12),

              // Live Audio Stream
              const _SosCard(
                child: Row(
                  children: [
                    Icon(Icons.mic_off, color: Color(0xFF9CA3AF)),
                    SizedBox(width: 12),
                    Expanded(child: Text('Connecting to audio stream...')),
                  ],
                ),
              ),

              const SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFD93F34), padding: const EdgeInsets.symmetric(vertical: 14), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                onPressed: () => Navigator.pop(context),
                child: const Text('Dismiss'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SosCard extends StatelessWidget {
  final Widget child;
  const _SosCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(color: Color(0x14000000), blurRadius: 12, offset: Offset(0, 4))],
      ),
      child: child,
    );
  }
}

class _ContactRow extends StatelessWidget {
  final String name;
  const _ContactRow({required this.name});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(Icons.person_outline),
        SizedBox(width: 8),
        Expanded(child: Text('Jane Doe')),
        Text('Notified', style: TextStyle(color: Color(0xFF22C55E))),
      ],
    );
  }
}
