import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_weather_app/features/weather/presentation/bloc/weather/weather_cubit.dart';
import 'package:task_weather_app/features/weather/presentation/pages/search_page.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         Icon(
        Icons.cloud_off,
        size: 100,
        color: Colors.grey[300],
      ),
          const SizedBox(height: 24),
          const Text(
            'No Weather Data',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              'Search for a city to see weather information',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 40),
          ElevatedButton.icon(
            onPressed: () {
              final weatherCubit = context.read<WeatherCubit>();
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  return BlocProvider.value(
                    value: weatherCubit,
                    child: const SearchPage(),
                  );
                }),
              );
            },
            icon: const Icon(Icons.search),
            label: const Text('Search City'),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ],
      ),
    );
  }
}