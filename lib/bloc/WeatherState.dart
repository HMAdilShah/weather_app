import '../models/Forecast.dart';
import '../models/Weather.dart';

class WeatherState {
  final Weather? currentWeather;
  final List<Forecast>? forecastWeather;
  final bool? isLoading;
  final String? error;

  WeatherState({
    this.currentWeather,
    this.forecastWeather,
    this.isLoading = false,
    this.error,
  });

  WeatherState copyWith({
    Weather? currentWeather,
    List<Forecast>? forecastWeather,
    bool? isLoading,
    String? error,
  }) {
    return WeatherState(
      currentWeather: currentWeather ?? this.currentWeather,
      forecastWeather: forecastWeather ?? this.forecastWeather,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

class WeatherInitialState extends WeatherState {
  WeatherInitialState() : super();
}

class WeatherLoadingState extends WeatherState {
  WeatherLoadingState() : super(isLoading: true);
}

class WeatherLoadedState extends WeatherState {
  WeatherLoadedState({Weather? currentWeather, List<Forecast>? forecastWeather})
      : super(currentWeather: currentWeather, forecastWeather: forecastWeather);
}

class WeatherErrorState extends WeatherState {
  WeatherErrorState({String? error}) : super(error: error);
}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final Weather weather;
  WeatherLoaded({required this.weather});
}

class WeatherError extends WeatherState {
  final String error;
  WeatherError({required this.error});
}