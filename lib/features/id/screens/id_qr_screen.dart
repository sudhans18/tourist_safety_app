import 'dart:math';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class IdQrScreen extends StatefulWidget {
  const IdQrScreen({Key? key}) : super(key: key);

  @override
  State<IdQrScreen> createState() => _IdQrScreenState();
}

class _IdQrScreenState extends State<IdQrScreen> {
  late final String _touristId;

  @override
  void initState() {
    super.initState();
    _touristId = _generateMockTouristId();
  }

  String _generateMockTouristId() {
    final rnd = Random();
    String digits(int n) => List.generate(n, (_) => rnd.nextInt(10)).join();
    // Format similar to screenshot: 4-4-4 groups
    return '${digits(4)} ${digits(4)} ${digits(4)}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your ID & QR Code'),
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
              const SizedBox(height: 8),
              const CircleAvatar(
                radius: 28,
                backgroundColor: Color(0xFFE6F4EA),
                child: Icon(Icons.check, color: Color(0xFF34A853), size: 32),
              ),
              const SizedBox(height: 16),
              Text(
                'Registration Complete',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 8),
              const Text(
                'Your unique Tourist ID and QR code are ready.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xFF6B7280)),
              ),
              const SizedBox(height: 24),

              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x14000000),
                      offset: Offset(0, 4),
                      blurRadius: 12,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const Text(
                      'Your Tourist ID',
                      style: TextStyle(fontSize: 14, color: Color(0xFF6B7280)),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _touristId,
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFF9FAFB),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: QrImageView(
                        data: _touristId,
                        version: QrVersions.auto,
                        size: 180,
                        gapless: true,
                        eyeStyle: const QrEyeStyle(eyeShape: QrEyeShape.square, color: Colors.black),
                        dataModuleStyle: const QrDataModuleStyle(dataModuleShape: QrDataModuleShape.square, color: Colors.black),
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'This QR code can be used for quick identification and access to services.\nKeep it safe and accessible.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Color(0xFF6B7280), fontSize: 12),
                    ),
                  ],
                ),
              ),

              const Spacer(),
              ElevatedButton(
                onPressed: () => Navigator.pushReplacementNamed(context, '/band-pairing'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('Done'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
