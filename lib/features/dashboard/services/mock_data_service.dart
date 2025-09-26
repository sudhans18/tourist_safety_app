import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

/// Centralized mock data service for dashboard
class DashboardMockData {
  // Vitals data
  static const bool bandConnected = true;
  static const int heartRate = 72;
  static const int spo2 = 98;
  static const double temperatureC = 36.6;
  static const String activity = 'Normal';
  static const bool insideRestrictedZone = true;

  // Chart data points for heart rate visualization
  static List<FlSpot> getHeartRateSpots() {
    return [
      const FlSpot(0, 70),
      const FlSpot(2, 72),
      const FlSpot(4, 75),
      const FlSpot(6, 74),
      const FlSpot(8, 73),
      const FlSpot(10, 76),
      const FlSpot(12, 72),
    ];
  }

  // Quick actions data
  static const List<Map<String, dynamic>> quickActions = [
    {
      'icon': Icons.monitor_heart_outlined,
      'label': 'Live Vitals',
      'route': '/live-vitals',
    },
    {
      'icon': Icons.family_restroom,
      'label': 'Family Tracking',
      'route': '/family',
    },
    {
      'icon': Icons.park_outlined,
      'label': 'Nearby Attractions',
      'route': '/nearby-attractions',
    },
    {
      'icon': Icons.wb_sunny_outlined,
      'label': 'Weather',
      'route': '/weather',
    },
  ];

  // Alert data
  static const Map<String, dynamic> recentAlert = {
    'icon': '⚠️',
    'title': 'Geofence Alert',
    'timeAgo': '2 hours ago',
  };

  // Status configurations
  static const Map<String, Color> statusColors = {
    'connected': Color(0xFF22C55E),
    'disconnected': Color(0xFFEF4444),
  };

  // Animation configurations
  static const Map<String, Duration> animationDurations = {
    'slideIn': Duration(milliseconds: 320),
    'shake': Duration(milliseconds: 400),
    'pulse': Duration(milliseconds: 1200),
    'staggerDelay': Duration(milliseconds: 80),
  };

  // Form validation messages
  static const Map<String, String> validationMessages = {
    'requiredField': 'This field is required',
    'invalidDateRange': 'End date must be after start date',
  };
}
