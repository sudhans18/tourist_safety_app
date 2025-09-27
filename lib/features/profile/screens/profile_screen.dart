import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourist_safety_app/l10n/app_localizations.dart';
import 'package:tourist_safety_app/core/providers/user_provider.dart';
import 'package:tourist_safety_app/core/providers/settings_provider.dart';
import 'package:tourist_safety_app/core/services/firestore_helper.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ImagePicker _picker = ImagePicker();

  void _showImagePickerOptions() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Choose Profile Picture',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _imagePickerOption(
                    icon: Icons.camera_alt,
                    label: 'Camera',
                    onTap: () => _pickImage(ImageSource.camera),
                  ),
                  _imagePickerOption(
                    icon: Icons.photo_library,
                    label: 'Gallery',
                    onTap: () => _pickImage(ImageSource.gallery),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  Widget _imagePickerOption({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFFF3F4F6),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Icon(icon, size: 32, color: const Color(0xFF6B7280)),
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF6B7280),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      Navigator.pop(context); // Close the bottom sheet

      final XFile? pickedFile = await _picker.pickImage(
        source: source,
        maxWidth: 512,
        maxHeight: 512,
        imageQuality: 85,
      );

      if (pickedFile != null) {
        await _uploadProfilePicture(pickedFile);
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error picking image: $e')),
      );
    }
  }

  Future<void> _uploadProfilePicture(XFile imageFile) async {
    try {
      // In a real app, you would upload the image to a storage service
      // For now, we'll simulate this with a placeholder hash
      const String simulatedPhotoHash =
          'https://via.placeholder.com/150?text=Profile';

      final userProvider = Provider.of<UserProvider>(context, listen: false);
      final success = await userProvider.updateProfilePhoto(simulatedPhotoHash);

      if (!mounted) return;
      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Profile picture updated successfully!')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to update profile picture')),
        );
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(t.profile),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () =>
              Navigator.pushReplacementNamed(context, '/dashboard'),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Header avatar and name
          Center(
            child: Column(
              children: [
                GestureDetector(
                  onTap: _showImagePickerOptions,
                  child: Consumer<UserProvider>(
                    builder: (context, userProvider, child) {
                      final profilePhotoHash = userProvider.profilePhotoHash ?? '';
                      return CircleAvatar(
                        radius: 40,
                        backgroundColor: const Color(0xFFF3F4F6),
                        backgroundImage: profilePhotoHash.isNotEmpty
                            ? NetworkImage(profilePhotoHash) // In a real app, this would be a proper image URL
                            : null,
                        child: profilePhotoHash.isEmpty
                            ? const Icon(Icons.person, size: 40, color: Color(0xFF6B7280))
                            : null,
                      );
                    },
                  ),
                ),
                const SizedBox(height: 10),
                Consumer<UserProvider>(
                  builder: (context, userProvider, _) => Text(
                    userProvider.userName,
                    style: const TextStyle(
                        fontWeight: FontWeight.w800, fontSize: 18),
                  ),
                ),
                const SizedBox(height: 4),
                Consumer<UserProvider>(
                  builder: (context, userProvider, child) {
                    final isVerified = userProvider.isUserVerified;
                    return Text(
                      '${t.verifiedMember} ${isVerified ? '✅' : '❌'}',
                      style: TextStyle(
                          color: isVerified
                              ? const Color(0xFF22C55E)
                              : const Color(0xFFE74C3C)),
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),

          _sectionTitle(t.personalTravelDetails),
          Consumer<UserProvider>(
            builder: (context, userProvider, child) {
              return _cardList([
                _valueRowTile(Icons.flag_outlined, t.nationality,
                    userProvider.userNationality),
                _valueRowTile(Icons.cake_outlined, t.dateOfBirth,
                    userProvider.userData?.dob ?? 'Not available'),
                _valueRowTileWithChevron(Icons.event_note_outlined, t.itinerary,
                    userProvider.userItinerary),
              ]);
            },
          ),

          _sectionTitle(t.emergencyContacts),
          Consumer<UserProvider>(
            builder: (context, userProvider, child) {
              return _cardList([
                if (userProvider.emergencyContact != 'Not set')
                  _contactTile(
                      'Emergency Contact', userProvider.emergencyContact),
                _rowTile(Icons.person_add_alt_1_outlined, t.addContact),
              ]);
            },
          ),

          _sectionTitle(t.appSettings),
          _cardList([
            _rowTile(Icons.notifications_none_outlined, t.notifications),
            Consumer<SettingsProvider>(
              builder: (context, settings, child) {
                return _themeToggleTile(t.theme, settings);
              },
            ),
            Consumer<SettingsProvider>(
              builder: (context, settings, child) {
                return _languageRowTile(context, t.language, settings);
              },
            ),
          ]),

          _sectionTitle(t.supportLegal),
          _cardList([
            _rowTile(Icons.help_center_outlined, t.helpCenter),
            _rowTile(Icons.privacy_tip_outlined, t.privacyPolicy),
          ]),

          if (kDebugMode) ...[
            _sectionTitle('Debug Tools'),
            _debugCard(context),
          ],

          // Full width logout button
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 20),
            child: ElevatedButton(
              onPressed: () => _showLogoutDialog(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFD93F34),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                t.logOut,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: 3,
        onDestinationSelected: (i) {
          if (i == 0) Navigator.pushReplacementNamed(context, '/dashboard');
          if (i == 1) Navigator.pushReplacementNamed(context, '/tour-plan');
          if (i == 2) Navigator.pushReplacementNamed(context, '/alerts');
          if (i == 3) return;
        },
        destinations: [
          NavigationDestination(
              icon: const Icon(Icons.dashboard_outlined), label: t.dashboard),
          NavigationDestination(
              icon: const Icon(Icons.event_note_outlined), label: t.tourPlan),
          NavigationDestination(
              icon: const Icon(Icons.notifications_outlined), label: t.alerts),
          NavigationDestination(
              icon: const Icon(Icons.person), label: t.profile),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) => Padding(
        padding: const EdgeInsets.fromLTRB(4, 14, 4, 10),
        child: Text(title,
            style: const TextStyle(
                color: Color(0xFF6B7280), fontWeight: FontWeight.w700)),
      );

  Widget _cardList(List<Widget> children) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
                color: Color(0x14000000), blurRadius: 12, offset: Offset(0, 4))
          ],
        ),
        child: Column(children: children),
      );

  static Widget _rowTile(IconData icon, String title, {VoidCallback? onTap}) =>
      ListTile(
        leading: Icon(icon),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap ?? () {},
      );

  static Widget _valueRowTile(IconData icon, String title, String value) =>
      ListTile(
        leading: Icon(icon),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        trailing: Text(value, style: const TextStyle(color: Color(0xFF6B7280))),
      );

  static Widget _valueRowTileWithChevron(
          IconData icon, String title, String value) =>
      ListTile(
        leading: Icon(icon),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(value, style: const TextStyle(color: Color(0xFF6B7280))),
            const SizedBox(width: 8),
            const Icon(Icons.chevron_right, color: Color(0xFF6B7280)),
          ],
        ),
        onTap: () {},
      );

  static Widget _contactTile(String name, String phone) => ListTile(
        leading: const CircleAvatar(child: Icon(Icons.person_outline)),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(phone),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {},
      );

  Widget _themeToggleTile(String title, SettingsProvider settingsProvider) =>
      ListTile(
        leading: const Icon(Icons.palette_outlined),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        trailing: Switch(
          value: settingsProvider.themeMode == ThemeMode.dark,
          onChanged: (value) {
            settingsProvider
                .setThemeMode(value ? ThemeMode.dark : ThemeMode.light);
          },
        ),
        onTap: () {
          final currentMode = settingsProvider.themeMode;
          final newMode = currentMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
          settingsProvider.setThemeMode(newMode);
        },
      );

  Widget _languageRowTile(
          BuildContext context, String title, SettingsProvider settingsProvider) =>
      ListTile(
        leading: const Icon(Icons.language_outlined),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              _getLanguageDisplayName(settingsProvider.locale.languageCode),
              style: const TextStyle(color: Color(0xFF6B7280)),
            ),
            const SizedBox(width: 8),
            const Icon(Icons.chevron_right, color: Color(0xFF6B7280)),
          ],
        ),
        onTap: () => _showLanguageDialog(context, settingsProvider),
      );

  String _getLanguageDisplayName(String languageCode) {
    switch (languageCode) {
      case 'en':
        return 'English';
      case 'hi':
        return 'हिंदी (Hindi)';
      case 'as':
        return 'অসমীয়া (Assamese)';
      case 'bn':
        return 'বাংলা (Bengali)';
      case 'ta':
        return 'தமிழ் (Tamil)';
      case 'te':
        return 'తెలుగు (Telugu)';
      case 'gu':
        return 'ગુજરાતી (Gujarati)';
      case 'pa':
        return 'ਪੰਜਾਬੀ (Punjabi)';
      case 'kn':
        return 'ಕನ್ನಡ (Kannada)';
      case 'ml':
        return 'മലയാളം (Malayalam)';
      case 'mr':
        return 'मराठी (Marathi)';
      case 'ur':
        return 'اردو (Urdu)';
      case 'ne':
        return 'नेपाली (Nepali)';
      case 'fr':
        return 'Français (French)';
      case 'de':
        return 'Deutsch (German)';
      case 'zh':
        return '中文 (Chinese)';
      default:
        return 'English';
    }
  }

  void _showLanguageDialog(
      BuildContext context, SettingsProvider settingsProvider) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(AppLocalizations.of(context)!.language),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView(
              shrinkWrap: true,
              children: [
                const Text('🌐 Popular Languages',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 8),
                _languageOptionTile(context, settingsProvider, 'en', 'English'),
                _languageOptionTile(
                    context, settingsProvider, 'hi', 'हिंदी (Hindi)'),
                _languageOptionTile(
                    context, settingsProvider, 'bn', 'বাংলা (Bengali)'),
                _languageOptionTile(
                    context, settingsProvider, 'ta', 'தமிழ் (Tamil)'),
                _languageOptionTile(
                    context, settingsProvider, 'te', 'తెలుగు (Telugu)'),
                const SizedBox(height: 16),
                const Text('🌍 Other Languages',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 8),
                _languageOptionTile(
                    context, settingsProvider, 'as', 'অসমীয়া (Assamese)'),
                _languageOptionTile(
                    context, settingsProvider, 'gu', 'ગુજરાતી (Gujarati)'),
                _languageOptionTile(
                    context, settingsProvider, 'pa', 'ਪੰਜਾਬੀ (Punjabi)'),
                _languageOptionTile(
                    context, settingsProvider, 'kn', 'ಕನ್ನಡ (Kannada)'),
                _languageOptionTile(
                    context, settingsProvider, 'ml', 'മലയാളം (Malayalam)'),
                _languageOptionTile(
                    context, settingsProvider, 'mr', 'मराठी (Marathi)'),
                _languageOptionTile(
                    context, settingsProvider, 'ur', 'اردو (Urdu)'),
                _languageOptionTile(
                    context, settingsProvider, 'ne', 'नेपाली (Nepali)'),
                _languageOptionTile(
                    context, settingsProvider, 'fr', 'Français (French)'),
                _languageOptionTile(
                    context, settingsProvider, 'de', 'Deutsch (German)'),
                _languageOptionTile(
                    context, settingsProvider, 'zh', '中文 (Chinese)'),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text(AppLocalizations.of(context)!.cancel),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  Widget _languageOptionTile(BuildContext context,
      SettingsProvider settingsProvider, String languageCode, String languageName) {
    return ListTile(
      title: Text(languageName),
      onTap: () {
        settingsProvider.setLanguageCode(languageCode);
        Navigator.of(context).pop();
      },
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(AppLocalizations.of(context)!.logOut),
          content: const Text('Are you sure you want to log out?'),
          actions: [
            TextButton(
              child: Text(AppLocalizations.of(context)!.cancel),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text(
                AppLocalizations.of(context)!.logOut,
                style: const TextStyle(color: Color(0xFFD93F34)),
              ),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                Navigator.pushNamedAndRemoveUntil(
                    context, '/', (route) => false);
              },
            ),
          ],
        );
      },
    );
  }

  // Debug methods - remove in production
  Widget _debugCard(BuildContext context) => _cardList([
        _rowTile(Icons.bug_report, 'Add Test Data', onTap: () async {
          try {
            final firestoreHelper = FirestoreHelper();
            await firestoreHelper.addSampleUserData();

            if (!context.mounted) return;
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Sample data added to Firestore')),
            );
          } catch (e) {
            if (!context.mounted) return;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error adding sample data: $e')),
            );
          }
        }),
        _rowTile(Icons.delete, 'Delete All Users', onTap: () async {
          try {
            final firestoreHelper = FirestoreHelper();
            await firestoreHelper.deleteAllUsers();

            if (!context.mounted) return;
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('All users deleted from Firestore')),
            );
          } catch (e) {
            if (!context.mounted) return;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error deleting users: $e')),
            );
          }
        }),
      ]);
}
