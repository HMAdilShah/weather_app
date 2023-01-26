import 'package:flutter/material.dart';

import '../models/Weather.dart';

class WeatherDisplay extends StatelessWidget {
  final Weather? weather;

  WeatherDisplay({required this.weather});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          weather!.city!,
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Text(
          weather!.condition!,
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(height: 8),
        Text(
          '${weather!.temperature!.toStringAsFixed(1)}°C',
          style: TextStyle(fontSize: 64, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Min: ${weather!.minTemperature!.toStringAsFixed(1)}°C',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(width: 16),
            Text(
              'Max: ${weather!.maxTemperature!.toStringAsFixed(1)}°C',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ],
    );
  }
}
