import 'dart:convert';

import 'package:geolocator/geolocator.dart';

/// Risk level for a zone
enum RiskLevel { low, medium, high, restricted }

RiskLevel riskLevelFromString(String s) {
  switch (s.toLowerCase()) {
    case 'low':
      return RiskLevel.low;
    case 'medium':
      return RiskLevel.medium;
    case 'high':
      return RiskLevel.high;
    case 'restricted':
      return RiskLevel.restricted;
    default:
      return RiskLevel.medium;
  }
}

String riskLevelToString(RiskLevel level) => level.name;

/// Simple GeoJSON geometry container.
/// Supports Polygon and Circle (as a Feature with properties {radiusMeters})
class GeoGeometry {
  final String type; // Polygon | Point
  final List<dynamic> coordinates; // For Polygon: List<List<List<double>>> ; For Point: [lng, lat]
  final double? radiusMeters; // Only for Circle (Point + radiusMeters)

  GeoGeometry({required this.type, required this.coordinates, this.radiusMeters});

  factory GeoGeometry.fromGeoJson(Map<String, dynamic> json) {
    if (json['type'] == 'Feature') {
      final geom = json['geometry'] as Map<String, dynamic>;
      final props = (json['properties'] ?? {}) as Map<String, dynamic>;
      return GeoGeometry(
        type: geom['type'],
        coordinates: geom['coordinates'],
        radiusMeters: (props['radiusMeters'] is num) ? (props['radiusMeters'] as num).toDouble() : null,
      );
    } else {
      return GeoGeometry(
        type: json['type'],
        coordinates: json['coordinates'],
      );
    }
  }

  Map<String, dynamic> toGeoJson() {
    if (radiusMeters != null && type == 'Point') {
      return {
        'type': 'Feature',
        'geometry': {'type': 'Point', 'coordinates': coordinates},
        'properties': {'radiusMeters': radiusMeters},
      };
    }
    return {'type': type, 'coordinates': coordinates};
  }
}

class RiskZone {
  final String id;
  final String name;
  final RiskLevel level;
  final GeoGeometry geometry; // Polygon or Circle (Point + radius)
  final DateTime updatedAt;

  RiskZone({
    required this.id,
    required this.name,
    required this.level,
    required this.geometry,
    required this.updatedAt,
  });

  factory RiskZone.fromMap(String id, Map<String, dynamic> data) {
    return RiskZone(
      id: id,
      name: data['name'] ?? 'Zone',
      level: riskLevelFromString(data['level'] ?? 'medium'),
      geometry: GeoGeometry.fromGeoJson(data['geometry'] as Map<String, dynamic>),
      updatedAt: DateTime.tryParse(data['updatedAt'] ?? '') ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toMap() => {
        'name': name,
        'level': riskLevelToString(level),
        'geometry': geometry.toGeoJson(),
        'updatedAt': updatedAt.toIso8601String(),
      };

  // Geometry helpers
  bool contains(Position position, {double bufferMeters = 0}) {
    final lat = position.latitude;
    final lng = position.longitude;

    if (geometry.type == 'Polygon') {
      final List<dynamic> rings = geometry.coordinates; // [ [ [lng,lat], ... ] ]
      if (rings.isEmpty) return false;
      final List<dynamic> outer = rings.first;
      final pts = outer.map<List<double>>((e) => (e as List).cast<double>()).toList();
      return _pointInPolygon(lng, lat, pts, bufferMeters: bufferMeters);
    } else if (geometry.type == 'Point' && geometry.radiusMeters != null) {
      final List coords = geometry.coordinates; // [lng, lat]
      final double cLng = (coords[0] as num).toDouble();
      final double cLat = (coords[1] as num).toDouble();
      final distance = Geolocator.distanceBetween(lat, lng, cLat, cLng);
      return distance <= (geometry.radiusMeters! + bufferMeters);
    }
    return false;
  }

  // Ray-casting algorithm for point-in-polygon with optional buffer by inflating edges.
  bool _pointInPolygon(double x, double y, List<List<double>> polygon, {double bufferMeters = 0}) {
    // Apply buffer by early-out using min distance to edges when near boundary.
    // For simplicity, when buffer > 0, we treat points within buffer as inside using bbox quick check.
    // Compute bbox
    double minX = double.infinity, minY = double.infinity, maxX = -double.infinity, maxY = -double.infinity;
    for (final p in polygon) {
      minX = (p[0] < minX) ? p[0] : minX;
      minY = (p[1] < minY) ? p[1] : minY;
      maxX = (p[0] > maxX) ? p[0] : maxX;
      maxY = (p[1] > maxY) ? p[1] : maxY;
    }
    // Roughly convert buffer meters to degrees at equator: 1 deg ~ 111,320 m
    final bDeg = bufferMeters / 111320.0;
    if (x >= minX - bDeg && x <= maxX + bDeg && y >= minY - bDeg && y <= maxY + bDeg) {
      // proceed
    } else {
      return false;
    }

    bool inside = false;
    for (int i = 0, j = polygon.length - 1; i < polygon.length; j = i++) {
      final xi = polygon[i][0], yi = polygon[i][1];
      final xj = polygon[j][0], yj = polygon[j][1];
      final intersect = ((yi > y) != (yj > y)) &&
          (x < (xj - xi) * (y - yi) / ((yj - yi) == 0 ? 1e-12 : (yj - yi)) + xi);
      if (intersect) inside = !inside;
    }
    return inside;
  }

  String toJson() => jsonEncode(toMap());

  static RiskZone fromJson(String id, String jsonStr) {
    return RiskZone.fromMap(id, jsonDecode(jsonStr));
  }
}
