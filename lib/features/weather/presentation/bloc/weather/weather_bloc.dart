import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_weather_app/core/error/failures.dart';
import 'package:task_weather_app/features/weather/domain/usecases/get_weather_usecase.dart';

import 'weather_states.dart';

import 'weather_events.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherStates> {
  final GetWeatherUseCase getWeatherUseCase;

  WeatherBloc(this.getWeatherUseCase) : super(WeatherInitialState()) {
    // Register event handlers
    on<GetWeatherEvent>(_onGetWeather);
  }

  Future<void> _onGetWeather(
      GetWeatherEvent event,
      Emitter<WeatherStates> emit
      ) async {
    emit(WeatherLoadingState());
    final result = await getWeatherUseCase(event.cityName);

    result.fold(
          (Failure failure) => emit(WeatherFailureState(failure)),
          (weather) => emit(WeatherSuccessState(weather)),
    );
  }
}