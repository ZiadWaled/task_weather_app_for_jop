import 'package:dio/dio.dart';
import 'package:task_weather_app/core/constants/app_constants.dart';

class DioHelper {
  late final Dio dio;

  DioHelper() {
    dio = Dio(
      BaseOptions(
        baseUrl: AppConstants.baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
      ),
    );
  }

  Future<Response> get(
      String path, {
        Map<String, dynamic>? queryParameters,
      }) async {
    return await dio.get(
      path,
      queryParameters: queryParameters,
    );
  }
}