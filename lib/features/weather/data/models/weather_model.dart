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
    required super.humidity,
    required super.avgTemp,
    required super.pressure,
    required super.wind,
    required super.visibility,
    required super.cloudCover,
    required super.hourlyForecasts,
  }) : super(
    cityName: cityname,
  );

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    List<HourlyForecast> hourlyList = [];
    for (var hourData in json['forecast']['forecastday'][0]['hour']) {
      hourlyList.add(HourlyForecast(
        time: hourData['time'].toString().split(' ')[1],
        temp: hourData['temp_c'].toDouble(),
        condition: hourData['condition']['text'],
        icon: hourData['condition']['icon'],
      ));
    }

    return WeatherModel(
      cityname: json['location']['name'],
      date: DateTime.parse(json['current']['last_updated']),
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
      temp: json['current']['temp_c'].toDouble(),
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'].toDouble(),
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'].toDouble(),
      weatherCondition: json['forecast']['forecastday'][0]['day']['condition']['text'],
      humidity: json['current']['humidity'],
      avgTemp: json['forecast']['forecastday'][0]['day']['avgtemp_c'].toDouble(),
      pressure: json['current']['pressure_mb'].toDouble(),
      wind: json['current']['wind_kph'].toDouble(),
      visibility: json['current']['vis_km'].toDouble(),
      cloudCover: json['current']['cloud'],
      hourlyForecasts: hourlyList, // Add this line
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
      'humidity': humidity,
      'avgTemp': avgTemp,
      'pressure': pressure,
      'wind': wind,
      'visibility': visibility,
      'cloudCover': cloudCover,
      // You can add hourly forecasts here if needed
    };
  }
}