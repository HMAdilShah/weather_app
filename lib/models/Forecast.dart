class Forecast {
  final DateTime? date;
  final double? temperature;
  final double? minTemperature;
  final double? maxTemperature;
  final int? humidity;
  final String? condition;
  final String? conditionIcon;

  Forecast({
    this.date,
    this.temperature,
    this.minTemperature,
    this.maxTemperature,
    this.humidity,
    this.condition,
    this.conditionIcon,
  });

  factory Forecast.fromJson(Map<String, dynamic> json) {
    return Forecast(
      date: DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000),
      temperature: json['main']['temp'],
      minTemperature: json['main']['temp_min'],
      maxTemperature: json['main']['temp_max'],
      humidity: json['main']['humidity'],
      condition: json['weather'][0]['main'],
      conditionIcon: json['weather'][0]['icon'],
    );
  }
}
