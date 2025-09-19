import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart' as geo;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourist_safety_app/features/zones/models/alert.dart';
import 'package:tourist_safety_app/features/zones/models/risk_zone.dart';
import 'package:tourist_safety_app/features/zones/services/mapbox_geofence_service.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

class GeofenceProvider extends ChangeNotifier {
  // Config
  static const Duration foregroundUpdate = Duration(seconds: 10);
  static const Duration debounce = Duration(seconds: 6);
  final double bufferMeters;

  GeofenceProvider({this.bufferMeters = 20});

  // State
  final List<RiskZone> _zones = [];
  geo.Position? _lastPosition;
  DateTime _lastChangeAt = DateTime.fromMillisecondsSinceEpoch(0);
  final Set<String> _insideZoneIds = {};
  final List<ZoneAlert> _alerts = [];

  // Map service
  MapboxGeoFenceService? _mapService;

  List<RiskZone> get zones => List.unmodifiable(_zones);
  geo.Position? get lastPosition => _lastPosition;
  bool get hasLocation => _lastPosition != null;
  Set<String> get insideZoneIds => Set.unmodifiable(_insideZoneIds);
  List<ZoneAlert> get alerts => List.unmodifiable(_alerts);

  StreamSubscription<geo.Position>? _posSub;
  Timer? _throttle;

  // Firestore collection
  CollectionReference<Map<String, dynamic>> get _riskZonesCol =>
      FirebaseFirestore.instance.collection('risk_zones');

  Future<void> attachMap(MapboxMap map) async {
    _mapService = MapboxGeoFenceService(map);
    await _mapService!.init();
    await _mapService!.setZones(_zones);
    if (_zones.isNotEmpty) {
      unawaited(_mapService!.fitToZones(_zones, padding: 24));
    }
  }

  Future<void> init() async {
    await _ensurePermissions();
    await _loadZonesFromCache();
    unawaited(_watchFirestore());
    await _startLocationUpdates();
  }

  Future<void> disposeStreams() async {
    await _posSub?.cancel();
    _throttle?.cancel();
  }

  Future<void> _ensurePermissions() async {
    final bool serviceEnabled = await geo.Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // best-effort: cannot enable programmatically
    }

    geo.LocationPermission permission = await geo.Geolocator.checkPermission();
    if (permission == geo.LocationPermission.denied) {
      permission = await geo.Geolocator.requestPermission();
      if (permission == geo.LocationPermission.denied) {
        throw Exception('Location permissions are denied');
      }
    }
  }

  Future<void> _loadZonesFromCache() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString('risk_zones_cache');
    if (raw == null) return;
    try {
      final list = (jsonDecode(raw) as List).cast<Map<String, dynamic>>();
      _zones
        ..clear()
        ..addAll(list.map((m) => RiskZone.fromMap(m['id'] as String, m['data'] as Map<String, dynamic>)));
      notifyListeners();
    } catch (_) {
      // ignore cache errors
    }
  }

  Future<void> _saveZonesToCache() async {
    final prefs = await SharedPreferences.getInstance();
    final data = _zones.map((z) => {'id': z.id, 'data': z.toMap()}).toList();
    await prefs.setString('risk_zones_cache', jsonEncode(data));
  }

  Future<void> _watchFirestore() async {
    _riskZonesCol.snapshots(includeMetadataChanges: true).listen((snap) async {
      final newZones = <RiskZone>[];
      for (final doc in snap.docs) {
        final data = doc.data();
        newZones.add(RiskZone.fromMap(doc.id, data));
      }
      _zones
        ..clear()
        ..addAll(newZones);
      await _saveZonesToCache();
      notifyListeners();
      if (_mapService != null) {
        await _mapService!.setZones(_zones);
      }
      _recomputeInsideZones();
    });
  }

  Future<void> _startLocationUpdates() async {
    _posSub?.cancel();

    const geo.LocationSettings settings = geo.LocationSettings(
      accuracy: geo.LocationAccuracy.best,
      distanceFilter: 5,
      timeLimit: null,
    );

    _posSub = geo.Geolocator.getPositionStream(locationSettings: settings).listen((pos) {
      _throttle?.cancel();
      _throttle = Timer(foregroundUpdate, () {
        _handleNewPosition(pos);
      });
    });

    try {
      final pos = await geo.Geolocator.getCurrentPosition(
        desiredAccuracy: geo.LocationAccuracy.best,
      ).onError((error, stackTrace) {
        debugPrint('Error getting current position: $error');
        return Future.error(error!);
      });
      _handleNewPosition(pos);
    } catch (_) {}
  }

  void _handleNewPosition(geo.Position pos) {
    _lastPosition = pos;
    notifyListeners();
    _recomputeInsideZones();
  }

  void _recomputeInsideZones() {
    final pos = _lastPosition;
    if (pos == null) return;

    final now = DateTime.now();
    if (now.difference(_lastChangeAt) < debounce) return;

    final entering = <String>{};
    final leaving = <String>{};
    final newInside = <String>{};

    for (final z in _zones) {
      if (z.contains(pos, bufferMeters: bufferMeters)) {
        newInside.add(z.id);
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
      final z = _zones.firstWhere((e) => e.id == id);
      _alerts.add(ZoneAlert(
        zoneId: id,
        zoneName: z.name,
        type: AlertType.enter,
        timestamp: now,
      ));
    }
    for (final id in leaving) {
      final z = _zones.firstWhere((e) => e.id == id);
      _alerts.add(ZoneAlert(
        zoneId: id,
        zoneName: z.name,
        type: AlertType.exit,
        timestamp: now,
      ));
    }

    notifyListeners();
  }
}