import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:tourist_safety_app/core/providers/settings_provider.dart';

// Custom formatter for Indian phone numbers with spaces
class _IndianPhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    // Remove all non-digits
    String digitsOnly = newValue.text.replaceAll(RegExp(r'\D'), '');

    // Limit to 10 digits for Indian numbers
    if (digitsOnly.length > 10) {
      digitsOnly = digitsOnly.substring(0, 10);
    }

    // Add spaces every 3 digits
    String formatted = '';
    for (int i = 0; i < digitsOnly.length; i++) {
      if (i > 0 && i % 3 == 0 && i < 9) {
        formatted += ' ';
      }
      formatted += digitsOnly[i];
    }

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }

}

class OnboardingVerificationScreen extends StatefulWidget {
  const OnboardingVerificationScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingVerificationScreen> createState() =>
      _OnboardingVerificationScreenState();
}

enum _VerificationMode { phone, email }

class _OnboardingVerificationScreenState
    extends State<OnboardingVerificationScreen> {
  _VerificationMode _verificationMode = _VerificationMode.phone;
  String? _selectedLanguage = 'en'; // Auto-select English
  String _selectedCountryCode = 'IN'; // Default to India
  final List<Map<String, String>> _countries = const [
    {'code': 'IN', 'name': 'India', 'dialCode': '+91', 'flag': '🇮🇳'},
    {'code': 'US', 'name': 'United States', 'dialCode': '+1', 'flag': '🇺🇸'},
    {'code': 'GB', 'name': 'United Kingdom', 'dialCode': '+44', 'flag': '🇬🇧'},
    {'code': 'CA', 'name': 'Canada', 'dialCode': '+1', 'flag': '🇨🇦'},
    {'code': 'AU', 'name': 'Australia', 'dialCode': '+61', 'flag': '🇦🇺'},
    {'code': 'DE', 'name': 'Germany', 'dialCode': '+49', 'flag': '🇩🇪'},
    {'code': 'FR', 'name': 'France', 'dialCode': '+33', 'flag': '🇫🇷'},
    {'code': 'JP', 'name': 'Japan', 'dialCode': '+81', 'flag': '🇯🇵'},
    {'code': 'CN', 'name': 'China', 'dialCode': '+86', 'flag': '🇨🇳'},
    {'code': 'BR', 'name': 'Brazil', 'dialCode': '+55', 'flag': '🇧🇷'},
  ];

  final List<Map<String, String>> _languages = const [
    {'code': 'en', 'name': 'English', 'category': 'popular'},
    {'code': 'hi', 'name': 'हिंदी (Hindi)', 'category': 'popular'},
    {'code': 'bn', 'name': 'বাংলা (Bengali)', 'category': 'popular'},
    {'code': 'ta', 'name': 'தமிழ் (Tamil)', 'category': 'popular'},
    {'code': 'te', 'name': 'తెలుగు (Telugu)', 'category': 'popular'},
    {'code': 'as', 'name': 'অসমীয়া (Assamese)', 'category': 'regional'},
    {'code': 'gu', 'name': 'ગુજરાતી (Gujarati)', 'category': 'regional'},
    {'code': 'pa', 'name': 'ਪੰਜਾਬੀ (Punjabi)', 'category': 'regional'},
    {'code': 'kn', 'name': 'ಕನ್ನಡ (Kannada)', 'category': 'regional'},
    {'code': 'ml', 'name': 'മലയാളം (Malayalam)', 'category': 'regional'},
    {'code': 'mr', 'name': 'मराठी (Marathi)', 'category': 'regional'},
    {'code': 'ur', 'name': 'اردو (Urdu)', 'category': 'regional'},
    {'code': 'ne', 'name': 'नेपाली (Nepali)', 'category': 'regional'},
    {'code': 'fr', 'name': 'Français (French)', 'category': 'international'},
    {'code': 'de', 'name': 'Deutsch (German)', 'category': 'international'},
    {'code': 'zh', 'name': '中文 (Chinese)', 'category': 'international'},
  ];

  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _otpController = TextEditingController();
  final ScrollController _languageScrollController = ScrollController();
  bool _codeSent = false;

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    );
  }

  bool get _isPhoneMode => _verificationMode == _VerificationMode.phone;
  bool get _isEmailMode => _verificationMode == _VerificationMode.email;

  @override
  void dispose() {
    _phoneController.dispose();
    _emailController.dispose();
    _otpController.dispose();
    _languageScrollController.dispose();
    super.dispose();
  }

  // Helper methods
  bool _isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w.+\-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return emailRegex.hasMatch(email.trim());
  }

  Widget _buildLanguageDropdownItem(Map<String, String> language) {
    final isEnglish = language['code'] == 'en';
    final englishName = _getEnglishName(language['code']!);
    final isSelected = language['code'] == _selectedLanguage;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: isSelected ? Colors.green.withAlpha(26) : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          if (isSelected) ...[
            const Icon(Icons.check, size: 18, color: Colors.green),
            const SizedBox(width: 12),
          ] else if (isEnglish) ...[
            const Icon(Icons.language, size: 16, color: Colors.blue),
            const SizedBox(width: 12),
          ] else ...[
            const SizedBox(width: 30), // Space for alignment
          ],
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    isEnglish ? 'English' : language['name']!.split(' (')[0],
                    style: TextStyle(
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                      fontSize: 14,
                      color: isSelected ? Colors.green[700] : Colors.black,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  englishName,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _getEnglishName(String code) {
    switch (code) {
      case 'hi': return 'Hindi';
      case 'bn': return 'Bengali';
      case 'ta': return 'Tamil';
      case 'te': return 'Telugu';
      case 'as': return 'Assamese';
      case 'gu': return 'Gujarati';
      case 'pa': return 'Punjabi';
      case 'kn': return 'Kannada';
      case 'ml': return 'Malayalam';
      case 'mr': return 'Marathi';
      case 'ur': return 'Urdu';
      case 'ne': return 'Nepali';
      case 'fr': return 'French';
      case 'de': return 'German';
      case 'zh': return 'Chinese';
      default: return 'English';
    }
  }

  String _getLanguageDisplayName(String code) {
    final language = _languages.firstWhere((lang) => lang['code'] == code);
    return language['code'] == 'en' ? 'English' : language['name']!.split(' (')[0];
  }

  String _getCountryDialCode(String code) {
    final country = _countries.firstWhere((country) => country['code'] == code);
    return country['dialCode']!;
  }

  String _getCountryFlag(String code) {
    final country = _countries.firstWhere((country) => country['code'] == code);
    return country['flag']!;
  }

  List<Widget> _buildPhoneInput(BuildContext context) {
    // Check if phone number is valid (10 digits for India)
    bool isValidPhoneNumber(String text) {
      String digitsOnly = text.replaceAll(RegExp(r'\D'), '');
      return _selectedCountryCode == 'IN' ? digitsOnly.length == 10 : digitsOnly.isNotEmpty;
    }

    return [
      // Phone number input with country selector
      Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[300]!),
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withAlpha(26),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          children: [
            // Country selector
            PopupMenuButton<String>(
              onSelected: (value) {
                setState(() {
                  _selectedCountryCode = value;
                });
              },
              itemBuilder: (BuildContext context) {
                return _countries.map((country) {
                  return PopupMenuItem<String>(
                    value: country['code'],
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                      child: Row(
                        children: [
                          Text(country['flag']!, style: const TextStyle(fontSize: 18)),
                          const SizedBox(width: 8),
                          Text(country['name']!),
                          const Spacer(),
                          Text(country['dialCode']!, style: TextStyle(color: Colors.grey[600])),
                        ],
                      ),
                    ),
                  );
                }).toList();
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(color: Colors.grey[300]!),
                  ),
                ),
                child: Row(
                  children: [
                    Text(_getCountryFlag(_selectedCountryCode), style: const TextStyle(fontSize: 18)),
                    const SizedBox(width: 4),
                    Text(_getCountryDialCode(_selectedCountryCode)),
                    const SizedBox(width: 4),
                    const Icon(Icons.arrow_drop_down, size: 16, color: Colors.grey),
                  ],
                ),
              ),
            ),

            // Phone number input with validation
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: TextField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: const BorderSide(color: Color(0xFFE14B4B), width: 1.4),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    hintText: 'Phone number',
                    hintStyle: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 14,
                    ),
                    isDense: true,
                    suffixIcon: _phoneController.text.isNotEmpty
                        ? Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: Icon(
                              isValidPhoneNumber(_phoneController.text)
                                  ? Icons.check_circle
                                  : Icons.cancel,
                              color: isValidPhoneNumber(_phoneController.text)
                                  ? Colors.green
                                  : Colors.red,
                              size: 20,
                            ),
                          )
                        : null,
                    suffixIconConstraints: const BoxConstraints(
                      minWidth: 20,
                      minHeight: 20,
                    ),
                  ),
                  inputFormatters: [
                    if (_selectedCountryCode == 'IN')
                      _IndianPhoneNumberFormatter(),
                  ],
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
              ),
            ),

          ],
        ),
      ),
    ];
  }

  List<Widget> _buildEmailInput(BuildContext context) {
    final isValid = _isValidEmail(_emailController.text);

    return [
      TextField(
        controller: _emailController,
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        autocorrect: false,
        enableSuggestions: false,
        textAlign: TextAlign.start,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          labelText: 'Email address',
          hintText: 'name@example.com',
          filled: true,
          fillColor: Colors.white.withValues(alpha: 0.96),
          contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: Colors.grey[300]!),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: Colors.grey[300]!),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: Color(0xFFE14B4B), width: 1.4),
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Icon(
              isValid ? Icons.check_circle : Icons.alternate_email,
              size: 20,
              color: isValid ? Colors.green : Colors.grey[500],
            ),
          ),
          suffixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
        ),
        onChanged: (_) => setState(() {}),
      ),
      const SizedBox(height: 8),
      Text(
        'We will send a verification code to this email.',
        style: TextStyle(
          fontSize: 12,
          color: Colors.grey[600],
          fontWeight: FontWeight.w400,
        ),
      ),
    ];
  }

  List<Widget> _buildOtpInput(BuildContext context) {
    return [
      Text(
        'Enter the 6-digit code sent to your ${_isPhoneMode ? 'phone' : 'email'}',
        style: const TextStyle(color: Color(0xFF6B7280)),
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

  List<Widget> _buildVerificationFields(BuildContext context) {
    if (_isPhoneMode) {
      return _buildPhoneInput(context);
    }
    return _buildEmailInput(context);
  }

  Widget _buildVerificationToggle(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF1F5F9),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      child: Row(
        children: [
          _buildVerificationChoice(context, _VerificationMode.phone, Icons.phone_iphone, 'Mobile'),
          const SizedBox(width: 6),
          _buildVerificationChoice(context, _VerificationMode.email, Icons.mail_outline, 'Email'),
        ],
      ),
    );
  }

  Widget _buildVerificationChoice(
    BuildContext context,
    _VerificationMode mode,
    IconData icon,
    String label,
  ) {
    final bool isSelected = _verificationMode == mode;

    return Expanded(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.25),
                    blurRadius: 14,
                    offset: const Offset(0, 6),
                  ),
                ]
              : null,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () {
              if (_verificationMode != mode) {
                FocusScope.of(context).unfocus();
                setState(() {
                  _verificationMode = mode;
                  _codeSent = false;
                  _otpController.clear();
                });
              }
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    size: 18,
                    color: isSelected ? const Color(0xFFE14B4B) : const Color(0xFF9CA3AF),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    label,
                    style: TextStyle(
                      fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                      color: isSelected ? const Color(0xFF1F2937) : const Color(0xFF6B7280),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onPrimaryAction() async {
    if (_selectedLanguage == null) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select a language')),
        );
      }
      return;
    }

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language_code', _selectedLanguage!);
    if (mounted) {
      context.read<SettingsProvider>().setLanguageCode(_selectedLanguage!);
    }

    if (!_codeSent) {
      if (_isPhoneMode) {
        final digitsOnly = _phoneController.text.replaceAll(RegExp(r'\D'), '');
        final isValidNumber =
            _selectedCountryCode == 'IN' ? digitsOnly.length == 10 : digitsOnly.isNotEmpty;

        if (!isValidNumber) {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  _selectedCountryCode == 'IN'
                      ? 'Please enter a valid 10-digit Indian phone number'
                      : 'Please enter a valid phone number',
                ),
              ),
            );
          }
          return;
        }

        if (_phoneController.text.isEmpty) {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Please enter a phone number')),
            );
          }
          return;
        }
      } else {
        final email = _emailController.text.trim();
        if (email.isEmpty || !_isValidEmail(email)) {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Please enter a valid email address')),
            );
          }
          return;
        }
      }

      setState(() => _codeSent = true);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              _isPhoneMode
                  ? 'Verification code sent to your phone (mocked). Enter any 6 digits.'
                  : 'Verification code sent to your email (mocked). Enter any 6 digits.',
            ),
          ),
        );
      }
      return;
    }

    if (_otpController.text.length == 6) {
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/kyc');
      }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid code. Please enter 6 digits.')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget buildMainContent() {
      final verificationTitle =
          _isPhoneMode ? 'Mobile Verification' : 'Email Verification';
      final sendActionLabel =
          _isPhoneMode ? 'Send Verification Code' : 'Send Verification Email';
      final changeActionLabel =
          _isPhoneMode ? 'Change phone number' : 'Use a different email';

      return Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 460),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 48),
              Text(
                'SafeTourist',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                  letterSpacing: 1.2,
                  shadows: [
                    Shadow(
                      color: Colors.black.withValues(alpha: 0.45),
                      offset: const Offset(0, 3),
                      blurRadius: 12,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Your Safety, Our Priority',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFFFFF5F0),
                  letterSpacing: 0.4,
                  shadows: [
                    Shadow(
                      color: Colors.black.withValues(alpha: 0.35),
                      offset: const Offset(0, 2),
                      blurRadius: 8,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 36),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 460),
                child: Card(
                  color: Colors.white,
                  elevation: 16,
                  shadowColor: Colors.black.withValues(alpha: 0.22),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(26),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 36),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        PopupMenuButton<String>(
                          position: PopupMenuPosition.under,
                          offset: const Offset(0, 8),
                          constraints: const BoxConstraints(
                            maxHeight: 300,
                            minWidth: double.infinity,
                          ),
                          onSelected: (value) {
                            setState(() {
                              _selectedLanguage = value;
                            });
                          },
                          itemBuilder: (BuildContext context) {
                            return [
                              PopupMenuItem<String>(
                                enabled: false,
                                padding: EdgeInsets.zero,
                                height: 300,
                                child: SizedBox(
                                  height: 300,
                                  width: double.infinity,
                                  child: Scrollbar(
                                    controller: _languageScrollController,
                                    thumbVisibility: true,
                                    radius: const Radius.circular(3.0),
                                    thickness: 4.0,
                                    child: ListView.builder(
                                      controller: _languageScrollController,
                                      padding: EdgeInsets.zero,
                                      itemCount: _languages.length,
                                      itemBuilder: (context, index) {
                                        final language = _languages[index];
                                        return Material(
                                          color: Colors.transparent,
                                          child: InkWell(
                                            onTap: () => Navigator.pop<String>(
                                              context,
                                              language['code'],
                                            ),
                                            child: _buildLanguageDropdownItem(language),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ];
                          },
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
                            decoration: BoxDecoration(
                              border: Border.all(color: const Color(0xFFE2E8F0)),
                              borderRadius: BorderRadius.circular(18),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.06),
                                  blurRadius: 18,
                                  offset: const Offset(0, 10),
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      if (_selectedLanguage != null) ...[
                                        Icon(Icons.check_circle, size: 18, color: const Color(0xFFE14B4B).withValues(alpha: 0.9)),
                                        const SizedBox(width: 8),
                                      ],
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              _selectedLanguage == null
                                                  ? 'Choose your preferred language'
                                                  : _getLanguageDisplayName(_selectedLanguage!),
                                              style: TextStyle(
                                                color: _selectedLanguage == null ? Colors.grey[600] : Colors.black,
                                                fontSize: 14,
                                                fontWeight: _selectedLanguage != null ? FontWeight.w700 : FontWeight.w500,
                                              ),
                                            ),
                                            if (_selectedLanguage != null) ...[
                                              const SizedBox(height: 4),
                                              Text(
                                                _getEnglishName(_selectedLanguage!),
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12,
                                                  color: Colors.grey[600],
                                                ),
                                              ),
                                            ],
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '${_languages.length}',
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.grey[500],
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    const Icon(Icons.keyboard_arrow_down, color: Colors.grey, size: 18),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        _buildVerificationToggle(context),
                        const SizedBox(height: 28),
                        Text(
                          verificationTitle,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(fontWeight: FontWeight.w700, color: const Color(0xFF1F2937)),
                        ),
                        const SizedBox(height: 12),
                        if (!_codeSent)
                          ..._buildVerificationFields(context)
                        else
                          ..._buildOtpInput(context),
                        const SizedBox(height: 34),
                        ElevatedButton(
                          onPressed: _onPrimaryAction,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFE14B4B),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 18),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            elevation: 10,
                            shadowColor: const Color(0xFFE14B4B).withValues(alpha: 0.28),
                          ),
                          child: Text(
                            _codeSent ? 'Verify Code' : sendActionLabel,
                            style: const TextStyle(fontWeight: FontWeight.w600, letterSpacing: 0.2),
                          ),
                        ),
                        if (_codeSent) ...[
                          const SizedBox(height: 14),
                          TextButton(
                            onPressed: () {
                              FocusScope.of(context).unfocus();
                              setState(() {
                                _codeSent = false;
                                _otpController.clear();
                                if (_isEmailMode) {
                                  _emailController.clear();
                                }
                              });
                            },
                            style: TextButton.styleFrom(
                              foregroundColor: const Color(0xFFE14B4B),
                              textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                            ),
                            child: Text(changeActionLabel),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 28),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 360),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.35),
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: Colors.white.withValues(alpha: 0.18)),
                  ),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        height: 1.4,
                      ),
                      children: [
                        TextSpan(text: 'By continuing, you agree to the '),
                        TextSpan(
                          text: 'Terms',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFFFC7C7),
                          ),
                        ),
                        TextSpan(text: ' and '),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFFFC7C7),
                          ),
                        ),
                        TextSpan(text: '.'),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      extendBodyBehindAppBar: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/images/onboarding_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withValues(alpha: 0.4),
              BlendMode.darken,
            ),
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              if (Navigator.of(context).canPop())
                Positioned(
                  top: 16,
                  left: 16,
                  child: Material(
                    color: Colors.black.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(20),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.of(context).maybePop(),
                    ),
                  ),
                ),
              LayoutBuilder(
                builder: (context, constraints) {
                  final content = buildMainContent();

                  final shouldEnableScroll = constraints.maxHeight < 760;
                  final bottomInset = MediaQuery.of(context).viewInsets.bottom;

                  return SingleChildScrollView(
                    physics: shouldEnableScroll
                        ? const BouncingScrollPhysics()
                        : const AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.only(
                      left: 24,
                      right: 24,
                      top: 32,
                      bottom: bottomInset > 0 ? bottomInset + 24 : 48,
                    ),
                    keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                    child: content,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
