import 'package:dartz/dartz.dart';
import 'package:task_weather_app/core/error/exceptions.dart';
import 'package:task_weather_app/core/error/failures.dart';
import 'package:task_weather_app/features/weather/data/datasources/weather_remote_datasource.dart';
import 'package:task_weather_app/features/weather/domain/entities/weather_entity.dart';
import 'package:task_weather_app/features/weather/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDataSource remoteDataSource ;

  WeatherRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, WeatherEntity>> getWeather(String cityName) async {
    try {
      final weatherModel = await remoteDataSource.getWeather(cityName);
      return Right(weatherModel);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return const Left(ServerFailure('Oops, something went wrong!'));
    }
  }
}