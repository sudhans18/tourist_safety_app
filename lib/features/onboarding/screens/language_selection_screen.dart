import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({Key? key}) : super(key: key);

  @override
  _LanguageSelectionScreenState createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  String? _selectedLanguage;
  final List<Map<String, String>> _languages = const [
    // Added const to fix the warning
    {'code': 'en', 'name': 'English'},
    {'code': 'hi', 'name': 'Hindi'}, // Hindi
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Language'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Select your preferred language',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF111827),
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Colors.grey[200]!),
              ),
              child: Column(
                children: _buildLanguageOptions(),
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: _selectedLanguage == null ? null : _saveLanguage,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Continue',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildLanguageOptions() {
    return _languages.map((language) {
      return ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        leading: Radio<String>(
          value: language['code']!,
          groupValue: _selectedLanguage,
          onChanged: (String? value) {
            setState(() {
              _selectedLanguage = value;
            });
          },
          activeColor: const Color(0xFFD93F34),
        ),
        title: Text(
          language['name']!,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        onTap: () {
          setState(() {
            _selectedLanguage = language['code']!;
          });
        },
      );
    }).toList();
  }

  Future<void> _saveLanguage() async {
    if (_selectedLanguage == null) return;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language_code', _selectedLanguage!);

    if (mounted) {
      // Navigate to the next screen (phone verification)
      Navigator.pushReplacementNamed(context, '/phone-verification');
    }
  }
}
