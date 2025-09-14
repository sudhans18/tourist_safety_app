import 'package:flutter/material.dart';

class PhoneVerificationScreen extends StatefulWidget {
  const PhoneVerificationScreen({Key? key}) : super(key: key);

  @override
  _PhoneVerificationScreenState createState() => _PhoneVerificationScreenState();
}

class _PhoneVerificationScreenState extends State<PhoneVerificationScreen> {
  final _phoneController = TextEditingController();
  final _otpController = TextEditingController();
  bool _codeSent = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phone Verification'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 24),
              Text(
                'Enter your phone number',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF111827),
                    ),
              ),
              const SizedBox(height: 8),
              const Text(
                'We\'ll send you a verification code',
                style: TextStyle(color: Color(0xFF6B7280)),
              ),
              const SizedBox(height: 32),
              if (!_codeSent) ..._buildPhoneInput(),
              if (_codeSent) ..._buildOtpInput(),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: _codeSent ? _verifyOtp : _verifyPhone,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  _codeSent ? 'Verify OTP' : 'Send Verification Code',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              if (_codeSent) ...[
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _codeSent = false;
                      _otpController.clear();
                    });
                  },
                  child: const Text(
                    'Change phone number',
                    style: TextStyle(color: Color(0xFF6B7280)),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildPhoneInput() {
    return [
      TextField(
        controller: _phoneController,
        keyboardType: TextInputType.phone,
        style: const TextStyle(fontSize: 16),
        decoration: const InputDecoration(
          labelText: 'Phone Number',
          hintText: '+91XXXXXXXXXX',
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Text(
              '+91',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        ),
      ),
    ];
  }

  List<Widget> _buildOtpInput() {
    return [
      const Text(
        'Enter the 6-digit code sent to your phone',
        style: TextStyle(color: Color(0xFF6B7280)),
      ),
      const SizedBox(height: 24),
      TextField(
        controller: _otpController,
        keyboardType: TextInputType.number,
        maxLength: 6,
        style: const TextStyle(fontSize: 16, letterSpacing: 2),
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          counterText: '',
          hintText: '------',
          hintStyle: TextStyle(
            color: Colors.grey[400],
            letterSpacing: 2,
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey[300]!),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey[300]!),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFFD93F34), width: 2),
          ),
        ),
      ),
    ];
  }

  Future<void> _verifyPhone() async {
    if (_phoneController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a phone number')),
      );
      return;
    }

    // MOCK IMPLEMENTATION: Skip Firebase verification and go to OTP screen
    setState(() {
      _codeSent = true;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Verification code sent (mocked). Enter any 6 digits.')),
    );
  }

  Future<void> _verifyOtp() async {
    // MOCK IMPLEMENTATION: Bypass Firebase and accept any 6-digit OTP
    if (_otpController.text.length == 6) {
      if (mounted) {
        // Directly navigate to the dashboard on successful mock verification
        Navigator.pushReplacementNamed(context, '/dashboard');
      }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid OTP. Please enter 6 digits.')),
        );
      }
    }
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _otpController.dispose();
    super.dispose();
  }
}
