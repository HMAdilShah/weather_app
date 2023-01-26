import 'dart:async';

import '../models/Forecast.dart';
import '../models/Location.dart';
import '../models/Weather.dart';
import '../repositories/WeatherApi.dart';
import 'package:http/http.dart' as http;

import '../repositories/WeatherRepository.dart';
import 'WeatherState.dart';

class WeatherBloc {
  final WeatherApi weatherApi;

  WeatherBloc({required this.weatherApi});
  final _locationController = StreamController<Location>();
  final _stateController = StreamController<WeatherState>();
  final _weatherRepository = WeatherRepository(weatherApiClient: WeatherApi(apiKey: 'YOUR_API_KEY'));

  Stream<WeatherState> get state => _stateController.stream;

  void fetchWeather() async {
    final location = await _locationController.stream.first;
    _stateController.add(WeatherLoading());
    try {
      final weather = await _weatherRepository.getCurrentWeather(location.latitude, location.longitude);
      _stateController.add(WeatherLoaded(weather: weather));
    } catch (e) {
      _stateController.add(WeatherError(error: e.toString()));
    }
  }

  void dispose() {
    _locationController.close();
    _stateController.close();
  }
}
