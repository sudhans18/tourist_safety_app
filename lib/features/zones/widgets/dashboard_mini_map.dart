import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tourist_safety_app/features/zones/providers/geofence_provider.dart';
import 'package:tourist_safety_app/l10n/app_localizations.dart';

// Helper method to animate camera movement
Future<void> _flyToCamera(MapboxMap map, CameraOptions cameraOptions, {Duration? duration}) async {
  await map.flyTo(
    cameraOptions,
    MapAnimationOptions(
      startDelay: 0,
      duration: duration?.inMilliseconds ?? 1000,
    ),
  );
}

/// A mini map widget that shows the user's current location and nearby zones
/// with minimal interaction and optimized performance.

class DashboardMiniMap extends StatefulWidget {
  final double height;
  const DashboardMiniMap({super.key, this.height = 220});

  @override
  State<DashboardMiniMap> createState() => _DashboardMiniMapState();
}

class _DashboardMiniMapState extends State<DashboardMiniMap> {
  MapboxMap? _mapController;
  StreamSubscription? _locationSubscription;
  final _mapReadyCompleter = Completer<void>();
  
  @override
  void dispose() {
    // Cancel any active subscriptions
    _locationSubscription?.cancel();
    if (!_mapReadyCompleter.isCompleted) {
      _mapReadyCompleter.complete();
    }
      
    // Disable location component
    _mapController?.location.updateSettings(
      LocationComponentSettings(enabled: false),
    );
    
    // Clear the map controller
    _mapController = null;
    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
              color: Color(0x14000000), blurRadius: 12, offset: Offset(0, 4))
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              return SizedBox(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                child: MapWidget(
                  key: const ValueKey('dashboard-mini-map'),
                  styleUri: MapboxStyles.MAPBOX_STREETS,
                  cameraOptions: CameraOptions(
                    center: Point(coordinates: Position(92.9376, 26.2006)),
                    zoom: 13.0,
                    bearing: 0.0,
                    pitch: 0.0,
                  ),
                  textureView: true,
                  onMapCreated: (map) async {
                    _mapController = map;
                    final geofenceProvider = context.read<GeofenceProvider>();
                    
                    // Disable all gestures for the mini map via controller API
                    try {
                      await map.gestures.updateSettings(
                        GesturesSettings(
                          scrollEnabled: false,
                          rotateEnabled: false,
                          pitchEnabled: false,
                          doubleTapToZoomInEnabled: false,
                          doubleTouchToZoomOutEnabled: false,
                          quickZoomEnabled: false,
                        ),
                      );
                    } catch (e) {
                      debugPrint('Failed to update gesture settings: $e');
                    }

                    // Configure location component with minimal settings
                    await map.location.updateSettings(
                      LocationComponentSettings(
                        enabled: true,
                        pulsingEnabled: false,
                        showAccuracyRing: false,
                      ),
                    );
                    
                    // Mark map as ready
                    _mapReadyCompleter.complete();
                    
                    // Attach geofence provider
                    if (mounted) {
                      await geofenceProvider.attachMap(map);
                      
                      // Initial position
                      final position = geofenceProvider.lastPosition;
                      if (position != null && mounted) {
                        await _flyToCamera(
                          map,
                          CameraOptions(
                            center: Point(
                              coordinates: Position(
                                position.longitude,
                                position.latitude,
                              ),
                            ),
                            zoom: 15.0,
                          ),
                          duration: const Duration(milliseconds: 500),
                        );
                      }
                      
                      // Listen to location updates
                      _locationSubscription = Stream.periodic(
                        const Duration(seconds: 5),
                        (_) => geofenceProvider.lastPosition,
                      ).listen((position) async {
                        if (position != null && mounted) {
                          await _mapReadyCompleter.future;
                          if (!mounted) return;
                          
                          await _flyToCamera(
                            map,
                            CameraOptions(
                              center: Point(
                                coordinates: Position(
                                  position.longitude,
                                  position.latitude,
                                ),
                              ),
                              zoom: 15.0,
                            ),
                            duration: const Duration(milliseconds: 1000),
                          );
                        }
                      });
                    }
                  },
                ),
              );
            },
          ),
          Positioned(
            top: 8,
            right: 8,
            child: Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () => Navigator.pushNamed(context, '/map-fullscreen'),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.fullscreen, size: 20),
                ),
              ),
            ),
          ),
          // Location label
          Positioned(
            bottom: 8,
            right: 8,
            child: Consumer<GeofenceProvider>(
              builder: (_, prov, __) {
                final pos = prov.lastPosition;
                final txt = (pos == null)
                    ? AppLocalizations.of(context)!.locating
                    : '${pos.latitude.toStringAsFixed(5)}, ${pos.longitude.toStringAsFixed(5)}';
                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(txt, style: const TextStyle(fontSize: 12)),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
