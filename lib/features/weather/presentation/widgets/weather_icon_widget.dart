import 'package:flutter/material.dart';

class WeatherIconWidget extends StatelessWidget {
  final String condition;
  final double size;

  const WeatherIconWidget({
    super.key,
    required this.condition,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    IconData iconData;
    Color iconColor = Colors.white;

    switch (condition.toLowerCase()) {
      case 'sunny':
      case 'clear':
        iconData = Icons.wb_sunny;
        break;
      case 'partly cloudy':
        iconData = Icons.wb_cloudy;
        break;
      case 'cloudy':
      case 'overcast':
        iconData = Icons.cloud;
        break;
      case 'rain':
      case 'light rain':
      case 'moderate rain':
      case 'heavy rain':
        iconData = Icons.grain;
        break;
      case 'snow':
      case 'light snow':
      case 'moderate snow':
      case 'heavy snow':
        iconData = Icons.ac_unit;
        break;
      case 'thunderstorm':
        iconData = Icons.flash_on;
        break;
      case 'mist':
      case 'fog':
        iconData = Icons.cloud_queue;
        break;
      default:
        iconData = Icons.wb_sunny;
    }

    return Icon(
      iconData,
      size: size,
      color: iconColor,
    );
  }
}