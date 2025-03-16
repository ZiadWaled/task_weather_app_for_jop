import 'package:get_it/get_it.dart';
import 'package:task_weather_app/core/network/dio_helper.dart';
import 'package:task_weather_app/features/weather/data/datasources/weather_remote_datasource.dart';
import 'package:task_weather_app/features/weather/data/repositories/weather_repository_impl.dart';
import 'package:task_weather_app/features/weather/domain/repositories/weather_repository.dart';
import 'package:task_weather_app/features/weather/domain/usecases/get_weather_usecase.dart';
import 'package:task_weather_app/features/weather/presentation/bloc/weather/weather_bloc.dart';

final instance = GetIt.instance;

void init() {
  // Bloc
  instance.registerFactory(() => WeatherBloc(instance()));

  // Use cases
  instance.registerLazySingleton(() => GetWeatherUseCase(instance()));

  // Repositories
  instance.registerLazySingleton<WeatherRepository>(
        () => WeatherRepositoryImpl(instance()),
  );

  // Data sources
  instance.registerLazySingleton<WeatherRemoteDataSource>(
        () => WeatherRemoteDataSourceImpl(instance()),
  );

  // Dio Helper
  instance.registerLazySingleton(() => DioHelper());
}