import 'package:flutter/material.dart';
import 'package:tourist_safety_app/core/constants/app_constants.dart';
import 'package:tourist_safety_app/core/constants/dark_theme_colors.dart';

/// Application theme configuration
class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      primaryColor: AppConstants.primaryColor,
      scaffoldBackgroundColor: AppConstants.backgroundSecondary,

      // Color scheme
      colorScheme: const ColorScheme.light(
        primary: AppConstants.primaryColor,
        secondary: AppConstants.secondaryColor,
        error: AppConstants.errorColor,
        surface: AppConstants.backgroundPrimary,
        surfaceContainer: AppConstants.backgroundSecondary,
      ),

      // AppBar theme
      appBarTheme: const AppBarTheme(
        backgroundColor: AppConstants.backgroundPrimary,
        foregroundColor: AppConstants.textPrimary,
        elevation: 0,
        shadowColor: AppConstants.shadowLight,
        titleTextStyle: AppTextStyles.h3,
        iconTheme: IconThemeData(
          color: AppConstants.textPrimary,
          size: AppConstants.iconSizeMd,
        ),
      ),

      // Card theme
      cardTheme: const CardThemeData(
        color: AppConstants.backgroundPrimary,
        elevation: AppConstants.cardElevation,
        shadowColor: AppConstants.shadowLight,
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.lg,
        ),
        margin: EdgeInsets.zero,
      ),

      // Elevated button theme
      elevatedButtonTheme: const ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(AppConstants.primaryColor),
          foregroundColor: WidgetStatePropertyAll(Colors.white),
          elevation: WidgetStatePropertyAll(0.0),
          padding: WidgetStatePropertyAll(AppPadding.verticalMd),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: AppRadius.md,
            ),
          ),
          textStyle: WidgetStatePropertyAll(AppTextStyles.button),
        ),
      ),

      // Outlined button theme
      outlinedButtonTheme: const OutlinedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStatePropertyAll(AppConstants.textPrimary),
          side: WidgetStatePropertyAll(BorderSide(color: AppConstants.borderMedium)),
          padding: WidgetStatePropertyAll(AppPadding.verticalMd),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: AppRadius.md,
            ),
          ),
          textStyle: WidgetStatePropertyAll(AppTextStyles.button),
        ),
      ),

      // Text button theme
      textButtonTheme: const TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStatePropertyAll(AppConstants.primaryColor),
          padding: WidgetStatePropertyAll(AppPadding.verticalMd),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: AppRadius.md,
            ),
          ),
          textStyle: WidgetStatePropertyAll(AppTextStyles.button),
        ),
      ),

      // Input decoration theme
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        fillColor: AppConstants.backgroundPrimary,
        contentPadding: AppPadding.md,
        border: OutlineInputBorder(
          borderRadius: AppRadius.md,
          borderSide: BorderSide(color: AppConstants.borderLight),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: AppRadius.md,
          borderSide: BorderSide(color: AppConstants.borderLight),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppRadius.md,
          borderSide: BorderSide(
            color: AppConstants.primaryColor,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: AppRadius.md,
          borderSide: BorderSide(color: AppConstants.errorColor),
        ),
        labelStyle: TextStyle(color: AppConstants.textSecondary),
        hintStyle: TextStyle(color: AppConstants.textMuted),
      ),

      // Text theme
      textTheme: TextTheme(
        displayLarge: AppTextStyles.h1,
        displayMedium: AppTextStyles.h2,
        displaySmall: AppTextStyles.h3,
        headlineMedium: AppTextStyles.h3,
        headlineSmall: AppTextStyles.h3.copyWith(fontSize: 18),
        titleLarge: AppTextStyles.h3,
        titleMedium: AppTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.w600),
        titleSmall: AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.w600),
        bodyLarge: AppTextStyles.bodyLarge,
        bodyMedium: AppTextStyles.bodyMedium,
        bodySmall: AppTextStyles.bodySmall,
        labelLarge: AppTextStyles.button,
        labelSmall: AppTextStyles.caption,
      ),

      // Navigation bar theme
      navigationBarTheme: const NavigationBarThemeData(
        backgroundColor: AppConstants.backgroundPrimary,
        indicatorColor: AppConstants.primaryColor,
        labelTextStyle: WidgetStatePropertyAll(AppTextStyles.caption),
        iconTheme: WidgetStatePropertyAll(
          IconThemeData(size: AppConstants.iconSizeMd),
        ),
      ),

      // Bottom navigation bar theme
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppConstants.backgroundPrimary,
        selectedItemColor: AppConstants.primaryColor,
        unselectedItemColor: AppConstants.textSecondary,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
    );
  }

  // Dark theme implementation
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      primaryColor: AppConstants.primaryColor,
      scaffoldBackgroundColor: DarkThemeColors.backgroundSecondary,
      brightness: Brightness.dark,

      // Dark color scheme
      colorScheme: const ColorScheme.dark(
        primary: AppConstants.primaryColor,
        secondary: AppConstants.secondaryColor,
        error: AppConstants.errorColor,
        surface: DarkThemeColors.surfacePrimary,
        surfaceContainer: DarkThemeColors.surfaceSecondary,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: DarkThemeColors.textPrimary,
      ),

      // AppBar theme for dark mode
      appBarTheme: const AppBarTheme(
        backgroundColor: DarkThemeColors.backgroundPrimary,
        foregroundColor: DarkThemeColors.textPrimary,
        elevation: 0,
        shadowColor: DarkThemeColors.shadowLight,
        titleTextStyle: TextStyle(
          color: DarkThemeColors.textPrimary,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        iconTheme: IconThemeData(
          color: DarkThemeColors.textPrimary,
          size: AppConstants.iconSizeMd,
        ),
      ),

      // Card theme for dark mode
      cardTheme: const CardThemeData(
        color: DarkThemeColors.surfacePrimary,
        elevation: AppConstants.cardElevation,
        shadowColor: DarkThemeColors.shadowMedium,
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.lg,
        ),
        margin: EdgeInsets.zero,
      ),

      // Elevated button theme for dark mode
      elevatedButtonTheme: const ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(AppConstants.primaryColor),
          foregroundColor: WidgetStatePropertyAll(Colors.white),
          elevation: WidgetStatePropertyAll(0.0),
          padding: WidgetStatePropertyAll(AppPadding.verticalMd),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: AppRadius.md,
            ),
          ),
          textStyle: WidgetStatePropertyAll(AppTextStyles.button),
        ),
      ),

      // Outlined button theme for dark mode
      outlinedButtonTheme: const OutlinedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStatePropertyAll(DarkThemeColors.textPrimary),
          side: WidgetStatePropertyAll(BorderSide(color: DarkThemeColors.borderMedium)),
          padding: WidgetStatePropertyAll(AppPadding.verticalMd),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: AppRadius.md,
            ),
          ),
          textStyle: WidgetStatePropertyAll(AppTextStyles.button),
        ),
      ),

      // Text button theme for dark mode
      textButtonTheme: const TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStatePropertyAll(AppConstants.primaryColor),
          padding: WidgetStatePropertyAll(AppPadding.verticalMd),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: AppRadius.md,
            ),
          ),
          textStyle: WidgetStatePropertyAll(AppTextStyles.button),
        ),
      ),

      // Input decoration theme for dark mode
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        fillColor: DarkThemeColors.surfaceSecondary,
        contentPadding: AppPadding.md,
        border: OutlineInputBorder(
          borderRadius: AppRadius.md,
          borderSide: BorderSide(color: DarkThemeColors.borderLight),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: AppRadius.md,
          borderSide: BorderSide(color: DarkThemeColors.borderLight),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppRadius.md,
          borderSide: BorderSide(
            color: AppConstants.primaryColor,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: AppRadius.md,
          borderSide: BorderSide(color: AppConstants.errorColor),
        ),
        labelStyle: TextStyle(color: DarkThemeColors.textSecondary),
        hintStyle: TextStyle(color: DarkThemeColors.textMuted),
      ),

      // Text theme for dark mode
      textTheme: TextTheme(
        displayLarge: AppTextStyles.h1.copyWith(color: DarkThemeColors.textPrimary),
        displayMedium: AppTextStyles.h2.copyWith(color: DarkThemeColors.textPrimary),
        displaySmall: AppTextStyles.h3.copyWith(color: DarkThemeColors.textPrimary),
        headlineMedium: AppTextStyles.h3.copyWith(color: DarkThemeColors.textPrimary),
        headlineSmall: const TextStyle(
          color: DarkThemeColors.textPrimary,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        titleLarge: AppTextStyles.h3.copyWith(color: DarkThemeColors.textPrimary),
        titleMedium: AppTextStyles.bodyLarge.copyWith(
          fontWeight: FontWeight.w600,
          color: DarkThemeColors.textPrimary,
        ),
        titleSmall: AppTextStyles.bodyMedium.copyWith(
          fontWeight: FontWeight.w600,
          color: DarkThemeColors.textPrimary,
        ),
        bodyLarge: AppTextStyles.bodyLarge.copyWith(color: DarkThemeColors.textPrimary),
        bodyMedium: AppTextStyles.bodyMedium.copyWith(color: DarkThemeColors.textPrimary),
        bodySmall: AppTextStyles.bodySmall.copyWith(color: DarkThemeColors.textSecondary),
        labelLarge: AppTextStyles.button,
        labelSmall: AppTextStyles.caption.copyWith(color: DarkThemeColors.textMuted),
      ),

      // Navigation bar theme for dark mode
      navigationBarTheme: const NavigationBarThemeData(
        backgroundColor: DarkThemeColors.backgroundPrimary,
        indicatorColor: AppConstants.primaryColor,
        labelTextStyle: WidgetStatePropertyAll(AppTextStyles.caption),
        iconTheme: WidgetStatePropertyAll(
          IconThemeData(size: AppConstants.iconSizeMd),
        ),
      ),

      // Bottom navigation bar theme for dark mode
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: DarkThemeColors.backgroundPrimary,
        selectedItemColor: AppConstants.primaryColor,
        unselectedItemColor: DarkThemeColors.textSecondary,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
    );
  }
}

/// Theme extensions for additional colors
extension AppThemeColors on ThemeData {
  Color get primaryColor => const Color(0xFFD93F34);
  Color get secondaryColor => const Color(0xFF2563EB);
  Color get successColor => const Color(0xFF22C55E);
  Color get warningColor => const Color(0xFFF59E0B);
  Color get errorColor => const Color(0xFFEF4444);
  Color get infoColor => const Color(0xFF06B6D4);

  Color get textPrimary => const Color(0xFF111827);
  Color get textSecondary => const Color(0xFF6B7280);
  Color get textMuted => const Color(0xFF9CA3AF);

  Color get backgroundPrimary => Colors.white;
  Color get backgroundSecondary => const Color(0xFFF9FAFB);
  Color get backgroundTertiary => const Color(0xFFF3F4F6);

  Color get borderLight => const Color(0xFFE5E7EB);
  Color get borderMedium => const Color(0xFFD1D5DB);
}
