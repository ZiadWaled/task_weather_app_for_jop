import 'package:dio/dio.dart';
import 'package:task_weather_app/core/constants/app_constants.dart';
import 'package:task_weather_app/core/error/exceptions.dart';
import 'package:task_weather_app/core/network/dio_helper.dart';
import 'package:task_weather_app/features/weather/data/models/weather_model.dart';

abstract class WeatherRemoteDataSource {

  Future<WeatherModel> getWeather(String cityName);
}

class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  final DioHelper dioHelper;

  WeatherRemoteDataSourceImpl(this.dioHelper);

  @override
  Future<WeatherModel> getWeather(String cityName) async {
    try {
      final response = await dioHelper.get(
        '/forecast.json',
        queryParameters: {
          'key': AppConstants.apiKey,
          'q': cityName,
          'days': 1,
        },
      );

      return WeatherModel.fromJson(response.data);
    } on DioException catch (e) {
      final String errMessage = e.response?.data['error']['message'] ??
          'Oops, something went wrong!';
      throw ServerException(errMessage);
    } catch (e) {
      throw ServerException('Oops, something went wrong!');
    }
  }
}
