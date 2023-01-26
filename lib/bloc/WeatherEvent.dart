abstract class WeatherEvent {
  const WeatherEvent();
}

class GetCurrentWeatherEvent extends WeatherEvent {
  final double? latitude;
  final double? longitude;

  GetCurrentWeatherEvent({this.latitude, this.longitude});
}

class GetForecastWeatherEvent extends WeatherEvent {
  final double? latitude;
  final double? longitude;

  GetForecastWeatherEvent({this.latitude, this.longitude});
}
