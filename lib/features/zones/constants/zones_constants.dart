/// Constants for the zones feature
class ZonesConstants {
  // Location update intervals
  static const Duration locationUpdateInterval = Duration(seconds: 10);
  static const Duration debounceInterval = Duration(seconds: 6);

  // Location settings
  static const double defaultBufferMeters = 20.0;
  static const double locationDistanceFilter = 5.0;

  // Map settings
  static const double defaultMapZoom = 13.0;
  static const double detailedMapZoom = 15.0;
  static const double fullscreenMapZoom = 16.0;
  static const double mapAnimationDuration = 1000.0; // milliseconds

  // UI settings
  static const double miniMapHeight = 220.0;
  static const double searchResultHeight = 150.0;
  static const int maxSearchResults = 5;
  static const int minSearchQueryLength = 2;

  // Cache settings
  static const String zonesCacheKey = 'risk_zones_cache';

  // Risk level colors (as integers for Mapbox)
  static const int restrictedColor = 0xFFEF4444; // red
  static const int highRiskColor = 0xFFF59E0B;   // orange
  static const int mediumRiskColor = 0xFFFBBF24; // amber
  static const int lowRiskColor = 0xFF22C55E;    // green

  // Map padding
  static const double zoneFitPadding = 32.0;
  static const double defaultMapPadding = 24.0;

  // Circle polygon generation
  static const int defaultCircleSteps = 64;
  static const double degreesPerMeterLat = 1 / 111320.0;
}
