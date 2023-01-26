import 'package:flutter/material.dart';
import 'package:weather_app/models/FetchWeather.dart';

import '../bloc/WeatherBloc.dart';
import '../bloc/WeatherState.dart';
import '../models/Weather.dart';
import '../repositories/WeatherApi.dart';
import '../widgets/WeatherDisplay.dart';
import 'ErrorScreen.dart';
import 'LoadingScreen.dart';
import 'package:http/http.dart' as http;

class WeatherScreen extends StatefulWidget {
  final WeatherBloc weatherBloc;

  WeatherScreen({required this.weatherBloc});
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final WeatherApi weatherApi = WeatherApi(
    apiKey: 'YOUR_API_KEY',
    httpClient: http.Client(),
  );

  final WeatherBloc _weatherBloc = WeatherBloc(weatherApi: WeatherApi(apiKey: 'YOUR_API_KEY'));

  @override
  void initState() {
    super.initState();
    _weatherBloc.fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<WeatherState>(
        stream: _weatherBloc.state,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data is WeatherLoading) {
              return LoadingScreen();
            } else if (snapshot.data is WeatherLoaded) {
              return WeatherDisplay(weather: snapshot.data!.currentWeather);
            } else if (snapshot.data is WeatherError) {
              return ErrorScreen(errorMessage: snapshot.data!.error);
            }
          }
          return Container();
        },
      ),
    );
  }

  @override
  void dispose() {
    _weatherBloc.dispose();
    super.dispose();
  }
}

