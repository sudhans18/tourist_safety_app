import 'package:flutter/material.dart';
import 'package:tourist_safety_app/core/constants/app_constants.dart';

/// Constants specific to the weather feature
class WeatherConstants {
  // Weather colors
  static const Color sunnyColor = Color(0xFFF59E0B);
  static const Color cloudyColor = Color(0xFF6B7280);
  static const Color rainyColor = Color(0xFF2563EB);
  static const Color stormyColor = Color(0xFF7C3AED);

  // Chart colors
  static const Color chartLineColor = Color(0xFF2563EB);
  static const Color chartAreaColor = Color(0x1A2563EB);

  // Layout constants
  static const double cardPadding = AppConstants.spacingMd;
  static const double cardBorderRadius = AppConstants.radiusLg;
  static const double cardElevation = AppConstants.cardElevation;
  static const double sectionSpacing = AppConstants.spacingMd;
  static const double contentSpacing = AppConstants.spacingSm;

  // Weather icon size
  static const double weatherIconSize = 48.0;

  // Chart dimensions
  static const double chartHeight = 180.0;
  static const double forecastHeight = 98.0;

  // Text sizes
  static const double temperatureSize = 42.0;
}

/// Weather data models
class CurrentWeather {
  final double temperature;
  final String condition;
  final double feelsLike;
  final int humidity;
  final double windSpeed;
  final IconData icon;

  const CurrentWeather({
    required this.temperature,
    required this.condition,
    required this.feelsLike,
    required this.humidity,
    required this.windSpeed,
    required this.icon,
  });

  static const CurrentWeather mock = CurrentWeather(
    temperature: 31,
    condition: 'Sunny',
    feelsLike: 33,
    humidity: 52,
    windSpeed: 12,
    icon: Icons.wb_sunny_outlined,
  );
}

/// Forecast data model
class WeatherForecast {
  final String day;
  final String temperature;
  final IconData icon;

  const WeatherForecast({
    required this.day,
    required this.temperature,
    required this.icon,
  });

  static const List<WeatherForecast> mockForecast = [
    WeatherForecast(day: 'Today', temperature: '32°/25°', icon: Icons.wb_sunny_outlined),
    WeatherForecast(day: 'Tomorrow', temperature: '31°/26°', icon: Icons.wb_cloudy_outlined),
    WeatherForecast(day: 'Day 3', temperature: '30°/24°', icon: Icons.thunderstorm_outlined),
    WeatherForecast(day: 'Day 4', temperature: '29°/23°', icon: Icons.water_drop_outlined),
    WeatherForecast(day: 'Day 5', temperature: '31°/25°', icon: Icons.wb_sunny_outlined),
  ];
}

/// Temperature trend data for chart
class TemperatureTrend {
  final List<double> temperatures;
  final List<String> labels;

  const TemperatureTrend({
    required this.temperatures,
    required this.labels,
  });

  static const TemperatureTrend mock = TemperatureTrend(
    temperatures: [31, 30, 29, 28, 31],
    labels: ['Day 1', 'Day 2', 'Day 3', 'Day 4', 'Day 5'],
  );
}
