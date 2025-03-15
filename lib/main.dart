import 'package:flutter/material.dart';
import 'package:task_weather_app/core/theme/app_theme.dart';
import 'package:task_weather_app/features/weather/presentation/pages/home_page.dart';
import 'package:task_weather_app/core/di/get_it.dart' as di;


void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const HomePage(),
    );
  }
}