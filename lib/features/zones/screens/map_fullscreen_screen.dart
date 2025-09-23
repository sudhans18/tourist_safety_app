import 'package:flutter/material.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tourist_safety_app/features/zones/providers/geofence_provider.dart';
import 'package:tourist_safety_app/l10n/app_localizations.dart';

class MapFullscreenScreen extends StatefulWidget {
  const MapFullscreenScreen({super.key});

  @override
  State<MapFullscreenScreen> createState() => _MapFullscreenScreenState();
}

class _MapFullscreenScreenState extends State<MapFullscreenScreen> {
  late MapboxMap? _mapboxMap;
  final TextEditingController _searchController = TextEditingController();
  List<String> _searchResults = [];

  // Mock search data for demonstration
  final List<Map<String, dynamic>> _mockLocations = [
    {
      'name': 'Taj Mahal',
      'address': 'Agra, Uttar Pradesh, India',
      'lat': 27.1751,
      'lng': 78.0421,
    },
    {
      'name': 'India Gate',
      'address': 'New Delhi, India',
      'lat': 28.6129,
      'lng': 77.2295,
    },
    {
      'name': 'Red Fort',
      'address': 'Old Delhi, New Delhi, India',
      'lat': 28.6562,
      'lng': 77.2410,
    },
    {
      'name': 'Qutub Minar',
      'address': 'Mehrauli, New Delhi, India',
      'lat': 28.5244,
      'lng': 77.1855,
    },
    {
      'name': 'Lotus Temple',
      'address': 'New Delhi, India',
      'lat': 28.5535,
      'lng': 77.2588,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: t.searchHint,
              prefixIcon: const Icon(Icons.search, size: 20),
              suffixIcon: _searchController.text.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear, size: 20),
                      onPressed: () {
                        _searchController.clear();
                        setState(() => _searchResults = []);
                      },
                    )
                  : null,
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            ),
            onChanged: _onSearchChanged,
          ),
        ),
        actions: [
          if (_searchResults.isNotEmpty)
            TextButton(
              onPressed: () {
                if (_searchResults.isNotEmpty) {
                  final location = _mockLocations.firstWhere(
                    (loc) => loc['name'] == _searchResults.first,
                    orElse: () => {'name': '', 'address': '', 'lat': 0.0, 'lng': 0.0},
                  );
                  _moveToLocation(location);
                }
              },
              child: Text(t.search),
            ),
        ],
      ),
      body: Stack(
        children: [
          Consumer<GeofenceProvider>(
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
                  _mapboxMap = map;
                  await map.location.updateSettings(
                    LocationComponentSettings(
                      enabled: true,
                      puckBearingEnabled: true,
                      puckBearing: PuckBearing.HEADING,
                    ),
                  );

                  if (mounted) {
                    await prov.attachMap(map);
                  }
                },
              );
            },
          ),
          // Search results overlay
          if (_searchResults.isNotEmpty && _searchController.text.length >= 2)
            Positioned(
              top: 10,
              left: 10,
              right: 10,
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: ListView.builder(
                  itemCount: _searchResults.length > 5 ? 5 : _searchResults.length,
                  itemBuilder: (context, index) {
                    final locationName = _searchResults[index];
                    final location = _mockLocations.firstWhere(
                      (loc) => loc['name'] == locationName,
                      orElse: () => {'name': locationName, 'address': '', 'lat': 0.0, 'lng': 0.0},
                    );
                    return ListTile(
                      leading: const Icon(Icons.location_on, color: Colors.red),
                      title: Text(location['name'] ?? locationName),
                      subtitle: Text(location['address'] ?? ''),
                      onTap: () => _moveToLocation(location),
                    );
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }

  void _onSearchChanged(String query) {
    if (query.length < 2) {
      setState(() => _searchResults = []);
      return;
    }

    // Mock search - filter locations based on query
    final filtered = _mockLocations
        .where((location) =>
            location['name'].toLowerCase().contains(query.toLowerCase()) ||
            location['address'].toLowerCase().contains(query.toLowerCase()))
        .map((location) => location['name'] as String)
        .toList();

    setState(() {
      _searchResults = filtered;
      print('Search results for "$query": $filtered'); // Debug print
    });
  }

  Future<void> _moveToLocation(Map<String, dynamic> location) async {
    try {
      final lat = location['lat'] as double;
      final lng = location['lng'] as double;

      if (lat != 0.0 && lng != 0.0) {
        // Move camera to the searched location
        await _mapboxMap?.flyTo(
          CameraOptions(
            center: Point(coordinates: Position(lng, lat)),
            zoom: 16,
          ),
          MapAnimationOptions(duration: 2000),
        );

        // Clear search results
        setState(() {
          _searchResults = [];
          _searchController.clear();
        });
      }
    } catch (e) {
      print('Error moving to location: $e');
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
