import 'package:flutter/material.dart';

class KycVerificationScreen extends StatefulWidget {
  const KycVerificationScreen({Key? key}) : super(key: key);

  @override
  State<KycVerificationScreen> createState() => _KycVerificationScreenState();
}

class _KycVerificationScreenState extends State<KycVerificationScreen> {
  bool _passportSelected = false;
  bool _aadhaarSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verification'),
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
              const Text(
                'Please complete the KYC verification to proceed.',
                style: TextStyle(color: Color(0xFF6B7280)),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              _UploadCard(
                icon: Icons.badge_outlined,
                title: 'Scan Passport',
                subtitle: 'Upload or scan your passport',
                selected: _passportSelected,
                onTap: () => setState(() => _passportSelected = !_passportSelected),
              ),
              const SizedBox(height: 16),
              _UploadCard(
                icon: Icons.credit_card,
                title: 'Scan Aadhaar Card',
                subtitle: 'Upload or scan your Aadhaar card',
                selected: _aadhaarSelected,
                onTap: () => setState(() => _aadhaarSelected = !_aadhaarSelected),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  // Mock KYC: allow proceed if any one is selected
                  if (!_passportSelected && !_aadhaarSelected) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please select any one document')),
                    );
                    return;
                  }
                  Navigator.pushReplacementNamed(context, '/id-qr');
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('Proceed'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _UploadCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool selected;
  final VoidCallback onTap;

  const _UploadCard({
    required this.icon,
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
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: selected ? const Color(0xFFD93F34) : const Color(0xFFD1D5DB),
            style: selected ? BorderStyle.solid : BorderStyle.solid,
          ),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: const Color(0xFFFEEBEA),
              child: Icon(icon, color: const Color(0xFFD93F34), size: 28),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(color: Color(0xFF6B7280)),
                  ),
                ],
              ),
            ),
            Icon(
              selected ? Icons.check_circle : Icons.radio_button_unchecked,
              color: selected ? const Color(0xFFD93F34) : const Color(0xFF9CA3AF),
            ),
          ],
        ),
      ),
    );
  }
}
