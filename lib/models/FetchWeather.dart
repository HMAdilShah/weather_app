import '../bloc/WeatherEvent.dart';

class FetchWeather extends WeatherEvent {
  final double latitude;
  final double longitude;
  FetchWeather({required this.latitude, required this.longitude});
}
