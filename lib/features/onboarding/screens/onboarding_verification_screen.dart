import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingVerificationScreen extends StatefulWidget {
  const OnboardingVerificationScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingVerificationScreen> createState() => _OnboardingVerificationScreenState();
}

class _OnboardingVerificationScreenState extends State<OnboardingVerificationScreen> {
  String? _selectedLanguage;
  final List<Map<String, String>> _languages = const [
    {'code': 'en', 'name': 'English'},
    {'code': 'hi', 'name': 'हिंदी'},
  ];

  final _phoneController = TextEditingController();
  final _otpController = TextEditingController();
  bool _codeSent = false;

  @override
  void dispose() {
    _phoneController.dispose();
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Onboarding'),
        leading: Navigator.of(context).canPop()
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.of(context).maybePop(),
              )
            : null,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Language selection card
              Text(
                'Language',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 12),
              Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: Colors.grey[200]!),
                ),
                child: Column(children: _buildLanguageOptions()),
              ),
              const SizedBox(height: 32),

              // Phone verification
              Text(
                'Mobile Verification',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 12),
              if (!_codeSent) ..._buildPhoneInput(context) else ..._buildOtpInput(context),

              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: _onPrimaryAction,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: Text(_codeSent ? 'Verify OTP' : 'Send Verification Code'),
              ),

              if (_codeSent) ...[
                const SizedBox(height: 12),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _codeSent = false;
                      _otpController.clear();
                    });
                  },
                  child: const Text('Change phone number'),
                ),
              ],

              const SizedBox(height: 24),
              Text(
                'By continuing, you agree to the Terms and Privacy Policy.',
                textAlign: TextAlign.center,
                style: const TextStyle(color: Color(0xFF6B7280), fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildLanguageOptions() {
    return _languages.map((language) {
      return ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Radio<String>(
          value: language['code']!,
          groupValue: _selectedLanguage,
          onChanged: (val) => setState(() => _selectedLanguage = val),
          activeColor: const Color(0xFFD93F34),
        ),
        title: Text(language['name']!, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        onTap: () => setState(() => _selectedLanguage = language['code']!),
      );
    }).toList();
  }

  List<Widget> _buildPhoneInput(BuildContext context) {
    return [
      TextField(
        controller: _phoneController,
        keyboardType: TextInputType.phone,
        decoration: const InputDecoration(
          labelText: 'Phone Number',
          hintText: '+91XXXXXXXXXX',
          prefixIcon: Icon(Icons.phone_outlined),
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        ),
      ),
    ];
  }

  List<Widget> _buildOtpInput(BuildContext context) {
    return [
      const Text(
        'Enter the 6-digit code sent to your phone',
        style: TextStyle(color: Color(0xFF6B7280)),
      ),
      const SizedBox(height: 12),
      TextField(
        controller: _otpController,
        keyboardType: TextInputType.number,
        maxLength: 6,
        textAlign: TextAlign.center,
        decoration: const InputDecoration(
          counterText: '',
          hintText: '------',
        ),
      ),
    ];
  }

  Future<void> _onPrimaryAction() async {
    // Enforce language selection first
    if (_selectedLanguage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a language')),
      );
      return;
    }

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language_code', _selectedLanguage!);

    if (!_codeSent) {
      // Mock send code
      if (_phoneController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please enter a phone number')),
        );
        return;
      }

      setState(() => _codeSent = true);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Verification code sent (mocked). Enter any 6 digits.')),
      );
      return;
    }

    // Verify OTP (mock)
    if (_otpController.text.length == 6) {
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/kyc');
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid OTP. Please enter 6 digits.')),
      );
    }
  }
}
