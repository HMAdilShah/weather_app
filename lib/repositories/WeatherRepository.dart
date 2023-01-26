import '../models/Forecast.dart';
import '../models/Weather.dart';
import 'WeatherApi.dart';

class WeatherRepository {
  final WeatherApi weatherApiClient;

  WeatherRepository({required this.weatherApiClient})
      : assert(weatherApiClient != null);

  Future<Weather> getCurrentWeather(double? latitude, double? longitude) async {
    final weather = await weatherApiClient.getCurrentWeather(latitude, longitude);
    return weather;
  }

  Future<List<Forecast>> getForecastWeather(double latitude, double longitude) async {
    final forecast = await weatherApiClient.getForecastWeather(latitude, longitude);
    return forecast;
  }
}
