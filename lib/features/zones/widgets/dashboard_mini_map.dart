import 'package:flutter/material.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tourist_safety_app/features/zones/providers/geofence_provider.dart';

class DashboardMiniMap extends StatefulWidget {
  final double height;
  const DashboardMiniMap({super.key, this.height = 220});

  @override
  State<DashboardMiniMap> createState() => _DashboardMiniMapState();
}

class _DashboardMiniMapState extends State<DashboardMiniMap> {
  // Removed unused _map field since it's not being used

  @override
  Widget build(BuildContext context) {
    // Removed unused theme variable
    return Container(
      height: widget.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Color(0x14000000), blurRadius: 12, offset: Offset(0, 4))
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          MapWidget(
            key: const ValueKey('dashboard-mini-map'),
            styleUri: MapboxStyles.MAPBOX_STREETS,
            cameraOptions: CameraOptions(
              center: Point(coordinates: Position(92.9376, 26.2006)),
              zoom: 13.0,
            ),
            onMapCreated: (map) async {
              // Enable user puck with heading
              await map.location.updateSettings(
                LocationComponentSettings(
                  enabled: true,
                  puckBearingEnabled: true,
                  puckBearing: PuckBearing.HEADING,
                ),
              );
              if (mounted) {
                await context.read<GeofenceProvider>().attachMap(map);
              }
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
                    ? 'Locating...'
                    : '${pos.latitude.toStringAsFixed(5)}, ${pos.longitude.toStringAsFixed(5)}';
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
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
