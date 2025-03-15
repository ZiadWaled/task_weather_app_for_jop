import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_weather_app/core/error/failures.dart';
import 'package:task_weather_app/features/weather/domain/usecases/get_weather_usecase.dart';

import 'weather_states.dart';

class WeatherCubit extends Cubit<WeatherStates> {
  final GetWeatherUseCase getWeatherUseCase;

  WeatherCubit(this.getWeatherUseCase) : super(WeatherInitialState());

  Future<void> getWeather({required String cityName}) async {
    emit(WeatherLoadingState());
    final result = await getWeatherUseCase(cityName);

    result.fold(
          (Failure failure) => emit(WeatherFailureState(failure)),
          (weather) => emit(WeatherSuccessState(weather)),
    );
  }
}
