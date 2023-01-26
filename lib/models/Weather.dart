class Weather {
  final double? temperature;
  final double? minTemperature;
  final double? maxTemperature;
  final int? humidity;
  final int? pressure;
  final double? windSpeed;
  final String? condition;
  final String? conditionIcon;
  final String? city;
  final String? country;

  Weather({
    this.temperature,
    this.minTemperature,
    this.maxTemperature,
    this.humidity,
    this.pressure,
    this.windSpeed,
    this.condition,
    this.conditionIcon,
    this.city,
    this.country
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      temperature: json['main']['temp'],
      minTemperature: json['main']['temp_min'],
      maxTemperature: json['main']['temp_max'],
      humidity: json['main']['humidity'],
      pressure: json['main']['pressure'],
      windSpeed: json['wind']['speed'],
      condition: json['weather'][0]['main'],
      conditionIcon: json['weather'][0]['icon'],
      city: json['name'],
      country: json['sys']['country'],
    );
  }
}
