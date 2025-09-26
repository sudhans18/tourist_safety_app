import 'dart:math' as math;

import 'package:geolocator/geolocator.dart';
import 'package:tourist_safety_app/features/zones/constants/zones_constants.dart';

/// Utility class for geometric calculations
class GeometryUtils {
  /// Ray-casting algorithm for point-in-polygon with optional buffer
  static bool pointInPolygon(
    double x,
    double y,
    List<List<double>> polygon, {
    double bufferMeters = 0,
  }) {
    // Apply buffer by early-out using min distance to edges when near boundary
    final bbox = _calculateBoundingBox(polygon);
    final bufferDegrees = bufferMeters * ZonesConstants.degreesPerMeterLat;

    if (x >= bbox.minX - bufferDegrees &&
        x <= bbox.maxX + bufferDegrees &&
        y >= bbox.minY - bufferDegrees &&
        y <= bbox.maxY + bufferDegrees) {
      // Point is within buffered bounds, do full calculation
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

  /// Calculate bounding box for a polygon
  static _BoundingBox _calculateBoundingBox(List<List<double>> polygon) {
    double minX = double.infinity, minY = double.infinity;
    double maxX = -double.infinity, maxY = -double.infinity;

    for (final point in polygon) {
      minX = math.min(minX, point[0]);
      minY = math.min(minY, point[1]);
      maxX = math.max(maxX, point[0]);
      maxY = math.max(maxY, point[1]);
    }

    return _BoundingBox(minX, minY, maxX, maxY);
  }

  /// Convert polygon coordinates to Position objects
  static List<List<Position>> convertPolygonCoordinates(List<dynamic> coords) {
    return (coords)
        .map<List<Position>>((ring) => (ring as List)
            .map<Position>((p) => Position(
                  latitude: (p[1] as num).toDouble(),
                  longitude: (p[0] as num).toDouble(),
                  timestamp: DateTime.now(),
                  accuracy: 0.0,
                  altitude: 0.0,
                  altitudeAccuracy: 0.0,
                  heading: 0.0,
                  headingAccuracy: 0.0,
                  speed: 0.0,
                  speedAccuracy: 0.0,
                ))
            .toList())
        .toList();
  }

  /// Generate polygon points for a circle
  static List<Position> circleToPolygon({
    required double centerLng,
    required double centerLat,
    required double radiusMeters,
    int steps = ZonesConstants.defaultCircleSteps,
  }) {
    final result = <Position>[];
    final latCirc = radiusMeters * ZonesConstants.degreesPerMeterLat;
    final lngCirc = radiusMeters * ZonesConstants.degreesPerMeterLat * math.cos(centerLat * math.pi / 180);

    for (int i = 0; i <= steps; i++) {
      final theta = 2 * math.pi * (i / steps);
      final dx = lngCirc * math.cos(theta);
      final dy = latCirc * math.sin(theta);
      result.add(Position(
        latitude: centerLat + dy,
        longitude: centerLng + dx,
        timestamp: DateTime.now(),
        accuracy: 0.0,
        altitude: 0.0,
        altitudeAccuracy: 0.0,
        heading: 0.0,
        headingAccuracy: 0.0,
        speed: 0.0,
        speedAccuracy: 0.0,
      ));
    }
    return result;
  }

  /// Calculate distance between two points using geolocator
  static double distanceBetween(
    double startLat,
    double startLng,
    double endLat,
    double endLng,
  ) {
    return Geolocator.distanceBetween(startLat, startLng, endLat, endLng);
  }
}

/// Simple bounding box class
class _BoundingBox {
  final double minX, minY, maxX, maxY;

  _BoundingBox(this.minX, this.minY, this.maxX, this.maxY);
}
