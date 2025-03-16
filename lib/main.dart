// main.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_weather_app/core/theme/app_theme.dart';
import 'package:task_weather_app/features/weather/presentation/bloc/weather/weather_bloc.dart';
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
    return BlocProvider<WeatherBloc>(
      create: (context) => di.instance<WeatherBloc>(),
      child: MaterialApp(
        title: 'Weather App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        home: const HomePage(),
      ),
    );
  }
}