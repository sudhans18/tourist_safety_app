import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:tourist_safety_app/core/constants/app_constants.dart';
import 'package:tourist_safety_app/core/widgets/app_widgets.dart';
import 'package:tourist_safety_app/features/weather/constants/weather_constants.dart';

/// Optimized current weather card widget
class CurrentWeatherCard extends StatelessWidget {
  final CurrentWeather weather;

  const CurrentWeatherCard({
    super.key,
    required this.weather,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: AppPadding.md,
      borderRadius: AppRadius.lg,
      shadows: AppShadows.medium,
      child: Row(
        children: [
          // Weather icon
          Icon(
            weather.icon,
            size: WeatherConstants.weatherIconSize,
            color: WeatherConstants.sunnyColor,
          ),
          const SizedBox(width: WeatherConstants.contentSpacing),

          // Weather details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Current Weather',
                  style: AppTextStyles.bodyLarge.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: WeatherConstants.contentSpacing),

                Text(
                  '${weather.temperature}°C • ${weather.condition}',
                  style: AppTextStyles.bodyLarge,
                ),
                const SizedBox(height: WeatherConstants.contentSpacing),

                Text(
                  'Feels like: ${weather.feelsLike}°C • Humidity: ${weather.humidity}% • Wind: ${weather.windSpeed} km/h',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppConstants.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Optimized weather forecast strip widget
class WeatherForecastStrip extends StatelessWidget {
  final List<WeatherForecast> forecasts;

  const WeatherForecastStrip({
    super.key,
    required this.forecasts,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: AppPadding.verticalMd,
      borderRadius: AppRadius.lg,
      shadows: AppShadows.medium,
      child: SizedBox(
        height: WeatherConstants.forecastHeight,
        child: ListView.separated(
          padding: AppPadding.horizontalMd,
          scrollDirection: Axis.horizontal,
          itemCount: forecasts.length,
          separatorBuilder: (_, __) => const SizedBox(width: AppConstants.spacingLg),
          itemBuilder: (_, index) {
            final forecast = forecasts[index];
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  forecast.icon,
                  color: WeatherConstants.cloudyColor,
                ),
                const SizedBox(height: AppConstants.spacingXs),

                Text(
                  forecast.day,
                  style: AppTextStyles.bodyMedium.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: WeatherConstants.contentSpacing),

                Text(
                  forecast.temperature,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppConstants.textSecondary,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

/// Optimized temperature chart card widget
class TemperatureChartCard extends StatelessWidget {
  final TemperatureTrend trend;

  const TemperatureChartCard({
    super.key,
    required this.trend,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: AppPadding.md,
      borderRadius: AppRadius.lg,
      shadows: AppShadows.medium,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Next Days Trend',
            style: AppTextStyles.bodyLarge.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: WeatherConstants.contentSpacing),

          SizedBox(
            height: WeatherConstants.chartHeight,
            child: LineChart(
              LineChartData(
                gridData: const FlGridData(
                  show: true,
                  drawVerticalLine: false,
                ),
                titlesData: const FlTitlesData(show: false),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    isCurved: true,
                    color: WeatherConstants.chartLineColor,
                    barWidth: 3,
                    spots: trend.temperatures
                        .asMap()
                        .entries
                        .map((e) => FlSpot(e.key.toDouble(), e.value))
                        .toList(),
                    dotData: const FlDotData(show: false),
                    belowBarData: BarAreaData(
                      show: true,
                      color: WeatherConstants.chartAreaColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
