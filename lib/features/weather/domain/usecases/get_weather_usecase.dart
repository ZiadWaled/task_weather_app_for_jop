import 'package:dartz/dartz.dart';
import 'package:task_weather_app/core/error/failures.dart';
import 'package:task_weather_app/features/weather/domain/entities/weather_entity.dart';
import 'package:task_weather_app/features/weather/domain/repositories/weather_repository.dart';

class GetWeatherUseCase {
  final WeatherRepository repository;

  GetWeatherUseCase(this.repository);

  Future<Either<Failure, WeatherEntity>> call(String cityName) {
    return repository.getWeather(cityName);
  }
}