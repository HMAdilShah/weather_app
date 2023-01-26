import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/bloc/WeatherBloc.dart';
import 'package:weather_app/repositories/WeatherApi.dart';
import 'package:weather_app/screens/WeatherScreen.dart';

void main() {
  final WeatherApi weatherApi = WeatherApi(
    apiKey: 'YOUR_API_KEY',
    httpClient: http.Client(),
  );

  final WeatherBloc weatherBloc = WeatherBloc(weatherApi: weatherApi);
  runApp(MyApp(weatherBloc: weatherBloc));
}

class MyApp extends StatelessWidget {
  final WeatherBloc _weatherBloc;

  MyApp({required WeatherBloc weatherBloc})
      : assert(weatherBloc != null),
        _weatherBloc = weatherBloc;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      home: WeatherScreen(weatherBloc: _weatherBloc),
    );
  }
}
