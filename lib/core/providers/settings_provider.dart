import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  static const _kPrefThemeMode = 'theme_mode'; // system|light|dark
  static const _kPrefLanguageCode = 'language_code'; // en|hi

  ThemeMode _themeMode = ThemeMode.system;
  Locale _locale = const Locale('en');

  ThemeMode get themeMode => _themeMode;
  Locale get locale => _locale;

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    final themeStr = prefs.getString(_kPrefThemeMode);
    final langCode = prefs.getString(_kPrefLanguageCode);

    if (themeStr != null) {
      switch (themeStr) {
        case 'light':
          _themeMode = ThemeMode.light;
          break;
        case 'dark':
          _themeMode = ThemeMode.dark;
          break;
        default:
          _themeMode = ThemeMode.system;
      }
    }

    if (langCode != null && langCode.isNotEmpty) {
      _locale = Locale(langCode);
    }

    notifyListeners();
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    _themeMode = mode;
    final prefs = await SharedPreferences.getInstance();
    final str = mode == ThemeMode.system
        ? 'system'
        : mode == ThemeMode.light
            ? 'light'
            : 'dark';
    await prefs.setString(_kPrefThemeMode, str);
    notifyListeners();
  }

  Future<void> setLanguageCode(String code) async {
    _locale = Locale(code);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_kPrefLanguageCode, code);
    notifyListeners();
  }
}
