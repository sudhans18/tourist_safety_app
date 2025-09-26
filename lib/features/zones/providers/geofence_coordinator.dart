import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart' as geo;
import 'package:tourist_safety_app/features/zones/models/alert.dart';
import 'package:tourist_safety_app/features/zones/models/risk_zone.dart';
import 'package:tourist_safety_app/features/zones/providers/location_provider.dart';
import 'package:tourist_safety_app/features/zones/providers/zone_data_provider.dart';

/// Coordinates between location and zone data to provide geofencing functionality
class GeofenceProvider extends ChangeNotifier {
  static const Duration debounceInterval = Duration(seconds: 6);

  final LocationProvider _locationProvider;
  final ZoneDataProvider _zoneDataProvider;
  final double bufferMeters;

  final List<ZoneAlert> _alerts = [];
  final Set<String> _insideZoneIds = {};
  DateTime _lastChangeAt = DateTime.fromMillisecondsSinceEpoch(0);

  StreamSubscription? _locationSubscription;
  StreamSubscription? _zonesSubscription;

  GeofenceProvider({
    required LocationProvider locationProvider,
    required ZoneDataProvider zoneDataProvider,
    this.bufferMeters = 20,
  })  : _locationProvider = locationProvider,
        _zoneDataProvider = zoneDataProvider;

  List<RiskZone> get zones => _zoneDataProvider.zones;
  geo.Position? get lastPosition => _locationProvider.lastPosition;
  bool get hasLocation => _locationProvider.hasLocation;
  Set<String> get insideZoneIds => Set.unmodifiable(_insideZoneIds);
  List<ZoneAlert> get alerts => List.unmodifiable(_alerts);
  bool get isLoading => _locationProvider.isLoading || _zoneDataProvider.isLoading;
  String? get error => _locationProvider.error ?? _zoneDataProvider.error;

  Future<void> initialize() async {
    // Listen to location changes
    _locationProvider.addListener(() {
      _handleLocationChange();
    });

    // Listen to zone data changes
    _zoneDataProvider.addListener(() {
      _handleZonesChange();
    });

    // Load initial data
    await _zoneDataProvider.loadZones();
    await _locationProvider.startLocationUpdates();
  }

  void _handleLocationChange() {
    final position = _locationProvider.lastPosition;
    if (position != null) {
      _recomputeInsideZones();
    }
    notifyListeners();
  }

  void _handleZonesChange() {
    _recomputeInsideZones();
    notifyListeners();
  }

  void _recomputeInsideZones() {
    final position = _locationProvider.lastPosition;
    if (position == null) return;

    final now = DateTime.now();
    if (now.difference(_lastChangeAt) < debounceInterval) return;

    final entering = <String>{};
    final leaving = <String>{};
    final newInside = <String>{};

    for (final zone in _zoneDataProvider.zones) {
      if (zone.contains(position, bufferMeters: bufferMeters)) {
        newInside.add(zone.id);
      }
    }

    entering.addAll(newInside.difference(_insideZoneIds));
    leaving.addAll(_insideZoneIds.difference(newInside));

    if (entering.isEmpty && leaving.isEmpty) return;

    _insideZoneIds
      ..clear()
      ..addAll(newInside);
    _lastChangeAt = now;

    for (final id in entering) {
      final zone = _zoneDataProvider.zones.firstWhere((z) => z.id == id);
      _alerts.add(ZoneAlert(
        zoneId: id,
        zoneName: zone.name,
        type: AlertType.enter,
        timestamp: now,
      ));
    }

    for (final id in leaving) {
      final zone = _zoneDataProvider.zones.firstWhere((z) => z.id == id);
      _alerts.add(ZoneAlert(
        zoneId: id,
        zoneName: zone.name,
        type: AlertType.exit,
        timestamp: now,
      ));
    }
  }

  Future<void> attachMap(dynamic map) async {
    // Map attachment logic will be handled by the map service
    // This method is kept for compatibility
  }

  @override
  void dispose() {
    _locationSubscription?.cancel();
    _zonesSubscription?.cancel();
    super.dispose();
  }
}
