import 'package:task_weather_app/features/weather/domain/entities/weather_entity.dart';

class WeatherModel extends WeatherEntity {
  WeatherModel({
    required String cityname,
    required super.date,
    required super.image,
    required super.temp,
    required super.maxTemp,
    required super.minTemp,
    required super.weatherCondition,
  }) : super(
    cityName: cityname,
  );

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityname: json['location']['name'],
      date: DateTime.parse(json['current']['last_updated']),
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
      temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      weatherCondition: json['forecast']['forecastday'][0]['day']['condition']
      ['text'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cityname': cityName,
      'date': date.toIso8601String(),
      'image': image,
      'temp': temp,
      'maxTemp': maxTemp,
      'minTemp': minTemp,
      'weatherCondition': weatherCondition,
    };
  }
}
