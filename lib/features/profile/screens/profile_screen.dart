import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourist_safety_app/l10n/app_localizations.dart';
import 'package:tourist_safety_app/core/providers/user_provider.dart';
import 'package:tourist_safety_app/core/providers/settings_provider.dart';
import 'package:tourist_safety_app/core/services/firestore_helper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tourist_safety_app/core/design/animated_components.dart';
import 'package:tourist_safety_app/core/design/modern_theme.dart';
import 'package:tourist_safety_app/core/widgets/app_navigation.dart';

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
              const SizedBox(height: 12),
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
      extendBodyBehindAppBar: true,
      drawer: AppNavigation.buildSideDrawer(context),
      appBar: AppNavigation.buildAppBar(context, title: t.profile),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/images/onboarding_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withValues(alpha: 0.35),
              BlendMode.darken,
            ),
          ),
        ),
        child: Column(
          children: [
            _buildProfileHeader(t),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: ModernColors.neutral50,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildPersonalDetails(t),
                      const SizedBox(height: 32),
                      _buildEmergencyContacts(t),
                      const SizedBox(height: 32),
                      _buildAppSettings(t),
                      const SizedBox(height: 32),
                      _buildSupportSection(t),
                      if (kDebugMode) ...[
                        const SizedBox(height: 32),
                        _buildDebugSection(),
                      ],
                      const SizedBox(height: 32),
                      _buildLogoutButton(t),
                      const SizedBox(height: 100), // Space for bottom nav
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: AppNavigation.buildBottomNavigation(context, 4),
    );
  }

  Widget _buildProfileHeader(AppLocalizations t) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 80, 24, 16),
      child: Consumer<UserProvider>(
        builder: (context, userProvider, _) {
          final profilePhotoHash = userProvider.profilePhotoHash ?? '';
          final isVerified = userProvider.isUserVerified;

          return Column(
            children: [
              TweenAnimationBuilder<double>(
                duration: const Duration(milliseconds: 800),
                tween: Tween(begin: 0.0, end: 1.0),
                builder: (context, value, child) {
                  return Transform.scale(
                    scale: value,
                    child: GestureDetector(
                      onTap: _showImagePickerOptions,
                      child: Semantics(
                        button: true,
                        label: AppLocalizations.of(context)!.profile,
                        child: Container(
                          width: 88,
                          height: 88,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ModernColors.primaryRed,
                            border: Border.all(
                              color: Colors.white,
                              width: 3,
                            ),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x14000000),
                                blurRadius: 12,
                                offset: Offset(0, 6),
                              ),
                            ],
                          ),
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Positioned.fill(
                                child: profilePhotoHash.isNotEmpty
                                    ? ClipOval(
                                        child: Image.network(
                                          profilePhotoHash,
                                          fit: BoxFit.cover,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return const Icon(
                                              Icons.person,
                                              size: 60,
                                              color: Colors.white,
                                            );
                                          },
                                        ),
                                      )
                                    : const Icon(
                                        Icons.person,
                                        size: 60,
                                        color: Colors.white,
                                      ),
                              ),
                              if (isVerified)
                                Positioned(
                                  bottom: -2,
                                  right: -2,
                                  child: Container(
                                    width: 26,
                                    height: 26,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: ModernColors.success,
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 2,
                                      ),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Color(0x33000000),
                                          blurRadius: 6,
                                          offset: Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    child: const Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 14,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 8),
            ],
          );
        },
      ),
    );
  }
  
  Widget _buildPersonalDetails(AppLocalizations t) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          t.personalTravelDetails,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: ModernColors.neutral900,
          ),
        ),
        const SizedBox(height: 16),
        Consumer<UserProvider>(
          builder: (context, userProvider, child) {
            return SurfaceCard(
              child: Column(
                children: [
                  _modernListTile(
                    icon: Icons.flag_outlined,
                    title: t.nationality,
                    value: userProvider.userNationality,
                    gradient: ModernColors.infoGradient,
                  ),
                  const Divider(height: 1, color: ModernColors.neutral200),
                  _modernListTile(
                    icon: Icons.badge_outlined,
                    title: t.passport,
                    value: userProvider.userDocumentType,
                    gradient: ModernColors.successGradient,
                  ),
                  const Divider(height: 1, color: ModernColors.neutral200),
                  _modernListTile(
                    icon: Icons.route_outlined,
                    title: t.itinerary,
                    value: userProvider.userItinerary,
                    gradient: ModernColors.warningGradient,
                    hasChevron: false,
                  ),
                  const Divider(height: 1, color: ModernColors.neutral200),
                  _modernListTile(
                    icon: Icons.perm_identity,
                    title: t.idLabel,
                    value: userProvider.walletAddress,
                    gradient: ModernColors.primaryGradient,
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildEmergencyContacts(AppLocalizations t) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          t.emergencyContacts,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: ModernColors.neutral900,
          ),
        ),
        const SizedBox(height: 16),
        Consumer<UserProvider>(
          builder: (context, userProvider, child) {
            return GlassCard(
              child: Column(
                children: [
                  if (userProvider.emergencyContact != 'Not set')
                    _modernContactTile(
                      'Emergency Contact',
                      userProvider.emergencyContact,
                    ),
                  if (userProvider.emergencyContact != 'Not set')
                    const Divider(height: 1, color: ModernColors.neutral200),
                  _modernListTile(
                    icon: Icons.person_add_alt_1_outlined,
                    title: t.addContact,
                    gradient: ModernColors.primaryGradient,
                    hasChevron: true,
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildAppSettings(AppLocalizations t) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          t.appSettings,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: ModernColors.neutral900,
          ),
        ),
        const SizedBox(height: 16),
        SurfaceCard(
          child: Column(
            children: [
              _modernListTile(
                icon: Icons.notifications_none_outlined,
                title: t.notifications,
                gradient: ModernColors.infoGradient,
                hasChevron: true,
              ),
              const Divider(height: 1, color: ModernColors.neutral200),
              Consumer<SettingsProvider>(
                builder: (context, settings, child) {
                  return _modernThemeToggleTile(t.theme, settings);
                },
              ),
              const Divider(height: 1, color: ModernColors.neutral200),
              Consumer<SettingsProvider>(
                builder: (context, settings, child) {
                  return _modernLanguageRowTile(context, t.language, settings);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSupportSection(AppLocalizations t) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          t.supportLegal,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: ModernColors.neutral900,
          ),
        ),
        const SizedBox(height: 16),
        GlassCard(
          child: Column(
            children: [
              _modernListTile(
                icon: Icons.help_center_outlined,
                title: t.helpCenter,
                gradient: ModernColors.successGradient,
                hasChevron: true,
              ),
              const Divider(height: 1, color: ModernColors.neutral200),
              _modernListTile(
                icon: Icons.privacy_tip_outlined,
                title: t.privacyPolicy,
                gradient: ModernColors.warningGradient,
                hasChevron: true,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDebugSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Debug Tools',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: ModernColors.neutral900,
          ),
        ),
        const SizedBox(height: 16),
        SurfaceCard(
          child: Column(
            children: [
              _modernListTile(
                icon: Icons.bug_report,
                title: 'Add Test Data',
                gradient: ModernColors.primaryGradient,
                hasChevron: true,
                onTap: () async {
                  try {
                    final firestoreHelper = FirestoreHelper();
                    await firestoreHelper.addSampleUserData();
                    if (!mounted) return;
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Sample data added to Firestore')),
                    );
                  } catch (e) {
                    if (!mounted) return;
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Error adding sample data: $e')),
                    );
                  }
                },
              ),
              const Divider(height: 1, color: ModernColors.neutral200),
              _modernListTile(
                icon: Icons.delete,
                title: 'Delete All Users',
                gradient: ModernColors.primaryGradient,
                hasChevron: true,
                onTap: () async {
                  try {
                    final firestoreHelper = FirestoreHelper();
                    await firestoreHelper.deleteAllUsers();
                    if (!mounted) return;
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('All users deleted from Firestore')),
                    );
                  } catch (e) {
                    if (!mounted) return;
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Error deleting users: $e')),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLogoutButton(AppLocalizations t) {
    return SurfaceCard(
      color: ModernColors.primaryRed.withValues(alpha: 0.06),
      child: InkWell(
        onTap: () => _showLogoutDialog(context),
        borderRadius: BorderRadius.circular(16),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: ModernColors.neutral100,
                  border: Border.all(color: ModernColors.neutral200),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.logout, color: ModernColors.primaryRed, size: 20),
              ),
              const SizedBox(width: 12),
              Text(
                t.logOut,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: ModernColors.primaryRed,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


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


  // Modern UI Components
  Widget _modernListTile({
    required IconData icon,
    required String title,
    String? value,
    required List<Color> gradient,
    bool hasChevron = false,
    VoidCallback? onTap,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: ModernColors.neutral100,
          border: Border.all(color: ModernColors.neutral200),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: ModernColors.primaryRed, size: 20),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          color: ModernColors.neutral900,
        ),
      ),
      subtitle: value != null
          ? Text(
              value,
              style: const TextStyle(
                color: ModernColors.neutral600,
                fontSize: 14,
              ),
            )
          : null,
      trailing: hasChevron
          ? const Icon(Icons.chevron_right, color: ModernColors.neutral400)
          : null,
      onTap: onTap,
    );
  }

  Widget _modernContactTile(String name, String phone) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: ModernColors.neutral100,
          border: Border.all(color: ModernColors.neutral200),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Icon(Icons.person_outline, color: ModernColors.primaryRed, size: 20),
      ),
      title: Text(
        name,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          color: ModernColors.neutral900,
        ),
      ),
      subtitle: Text(
        phone,
        style: const TextStyle(
          color: ModernColors.neutral600,
          fontSize: 14,
        ),
      ),
      trailing: const Icon(Icons.chevron_right, color: ModernColors.neutral400),
      onTap: () {},
    );
  }

  Widget _modernThemeToggleTile(String title, SettingsProvider settingsProvider) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: ModernColors.neutral100,
          border: Border.all(color: ModernColors.neutral200),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Icon(Icons.palette_outlined, color: ModernColors.primaryRed, size: 20),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          color: ModernColors.neutral900,
        ),
      ),
      trailing: Switch(
        value: settingsProvider.themeMode == ThemeMode.dark,
        onChanged: (value) {
          settingsProvider.setThemeMode(value ? ThemeMode.dark : ThemeMode.light);
        },
        activeThumbColor: ModernColors.primaryRed,
      ),
      onTap: () {
        final currentMode = settingsProvider.themeMode;
        final newMode = currentMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
        settingsProvider.setThemeMode(newMode);
      },
    );
  }

  Widget _modernLanguageRowTile(
      BuildContext context, String title, SettingsProvider settingsProvider) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: ModernColors.neutral100,
          border: Border.all(color: ModernColors.neutral200),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Icon(Icons.language_outlined, color: ModernColors.primaryRed, size: 20),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          color: ModernColors.neutral900,
        ),
      ),
      subtitle: Text(
        _getLanguageDisplayName(settingsProvider.locale.languageCode),
        style: const TextStyle(
          color: ModernColors.neutral600,
          fontSize: 14,
        ),
      ),
      trailing: const Icon(Icons.chevron_right, color: ModernColors.neutral400),
      onTap: () => _showLanguageDialog(context, settingsProvider),
    );
  }
}
