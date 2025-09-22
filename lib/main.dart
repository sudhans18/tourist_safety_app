import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart' as mapbox;

import 'firebase_options.dart';
import 'package:tourist_safety_app/core/providers/settings_provider.dart';
import 'package:tourist_safety_app/core/providers/user_provider.dart';
import 'package:tourist_safety_app/l10n/app_localizations.dart';
import 'features/onboarding/screens/onboarding_verification_screen.dart';
import 'features/kyc/screens/kyc_verification_screen.dart';
import 'features/id/screens/id_qr_screen.dart';
import 'features/band_integration/screens/band_pairing_screen.dart';
import 'features/dashboard/screens/dashboard_screen.dart';
import 'features/dashboard/screens/live_vitals_screen.dart';
import 'features/dashboard/screens/tour_plan_screen.dart';
import 'features/dashboard/screens/add_new_trip_screen.dart';
import 'features/attractions/screens/nearby_attractions_screen.dart';
import 'features/weather/screens/weather_screen.dart';
import 'features/sos/screens/sos_mode_screen.dart';
import 'features/family/screens/family_screen.dart';
import 'features/alerts/screens/alerts_screen.dart';
import 'features/profile/screens/profile_screen.dart';
import 'features/zones/providers/geofence_provider.dart';
import 'features/zones/screens/map_fullscreen_screen.dart';
import 'core/providers/trip_provider.dart';

void _initializeMapbox() {
  try {
    // Load the token from the .env file
    mapbox.MapboxOptions.setAccessToken(dotenv.env['MAPBOX_PUBLIC_TOKEN']!);
  } catch (e) {
    debugPrint('Failed to initialize Mapbox: $e');
  }
}

Future<void> main() async {
  await dotenv.load(fileName: ".env");

  _initializeMapbox();

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // App now starts at combined onboarding screen; authentication is mocked for MVP.

  runApp(const MyApp(
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TripProvider()),
        ChangeNotifierProvider(create: (_) => GeofenceProvider()..init()),
        ChangeNotifierProvider(create: (_) => SettingsProvider()..load()),
        // Initialize with document ID for MVP
        ChangeNotifierProvider(
          create: (_) => UserProvider()
            ..initialize(
              documentId: 'LoFJIhJzHSLwajqZqHdv',
            ),
        ),
      ],
      child: Builder(
        builder: (context) => MaterialApp(
          title: 'Tourist Safety App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: const Color(0xFFF3F4F6),
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xFFD93F34),
              primary: const Color(0xFFD93F34),
              secondary: const Color(0xFFFEEBEA),
              surface: Colors.white,
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
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
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xFFD93F34),
              brightness: Brightness.dark,
            ),
            useMaterial3: true,
          ),
          themeMode: context.watch<SettingsProvider>().themeMode,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          locale: context.watch<SettingsProvider>().locale,
          initialRoute: initialRoute,
          routes: {
            '/': (context) => const OnboardingVerificationScreen(),
            '/kyc': (context) => const KycVerificationScreen(),
            '/id-qr': (context) => const IdQrScreen(),
            '/band-pairing': (context) => const BandPairingScreen(),
            '/dashboard': (context) => const DashboardScreen(),
            '/live-vitals': (context) => const LiveVitalsScreen(),
            '/tour-plan': (context) => const TourPlanScreen(),
            '/add-new-trip': (context) => const AddNewTripScreen(),
            '/nearby-attractions': (context) => const NearbyAttractionsScreen(),
            '/weather': (context) => const WeatherScreen(),
            '/sos': (context) => const SosModeScreen(),
            '/family': (context) => const FamilyScreen(),
            '/alerts': (context) => const AlertsScreen(),
            '/profile': (context) => const ProfileScreen(),
            '/map-fullscreen': (context) => const MapFullscreenScreen(),
          },
        ),
      ),
    );
  }
}
