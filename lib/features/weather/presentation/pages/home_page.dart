import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_weather_app/core/utils/functions.dart';
import 'package:task_weather_app/features/weather/presentation/bloc/weather/weather_bloc.dart';
import 'package:task_weather_app/features/weather/presentation/bloc/weather/weather_states.dart';
import 'package:task_weather_app/features/weather/presentation/pages/search_page.dart';
import 'package:task_weather_app/features/weather/presentation/widgets/weather_info_body.dart';
import 'package:task_weather_app/features/weather/presentation/widgets/no_weather_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherStates>(
      builder: (context, state) {
        const Color primaryColor = Colors.green;
        const Color backgroundColor = Color(0xFFF0F8F0); // Light green background

        return Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            title: const Text(
              'Weather App',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.search, color: primaryColor),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlocProvider.value(
                        value: BlocProvider.of<WeatherBloc>(context),
                        child: const SearchPage(),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          body: buildBody(state),
        );
      },
    );
  }
  Widget buildBody(WeatherStates state) {
    if (state is WeatherLoadingState) {
      return const Center(
        child: CircularProgressIndicator(
          color: Colors.green,
        ),
      );
    } else if (state is WeatherSuccessState) {
      return WeatherInfoBody(weather: state.weather);
    } else {
      // Initial state or failure state
      return const NoWeatherBody();
    }
  }
  }