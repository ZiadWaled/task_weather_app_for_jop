import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_weather_app/core/di/get_it.dart';
import 'package:task_weather_app/core/utils/functions.dart';
import 'package:task_weather_app/features/weather/presentation/bloc/weather/weather_cubit.dart';
import 'package:task_weather_app/features/weather/presentation/bloc/weather/weather_states.dart';
import 'package:task_weather_app/features/weather/presentation/pages/search_page.dart';
import 'package:task_weather_app/features/weather/presentation/widgets/no_weather_body.dart';
import 'package:task_weather_app/features/weather/presentation/widgets/weather_info_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => instance<WeatherCubit>(),
      child: _HomePageContent(),
    );
  }
}

class _HomePageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherStates>(
      builder: (context, state) {
        Color appBarColor = Colors.blueAccent;
        Color backgroundColor = Colors.white;

        if (state is WeatherSuccessState) {
          appBarColor = getThemeColor(state.weather.weatherCondition);
          backgroundColor = getThemeColor(state.weather.weatherCondition)[50] ?? Colors.white;
        }

        return Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            backgroundColor: appBarColor,
            elevation: 0,
            title: const Text(
              'Weather City',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
            centerTitle: true,
            actions: [
              Container(
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
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
                  icon: const Icon(Icons.search, color: Colors.white),
                ),
              ),
            ],
          ),
          body: SafeArea(
            child: Builder(
              builder: (context) {
                if (state is WeatherLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 3,
                    ),
                  );
                } else if (state is WeatherSuccessState) {
                  return WeatherInfoBody(weather: state.weather);
                } else if (state is WeatherFailureState) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.error_outline,
                          size: 60,
                          color: Colors.redAccent,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          state.failure.message,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                } else {
                  return const NoWeatherBody();
                }
              },
            ),
          ),
        );
      },
    );
  }
}