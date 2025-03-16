import 'package:equatable/equatable.dart';
import 'package:task_weather_app/core/error/failures.dart';
import 'package:task_weather_app/features/weather/domain/entities/weather_entity.dart';

abstract class WeatherStates extends Equatable {
  const WeatherStates();

  @override
  List<Object?> get props => [];
}

class WeatherInitialState extends WeatherStates {}

class WeatherLoadingState extends WeatherStates {}

class WeatherSuccessState extends WeatherStates {
  final WeatherEntity weather;

  const WeatherSuccessState(this.weather);

  @override
  List<Object?> get props => [weather];
}

class WeatherFailureState extends WeatherStates {
  final Failure failure;

  const WeatherFailureState(this.failure);

  @override
  List<Object?> get props => [failure];
}