import 'package:flutter/material.dart';

MaterialColor getThemeColor(String condition) {
  Map<String, MaterialColor> weatherColors = {
    'Clear': Colors.yellow,
    'Sunny': Colors.orange,
    'Partly cloudy': Colors.lightBlue,
    'Cloudy': Colors.blueGrey,
    'Overcast': Colors.grey,
    'Rain': Colors.indigo,
    'Mist': Colors.teal,
    'Snow': Colors.lightBlue,
    'Thunderstorm': Colors.deepPurple,
    'default': Colors.blue,
  };

  return weatherColors[condition] ?? weatherColors['default']!;
}