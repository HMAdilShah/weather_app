import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/Forecast.dart';
import '../models/Weather.dart';

 class WeatherApi {
   final http.Client _httpClient;
   final String _apiKey;

   WeatherApi({http.Client? httpClient, required String apiKey})
      : _httpClient = httpClient ?? http.Client(),
        _apiKey = apiKey;

  Future<Weather> getCurrentWeather(double? latitude, double? longitude) async {
    final url = 'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$_apiKey';
    final response = await _httpClient.get(Uri.parse(url));
    if (response.statusCode != 200) {
      throw Exception('Failed to load weather');
    }
    final jsonResponse = json.decode(response.body);
    return Weather.fromJson(jsonResponse);
  }

  Future<List<Forecast>> getForecastWeather(double latitude, double longitude) async {
    final url = 'https://api.openweathermap.org/data/2.5/forecast?lat=$latitude&lon=$longitude&appid=$_apiKey';
    final response = await _httpClient.get(Uri.parse(url));
    if (response.statusCode != 200) {
      throw Exception('Failed to load forecast weather');
    }
    final jsonResponse = json.decode(response.body);
    final forecastList = jsonResponse['list'] as List;
    return forecastList.map((e) => Forecast.fromJson(e)).toList();
  }
}
