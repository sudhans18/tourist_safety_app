import 'package:flutter/material.dart';

class ModernColors {
  // Primary brand colors
  static const Color primaryRed = Color(0xFFE14B4B);
  static const Color primaryRedLight = Color(0xFFFF6B6B);
  static const Color primaryRedDark = Color(0xFFD93F34);
  
  // Gradient colors
  static const List<Color> primaryGradient = [
    Color(0xFFFF6B6B),
    Color(0xFFE14B4B),
    Color(0xFFD93F34),
  ];
  
  static const List<Color> successGradient = [
    Color(0xFF4ADE80),
    Color(0xFF22C55E),
    Color(0xFF16A34A),
  ];
  
  static const List<Color> warningGradient = [
    Color(0xFFFBBF24),
    Color(0xFFF59E0B),
    Color(0xFFD97706),
  ];
  
  static const List<Color> infoGradient = [
    Color(0xFF60A5FA),
    Color(0xFF3B82F6),
    Color(0xFF2563EB),
  ];
  
  // Glass morphism colors
  static const Color glassWhite = Color(0xFFFFFFFF);
  static const Color glassBlack = Color(0xFF000000);
  
  // Background gradients
  static const List<Color> backgroundGradient = [
    Color(0xFFF8FAFC),
    Color(0xFFE2E8F0),
  ];
  
  static const List<Color> darkBackgroundGradient = [
    Color(0xFF0F172A),
    Color(0xFF1E293B),
  ];
  
  // Neutral colors
  static const Color neutral50 = Color(0xFFF8FAFC);
  static const Color neutral100 = Color(0xFFF1F5F9);
  static const Color neutral200 = Color(0xFFE2E8F0);
  static const Color neutral300 = Color(0xFFCBD5E1);
  static const Color neutral400 = Color(0xFF94A3B8);
  static const Color neutral500 = Color(0xFF64748B);
  static const Color neutral600 = Color(0xFF475569);
  static const Color neutral700 = Color(0xFF334155);
  static const Color neutral800 = Color(0xFF1E293B);
  static const Color neutral900 = Color(0xFF0F172A);
  
  // Status colors
  static const Color success = Color(0xFF22C55E);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);
  static const Color info = Color(0xFF3B82F6);
}

class ModernShadows {
  static const List<BoxShadow> small = [
    BoxShadow(
      color: Color(0x0F000000),
      blurRadius: 4,
      offset: Offset(0, 1),
    ),
  ];
  
  static const List<BoxShadow> medium = [
    BoxShadow(
      color: Color(0x14000000),
      blurRadius: 12,
      offset: Offset(0, 4),
    ),
  ];
  
  static const List<BoxShadow> large = [
    BoxShadow(
      color: Color(0x19000000),
      blurRadius: 20,
      offset: Offset(0, 10),
    ),
  ];
  
  static const List<BoxShadow> extraLarge = [
    BoxShadow(
      color: Color(0x1F000000),
      blurRadius: 32,
      offset: Offset(0, 16),
    ),
  ];
  
  // Colored shadows
  static List<BoxShadow> colored(Color color, {double opacity = 0.3}) => [
    BoxShadow(
      color: color.withValues(alpha: opacity),
      blurRadius: 20,
      offset: const Offset(0, 8),
    ),
  ];
}

class ModernBorderRadius {
  static const BorderRadius small = BorderRadius.all(Radius.circular(8));
  static const BorderRadius medium = BorderRadius.all(Radius.circular(12));
  static const BorderRadius large = BorderRadius.all(Radius.circular(16));
  static const BorderRadius extraLarge = BorderRadius.all(Radius.circular(24));
  static const BorderRadius full = BorderRadius.all(Radius.circular(9999));
}

class ModernSpacing {
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 20;
  static const double xxl = 24;
  static const double xxxl = 32;
}

class ModernTextStyles {
  static const TextStyle displayLarge = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w800,
    letterSpacing: -0.5,
    height: 1.2,
  );
  
  static const TextStyle displayMedium = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.25,
    height: 1.3,
  );
  
  static const TextStyle displaySmall = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    height: 1.3,
  );
  
  static const TextStyle headlineLarge = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 1.4,
  );
  
  static const TextStyle headlineMedium = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    height: 1.4,
  );
  
  static const TextStyle headlineSmall = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.4,
  );
  
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );
  
  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );
  
  static const TextStyle bodySmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.4,
  );
  
  static const TextStyle labelLarge = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.4,
  );
  
  static const TextStyle labelMedium = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.4,
  );
  
  static const TextStyle labelSmall = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    height: 1.4,
  );
}

class ModernTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: ModernColors.primaryRed,
        brightness: Brightness.light,
      ),
      scaffoldBackgroundColor: ModernColors.neutral50,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: ModernColors.neutral900,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        iconTheme: IconThemeData(color: ModernColors.neutral700),
      ),
      cardTheme: const CardThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: ModernBorderRadius.large,
        ),
        color: Colors.white,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: ModernColors.primaryRed,
          foregroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: const RoundedRectangleBorder(
            borderRadius: ModernBorderRadius.medium,
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: ModernColors.primaryRed,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          shape: const RoundedRectangleBorder(
            borderRadius: ModernBorderRadius.medium,
          ),
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: ModernColors.primaryRed,
          side: const BorderSide(color: ModernColors.primaryRed),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: const RoundedRectangleBorder(
            borderRadius: ModernBorderRadius.medium,
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: ModernBorderRadius.medium,
          borderSide: BorderSide(color: ModernColors.neutral300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: ModernBorderRadius.medium,
          borderSide: BorderSide(color: ModernColors.neutral300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: ModernBorderRadius.medium,
          borderSide: BorderSide(color: ModernColors.primaryRed, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: ModernBorderRadius.medium,
          borderSide: BorderSide(color: ModernColors.error),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: ModernColors.primaryRed,
        unselectedItemColor: ModernColors.neutral400,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
      textTheme: const TextTheme(
        displayLarge: ModernTextStyles.displayLarge,
        displayMedium: ModernTextStyles.displayMedium,
        displaySmall: ModernTextStyles.displaySmall,
        headlineLarge: ModernTextStyles.headlineLarge,
        headlineMedium: ModernTextStyles.headlineMedium,
        headlineSmall: ModernTextStyles.headlineSmall,
        bodyLarge: ModernTextStyles.bodyLarge,
        bodyMedium: ModernTextStyles.bodyMedium,
        bodySmall: ModernTextStyles.bodySmall,
        labelLarge: ModernTextStyles.labelLarge,
        labelMedium: ModernTextStyles.labelMedium,
        labelSmall: ModernTextStyles.labelSmall,
      ),
    );
  }
  
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: ModernColors.primaryRed,
        brightness: Brightness.dark,
      ),
      scaffoldBackgroundColor: ModernColors.neutral900,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        iconTheme: IconThemeData(color: ModernColors.neutral300),
      ),
      cardTheme: const CardThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: ModernBorderRadius.large,
        ),
        color: ModernColors.neutral800,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: ModernColors.primaryRed,
          foregroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: const RoundedRectangleBorder(
            borderRadius: ModernBorderRadius.medium,
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: ModernColors.primaryRedLight,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          shape: const RoundedRectangleBorder(
            borderRadius: ModernBorderRadius.medium,
          ),
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: ModernColors.primaryRedLight,
          side: const BorderSide(color: ModernColors.primaryRedLight),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: const RoundedRectangleBorder(
            borderRadius: ModernBorderRadius.medium,
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        fillColor: ModernColors.neutral800,
        border: OutlineInputBorder(
          borderRadius: ModernBorderRadius.medium,
          borderSide: BorderSide(color: ModernColors.neutral600),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: ModernBorderRadius.medium,
          borderSide: BorderSide(color: ModernColors.neutral600),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: ModernBorderRadius.medium,
          borderSide: BorderSide(color: ModernColors.primaryRed, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: ModernBorderRadius.medium,
          borderSide: BorderSide(color: ModernColors.error),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: ModernColors.neutral800,
        selectedItemColor: ModernColors.primaryRedLight,
        unselectedItemColor: ModernColors.neutral400,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
      textTheme: const TextTheme(
        displayLarge: ModernTextStyles.displayLarge,
        displayMedium: ModernTextStyles.displayMedium,
        displaySmall: ModernTextStyles.displaySmall,
        headlineLarge: ModernTextStyles.headlineLarge,
        headlineMedium: ModernTextStyles.headlineMedium,
        headlineSmall: ModernTextStyles.headlineSmall,
        bodyLarge: ModernTextStyles.bodyLarge,
        bodyMedium: ModernTextStyles.bodyMedium,
        bodySmall: ModernTextStyles.bodySmall,
        labelLarge: ModernTextStyles.labelLarge,
        labelMedium: ModernTextStyles.labelMedium,
        labelSmall: ModernTextStyles.labelSmall,
      ),
    );
  }
}
