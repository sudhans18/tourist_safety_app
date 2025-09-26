import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourist_safety_app/features/zones/models/risk_zone.dart';

/// Provider responsible for managing zone data from Firestore and caching
class ZoneDataProvider extends ChangeNotifier {
  static const String _cacheKey = 'risk_zones_cache';

  final List<RiskZone> _zones = [];
  bool _isLoading = false;
  String? _error;
  StreamSubscription<QuerySnapshot<Map<String, dynamic>>>? _firestoreSubscription;

  List<RiskZone> get zones => List.unmodifiable(_zones);
  bool get isLoading => _isLoading;
  String? get error => _error;

  CollectionReference<Map<String, dynamic>> get _riskZonesCol =>
      FirebaseFirestore.instance.collection('risk_zones');

  Future<void> loadZones() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      await _loadZonesFromCache();
      await _startFirestoreListener();
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = 'Error loading zones: $e';
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> _loadZonesFromCache() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final raw = prefs.getString(_cacheKey);
      if (raw == null) return;

      final list = (jsonDecode(raw) as List).cast<Map<String, dynamic>>();
      _zones
        ..clear()
        ..addAll(list.map((m) => RiskZone.fromMap(m['id'] as String, m['data'] as Map<String, dynamic>)));
    } catch (e) {
      // Ignore cache errors
      debugPrint('Cache loading error: $e');
    }
  }

  Future<void> _saveZonesToCache() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final data = _zones.map((z) => {'id': z.id, 'data': z.toMap()}).toList();
      await prefs.setString(_cacheKey, jsonEncode(data));
    } catch (e) {
      debugPrint('Cache saving error: $e');
    }
  }

  Future<void> _startFirestoreListener() async {
    _firestoreSubscription?.cancel();

    _firestoreSubscription = _riskZonesCol.snapshots().listen((snapshot) async {
      final newZones = <RiskZone>[];
      for (final doc in snapshot.docs) {
        final data = doc.data();
        newZones.add(RiskZone.fromMap(doc.id, data));
      }

      _zones
        ..clear()
        ..addAll(newZones);

      await _saveZonesToCache();
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _firestoreSubscription?.cancel();
    super.dispose();
  }
}
