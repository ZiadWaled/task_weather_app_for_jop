import 'package:flutter/material.dart';
import 'package:task_weather_app/features/weather/presentation/widgets/weather_icon_widget.dart';

class WeatherForecastCard extends StatelessWidget {
  final String time;
  final String temp;
  final String condition;
  final MaterialColor themeColor;

  const WeatherForecastCard({
    super.key,
    required this.time,
    required this.temp,
    required this.condition,
    required this.themeColor,
  });

  @override
  Widget build(BuildContext context) {
    const Color textColor = Colors.white;

    return Container(
      width: 100,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(
        color: themeColor.shade700,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            time,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: textColor,
            ),
          ),
          Text(
            temp,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          const SizedBox(height: 8),
          WeatherIconWidget(condition: condition, size: 20),
          const SizedBox(height: 8),
          Text(
            condition,
            style: const TextStyle(
              fontSize: 14,
              color: textColor,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}