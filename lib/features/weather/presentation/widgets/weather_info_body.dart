import 'package:flutter/material.dart';
import 'package:task_weather_app/core/utils/functions.dart';
import 'package:task_weather_app/features/weather/domain/entities/weather_entity.dart';
import 'package:task_weather_app/features/weather/presentation/widgets/weather_details_card_widget.dart';
import 'package:task_weather_app/features/weather/presentation/widgets/weather_forecast_card_widget.dart';
import 'package:task_weather_app/features/weather/presentation/widgets/weather_icon_widget.dart';

class WeatherInfoBody extends StatelessWidget {
  final WeatherEntity weather;

  const WeatherInfoBody({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    final MaterialColor themeColor = getThemeColor(weather.weatherCondition);
    const Color textColor = Colors.white;
    final Size screenSize = MediaQuery.of(context).size;

    return Container(
      height: screenSize.height,
      width: screenSize.width,
      decoration: BoxDecoration(
        color: themeColor.shade500,
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildWeatherHeader(textColor),
                const SizedBox(height: 32),
                WeatherDetailsCard(weather: weather, themeColor: themeColor),
                const SizedBox(height: 32),
                _buildForecastHeader(textColor),
                const SizedBox(height: 16),
                _buildForecastSection(themeColor),
              ],
            ),
          ),
        ),
      ),
    );
  }



  Widget _buildWeatherHeader(Color textColor) {
    return Column(
      children: [
        Text(
          weather.cityName,
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w500,
            color: textColor,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          weather.weatherCondition,
          style: TextStyle(
            fontSize: 24,
            color: textColor,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          '${weather.temp}°',
          style: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ],
    );
  }

  Widget _buildForecastHeader(Color textColor) {
    return Text(
      "Hourly Forecast",
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: textColor,
      ),
    );
  }

  Widget _buildForecastSection(MaterialColor themeColor) {
    return SingleChildScrollView(
scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: weather.hourlyForecasts.map((forecast) {
          return WeatherForecastCard(
            time: forecast.time,
            temp: '${forecast.temp}°',
            condition: forecast.condition,
            themeColor: Colors.grey,
          );
        }).toList(),
      ),
    );
  }
}