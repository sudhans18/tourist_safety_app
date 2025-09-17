# 🚀 Smart Tourist Safety Monitoring System

[![Flutter](https://img.shields.io/badge/Flutter-3.16.9-blue.svg)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/Dart-3.2.3-blue.svg)](https://dart.dev/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A comprehensive mobile application designed to enhance tourist safety through real-time monitoring, emergency alerts, and location-based services. The app integrates with wearable devices to provide a complete safety solution for travelers.

## 🌟 Features

- **🔐 Secure Authentication**: Phone number verification for secure access
- **🌍 Multi-language Support**: English and Hindi support with easy language switching
- **📍 Real-time Location Tracking**: Continuous GPS tracking with optimized battery usage
- **🆘 Emergency SOS**: One-tap emergency alerts with location sharing
- **⌚ Smart Band Integration**: Connect with wearable devices for health monitoring
- **🚧 Geo-fencing**: Customizable safe/unsafe zone alerts
- **📊 Safety Analytics**: View safety statistics and incident reports
- **📱 Offline Support**: Critical features work without internet connection
- **🔔 Push Notifications**: Real-time safety alerts and updates

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (>=3.2.3)
- Dart SDK (>=3.2.3)
- Android Studio / Xcode (for mobile development)
- Firebase account (for backend services)
- Mapbox API key (for maps and navigation)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/smart-tourist-safety-app.git
   cd smart-tourist-safety-app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Configure Firebase**
   - Create a new Firebase project at [Firebase Console](https://console.firebase.google.com/)
   - Add Android and iOS apps to your Firebase project
   - Download and add the configuration files:
     - Android: `android/app/google-services.json`
     - iOS: `ios/Runner/GoogleService-Info.plist`

4. **Set up Mapbox**
   - Get your Mapbox access token from [Mapbox](https://account.mapbox.com/)
   - Update the token in `android/app/src/main/AndroidManifest.xml` and `ios/Runner/Info.plist`

5. **Run the app**
   ```bash
   flutter run
   ```

## 🛠 Project Structure

```
lib/
├── core/                 # Core functionality and utilities
├── features/             # Feature modules
│   ├── alerts/          # Emergency alerts and notifications
│   ├── auth/            # Authentication flows
│   ├── dashboard/       # Main dashboard and navigation
│   ├── location/        # Location services and tracking
│   └── settings/        # User settings and preferences
├── l10n/                # Localization files
└── utils/               # Helper classes and utilities
```

## 🧪 Testing

Run tests using the following commands:

```bash
# Run all tests
flutter test

# Run integration tests
flutter test integration_test/
```

## 📦 Dependencies

- **State Management**: Provider
- **Maps & Location**: google_maps_flutter, mapbox_maps_flutter, geolocator
- **Authentication**: firebase_auth
- **Bluetooth**: flutter_blue_plus
- **Local Storage**: shared_preferences
- **Internationalization**: intl

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Firebase for backend services
- Mapbox for mapping solutions
- All open-source contributors

## 🤝 Contributing

Contributions are welcome! Please read our [contributing guidelines](CONTRIBUTING.md) before submitting pull requests.

## 📬 Contact

For any queries or support, please contact [your-email@example.com](mailto:your-email@example.com)
