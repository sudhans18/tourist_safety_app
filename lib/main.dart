import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'firebase_options.dart';
import 'features/onboarding/screens/onboarding_verification_screen.dart';
import 'features/kyc/screens/kyc_verification_screen.dart';
import 'features/id/screens/id_qr_screen.dart';
import 'features/band_integration/screens/band_pairing_screen.dart';
import 'features/dashboard/screens/dashboard_screen.dart';
import 'features/sos/screens/sos_mode_screen.dart';
import 'features/family/screens/family_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  // App now starts at combined onboarding screen; authentication is mocked for MVP.

  runApp(MyApp(
    initialRoute: '/',
  ));
}

class MyApp extends StatelessWidget {
  final String initialRoute;

  const MyApp({
    Key? key,
    required this.initialRoute,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tourist Safety App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFD93F34),
          primary: const Color(0xFFD93F34),
          secondary: const Color(0xFFFEEBEA),
          surface: Colors.white,
          background: const Color(0xFFF3F4F6),
        ).copyWith(
          error: const Color(0xFFD93F34),
        ),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Color(0xFF111827),
          elevation: 0,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFD93F34),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(color: Color(0xFFD1D5DB)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(color: Color(0xFFD1D5DB)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(color: Color(0xFFD93F34), width: 2),
          ),
        ),
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English
        Locale('hi', ''), // Hindi
      ],
      initialRoute: initialRoute,
      routes: {
        '/': (context) => const OnboardingVerificationScreen(),
        '/kyc': (context) => const KycVerificationScreen(),
        '/id-qr': (context) => const IdQrScreen(),
        '/band-pairing': (context) => const BandPairingScreen(),
        '/dashboard': (context) => const DashboardScreen(),
        '/sos': (context) => const SosModeScreen(),
        '/family': (context) => const FamilyScreen(),
      },
    );
  }
}

