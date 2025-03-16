class WeatherEntity {
  final String cityName;
  final DateTime date;
  final String image;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String weatherCondition;
  final int humidity;
  final double avgTemp;
  final double pressure;
  final double wind;
  final double visibility;
  final int cloudCover;
  final List<HourlyForecast> hourlyForecasts;

  const WeatherEntity({
    required this.cityName,
    required this.date,
    required this.image,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherCondition,
    required this.humidity,
    required this.avgTemp,
    required this.pressure,
    required this.wind,
    required this.visibility,
    required this.cloudCover,
    required this.hourlyForecasts,
  });
}class HourlyForecast {
  final String time;
  final double temp;
  final String condition;
  final String icon;

  const HourlyForecast({
    required this.time,
    required this.temp,
    required this.condition,
    required this.icon,
  });
}