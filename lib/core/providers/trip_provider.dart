import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

import '../models/trip.dart';

class TripProvider extends ChangeNotifier {
  final List<Trip> _trips = [];
  final _uuid = const Uuid();

  TripProvider() {
    _seedDemoTrips();
  }

  List<Trip> get allTrips => List.unmodifiable(_trips);

  List<Trip> get upcomingTrips {
    final now = DateTime.now();
    return _trips
        .where(
            (t) => !t.endDate.isBefore(DateTime(now.year, now.month, now.day)))
        .toList()
      ..sort((a, b) => a.startDate.compareTo(b.startDate));
  }

  List<Trip> get pastTrips {
    final now = DateTime.now();
    return _trips
        .where(
            (t) => t.endDate.isBefore(DateTime(now.year, now.month, now.day)))
        .toList()
      ..sort((a, b) => b.endDate.compareTo(a.endDate));
  }

  void addTrip({
    required String name,
    required String destination,
    required DateTime startDate,
    required DateTime endDate,
    String notes = '',
    String? imageUrl,
  }) {
    _trips.add(
      Trip(
        id: _uuid.v4(),
        name: name,
        destination: destination,
        startDate: startDate,
        endDate: endDate,
        notes: notes,
        imageUrl: imageUrl,
      ),
    );
    notifyListeners();
  }

  void _seedDemoTrips() {
    if (_trips.isNotEmpty) return;
    final now = DateTime.now();
    _trips.addAll([
      Trip(
        id: _uuid.v4(),
        name: 'Taj Mahal',
        destination: 'Agra, India',
        startDate: now.add(const Duration(days: 5)),
        endDate: now.add(const Duration(days: 10)),
        notes:
            '7 wonders of the world, Mughal architecture, Symbol of eternal love, Guided tours',
        imageUrl:
            'http://1.bp.blogspot.com/-3mUa4Z5ria0/ToRV3GwN0GI/AAAAAAAAAQ8/kA71S1kIesE/s1600/Taj+Mahal.jpg',
      ),
      Trip(
        id: _uuid.v4(),
        name: 'Desert Safari',
        destination: 'Jaisalmer, India',
        startDate: now.add(const Duration(days: 15)),
        endDate: now.add(const Duration(days: 18)),
        notes: 'Camel ride, sand dunes, night camping',
        imageUrl:
            'https://images.unsplash.com/photo-1518684079-3c830dcef090?q=80&w=1600&auto=format&fit=crop',
      ),
      Trip(
        id: _uuid.v4(),
        name: 'Beach Weekend',
        destination: 'Goa, India',
        startDate: now.subtract(const Duration(days: 20)),
        endDate: now.subtract(const Duration(days: 17)),
        notes: 'Baga beach, water sports, seafood',
        imageUrl:
            'https://tse2.mm.bing.net/th/id/OIP.m6hzwo8RoPPKT6zwK5WbDgHaEK?rs=1&pid=ImgDetMain&o=7&rm=3',
      ),
    ]);
  }
}
