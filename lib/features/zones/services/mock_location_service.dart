/// Mock location data service for zones feature
class MockLocationService {
  static const List<Map<String, dynamic>> mockLocations = [
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

  /// Search locations by query
  static List<String> searchLocations(String query) {
    if (query.length < 2) return [];

    return mockLocations
        .where((location) =>
            location['name'].toLowerCase().contains(query.toLowerCase()) ||
            location['address'].toLowerCase().contains(query.toLowerCase()))
        .map((location) => location['name'] as String)
        .toList();
  }

  /// Get location by name
  static Map<String, dynamic>? getLocationByName(String name) {
    try {
      return mockLocations.firstWhere(
        (location) => location['name'] == name,
      );
    } catch (e) {
      return null;
    }
  }
}
