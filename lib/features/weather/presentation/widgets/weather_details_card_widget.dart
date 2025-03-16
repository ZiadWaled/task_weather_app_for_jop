import 'package:flutter/material.dart';
import 'package:task_weather_app/features/weather/domain/entities/weather_entity.dart';
import 'package:task_weather_app/features/weather/presentation/widgets/weather_icon_widget.dart';

class WeatherDetailsCard extends StatelessWidget {
  final WeatherEntity weather;
  final MaterialColor themeColor;

  const WeatherDetailsCard({
    super.key,
    required this.weather,
    required this.themeColor,
  });

  @override
  Widget build(BuildContext context) {
    const Color textColor = Colors.white;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: themeColor.shade700,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDetailRow('Avg Temp:', '${weather.avgTemp}°', textColor),
              _buildDetailRow('Max Temp:', '${weather.maxTemp}°', textColor),
              _buildDetailRow('Min Temp:', '${weather.minTemp}°', textColor),
              _buildDetailRow('Humidity:', '${weather.humidity}%', textColor),
              _buildDetailRow('Pressure:', '${weather.pressure} mb', textColor),
              _buildDetailRow('Wind:', '${weather.wind} km/h', textColor),
              _buildDetailRow('Visible:', '${weather.visibility} km', textColor),
            ],
          ),
          WeatherIconWidget(condition: weather.weatherCondition, size: 80),

        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, Color textColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              color: textColor,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}