import 'dart:math' as math;

import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:tourist_safety_app/features/zones/models/risk_zone.dart';

/// Service responsible for rendering geofence zones on Mapbox and
/// providing helpers to manage sources/layers and viewport.
class MapboxGeoFenceService {
  final MapboxMap map;
  MapboxGeoFenceService(this.map);

  PolygonAnnotationManager? _polygonManager;

  Future<void> init() async {
    _polygonManager ??= await map.annotations.createPolygonAnnotationManager();
  }

  // Update zones into the GeoJSON source
  Future<void> setZones(List<RiskZone> zones) async {
    await init();
    final mgr = _polygonManager!;
    await mgr.deleteAll();

    for (final z in zones) {
      List<Position> ring;
      if (z.geometry.type == 'Polygon') {
        final rings = _convertPoly(z.geometry.coordinates);
        if (rings.isEmpty) continue;
        ring = rings.first;
      } else if (z.geometry.type == 'Point' && z.geometry.radiusMeters != null) {
        ring = _circleToPolygon(
          centerLng: (z.geometry.coordinates[0] as num).toDouble(),
          centerLat: (z.geometry.coordinates[1] as num).toDouble(),
          radiusMeters: z.geometry.radiusMeters!,
          steps: 64,
        );
      } else {
        continue;
      }

      final color = _colorByRisk(z.level);
      await mgr.create(PolygonAnnotationOptions(
        geometry: Polygon(coordinates: [ring]),
        fillColor: color,
        fillOpacity: 0.25,
        fillOutlineColor: color,
        // Some SDKs use lineColor/lineWidth; PolygonAnnotation uses outline color only
      ));
    }
  }

  // Fit camera to provided zones
  Future<void> fitToZones(List<RiskZone> zones, {double padding = 32}) async {
    if (zones.isEmpty) return;
    double? minLat, minLng, maxLat, maxLng;

    void extend(double lat, double lng) {
      minLat = (minLat == null) ? lat : math.min(minLat!, lat);
      minLng = (minLng == null) ? lng : math.min(minLng!, lng);
      maxLat = (maxLat == null) ? lat : math.max(maxLat!, lat);
      maxLng = (maxLng == null) ? lng : math.max(maxLng!, lng);
    }

    for (final z in zones) {
      if (z.geometry.type == 'Polygon') {
        final rings = z.geometry.coordinates;
        if (rings.isEmpty) continue;
        final outer = rings.first as List;
        for (final p in outer) {
          final lng = (p[0] as num).toDouble();
          final lat = (p[1] as num).toDouble();
          extend(lat, lng);
        }
      } else if (z.geometry.type == 'Point' && z.geometry.radiusMeters != null) {
        final lng = (z.geometry.coordinates[0] as num).toDouble();
        final lat = (z.geometry.coordinates[1] as num).toDouble();
        // extend roughly by radius (~meters to degrees)
        final d = z.geometry.radiusMeters! / 111320.0;
        extend(lat - d, lng - d);
        extend(lat + d, lng + d);
      }
    }

    if (minLat == null) return;

    final centerLat = (minLat! + maxLat!) / 2.0;
    final centerLng = (minLng! + maxLng!) / 2.0;

    await map.setCamera(CameraOptions(
      center: Point(coordinates: Position(centerLng, centerLat)),
      zoom: 12.5,
    ));
  }

  int _colorByRisk(RiskLevel level) {
    switch (level) {
      case RiskLevel.restricted:
        return 0xFFEF4444; // red
      case RiskLevel.high:
        return 0xFFF59E0B; // orange
      case RiskLevel.medium:
        return 0xFFFBBF24; // amber
      case RiskLevel.low:
        return 0xFF22C55E; // green
    }
  }

  List<List<Position>> _convertPoly(List<dynamic> coords) {
    // Converts [[[lng,lat],...]] to List<List<Position>> expected by PolygonAnnotationOptions.geometry
    return (coords)
        .map<List<Position>>((ring) => (ring as List)
            .map<Position>((p) => Position((p[0] as num).toDouble(), (p[1] as num).toDouble()))
            .toList())
        .toList();
  }

  List<Position> _circleToPolygon({
    required double centerLng,
    required double centerLat,
    required double radiusMeters,
    int steps = 64,
  }) {
    final result = <Position>[];
    // Convert meters to degrees latitude and longitude (approx)
    final latCirc = radiusMeters / 111320.0;
    final lngCirc = radiusMeters / (111320.0 * math.cos(centerLat * math.pi / 180));

    for (int i = 0; i <= steps; i++) {
      final theta = 2 * math.pi * (i / steps);
      final dx = lngCirc * math.cos(theta);
      final dy = latCirc * math.sin(theta);
      result.add(Position(centerLng + dx, centerLat + dy));
    }
    return result;
  }
}
