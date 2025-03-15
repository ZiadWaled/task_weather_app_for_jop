import 'package:task_weather_app/core/error/failures.dart';
import 'package:task_weather_app/features/weather/domain/entities/weather_entity.dart';

abstract class WeatherStates {}

class WeatherInitialState extends WeatherStates {}

class WeatherLoadingState extends WeatherStates {}

class WeatherSuccessState extends WeatherStates {
  final WeatherEntity weather;
  WeatherSuccessState(this.weather);
}

class WeatherFailureState extends WeatherStates {
  final Failure failure;
  WeatherFailureState(this.failure);
}

