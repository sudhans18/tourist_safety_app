import 'package:flutter/material.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tourist_safety_app/features/zones/providers/geofence_provider.dart';

class MapFullscreenScreen extends StatefulWidget {
  const MapFullscreenScreen({super.key});

  @override
  State<MapFullscreenScreen> createState() => _MapFullscreenScreenState();
}

class _MapFullscreenScreenState extends State<MapFullscreenScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map'),
      ),
      body: Consumer<GeofenceProvider>(
        builder: (context, prov, _) {
          return MapWidget(
            styleUri: MapboxStyles.MAPBOX_STREETS,
            cameraOptions: CameraOptions(
              center: prov.hasLocation
                  ? Point(
                      coordinates: Position(
                        prov.lastPosition!.longitude,
                        prov.lastPosition!.latitude,
                      ),
                    )
                  : Point(coordinates: Position(92.9376, 26.2006)),
              zoom: prov.hasLocation ? 15 : 13,
            ),
            onMapCreated: (map) async {
              // This 'await' creates the async gap.
              await map.location.updateSettings(
                LocationComponentSettings(
                  enabled: true,
                  puckBearingEnabled: true,
                  puckBearing: PuckBearing.HEADING,
                ),
              );

              // --- FIX ---
              // Use the 'prov' variable from the Consumer's builder
              // instead of calling context.read().
              // Also, add the 'mounted' check for safety.
              if (mounted) {
                await prov.attachMap(map);
              }
            },
          );
        },
      ),
    );
  }
}
