import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart' as geo;

/// Provider responsible for managing device location permissions and updates
class LocationProvider extends ChangeNotifier {
  static const Duration updateInterval = Duration(seconds: 10);
  static const Duration debounceInterval = Duration(seconds: 6);

  geo.Position? _lastPosition;
  bool _isLoading = false;
  String? _error;
  StreamSubscription<geo.Position>? _positionSubscription;
  Timer? _debounceTimer;

  geo.Position? get lastPosition => _lastPosition;
  bool get hasLocation => _lastPosition != null;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<bool> requestPermissions() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final bool serviceEnabled = await geo.Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        _error = 'Location services are disabled';
        return false;
      }

      geo.LocationPermission permission = await geo.Geolocator.checkPermission();
      if (permission == geo.LocationPermission.denied) {
        permission = await geo.Geolocator.requestPermission();
        if (permission == geo.LocationPermission.denied) {
          _error = 'Location permissions are denied';
          return false;
        }
      }

      if (permission == geo.LocationPermission.deniedForever) {
        _error = 'Location permissions are permanently denied';
        return false;
      }

      return true;
    } catch (e) {
      _error = 'Error requesting location permissions: $e';
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> startLocationUpdates() async {
    if (!await requestPermissions()) {
      return;
    }

    _positionSubscription?.cancel();
    _debounceTimer?.cancel();

    const geo.LocationSettings settings = geo.LocationSettings(
      accuracy: geo.LocationAccuracy.best,
      distanceFilter: 5,
      timeLimit: null,
    );

    _positionSubscription = geo.Geolocator.getPositionStream(
      locationSettings: settings
    ).listen((position) {
      _debounceTimer?.cancel();
      _debounceTimer = Timer(debounceInterval, () {
        _handleNewPosition(position);
      });
    });

    try {
      final position = await geo.Geolocator.getCurrentPosition(
        desiredAccuracy: geo.LocationAccuracy.best,
      );
      _handleNewPosition(position);
    } catch (e) {
      _error = 'Error getting current position: $e';
      notifyListeners();
    }
  }

  void _handleNewPosition(geo.Position position) {
    _lastPosition = position;
    notifyListeners();
  }

  Future<void> stopLocationUpdates() async {
    _positionSubscription?.cancel();
    _debounceTimer?.cancel();
    _positionSubscription = null;
    _debounceTimer = null;
  }

  @override
  void dispose() {
    stopLocationUpdates();
    super.dispose();
  }
}
