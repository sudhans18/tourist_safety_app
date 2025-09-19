import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class BandPairingScreen extends StatefulWidget {
  const BandPairingScreen({Key? key}) : super(key: key);

  @override
  State<BandPairingScreen> createState() => _BandPairingScreenState();
}

class _BandPairingScreenState extends State<BandPairingScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  bool _foundDevice = false;
  bool _selected = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(seconds: 2))
      ..repeat(reverse: true);

    // Mock scanning and finding a device after 2 seconds
    Timer(const Duration(seconds: 2), () {
      if (mounted) setState(() => _foundDevice = true);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Connect Band'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Searching for your band',
                style: Theme.of(context)
                    .textTheme
                    .displaySmall
                    ?.copyWith(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 8),
              const Text(
                'Make sure your band is nearby and in pairing mode',
                style: TextStyle(color: Color(0xFF6B7280)),
              ),
              const SizedBox(height: 24),
              Center(
                child: ScaleTransition(
                  scale: Tween(begin: 0.95, end: 1.05).animate(
                      CurvedAnimation(
                          parent: _controller, curve: Curves.easeInOut)),
                  child: Container(
                    width: 160,
                    height: 160,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFEEBEA),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.bluetooth,
                        color: Color(0xFFD93F34), size: 72),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              if (_foundDevice)
                _BandListTile(
                  title: 'Safety Band',
                  subtitle: 'Band ID: 123456',
                  selected: _selected,
                  onTap: () => setState(() => _selected = !_selected),
                ),
              const Spacer(),
              ElevatedButton(
                onPressed: !_foundDevice || !_selected
                    ? null
                    : () {
                        // Mock connect and move to dashboard
                        Navigator.pushReplacementNamed(context, '/dashboard');
                      },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('Connect'),
              ),
              const SizedBox(height: 12),
              OutlinedButton(
                onPressed: () async {
                  // --- FIX ---
                  // Get the Navigator from the context *before* the await calls.
                  final navigator = Navigator.of(context);

                  // These 'await' calls create the async gap.
                  LocationPermission permission =
                      await Geolocator.checkPermission();
                  if (permission == LocationPermission.denied) {
                    permission = await Geolocator.requestPermission();
                  }
                  
                  // Proceed regardless (mock) — app can fall back to manual input if denied
                  if (!mounted) return;

                  // Use the 'navigator' variable instead of 'context'.
                  navigator.pushReplacementNamed('/dashboard');
                },
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('Skip for now'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BandListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool selected;
  final VoidCallback onTap;

  const _BandListTile({
    required this.title,
    required this.subtitle,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFD1D5DB)),
        ),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 24,
              backgroundColor: Color(0xFFFEEBEA),
              child: Icon(Icons.watch, color: Color(0xFFD93F34)),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 4),
                  Text(subtitle,
                      style: const TextStyle(color: Color(0xFF6B7280))),
                ],
              ),
            ),
            Icon(
                selected
                    ? Icons.radio_button_checked
                    : Icons.radio_button_unchecked,
                color: const Color(0xFFD93F34)),
          ],
        ),
      ),
    );
  }
}
