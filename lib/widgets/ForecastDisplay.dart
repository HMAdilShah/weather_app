import 'package:flutter/material.dart';

import '../models/Forecast.dart';

class ForecastDisplay extends StatelessWidget {
  final List<Forecast>? forecastList;

  ForecastDisplay({@required this.forecastList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: forecastList!.length,
        itemBuilder: (BuildContext context, int index) {
          final forecast = forecastList?.elementAt(index);
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Text(forecast!.date.toString()),
                  SizedBox(height: 8),
                  Text(forecast.condition!),
                  SizedBox(height: 8),
                  Text(
                      'Temperature: ${forecast.temperature!.toStringAsFixed(1)}°C'),
                ],
              ),
            ),
          );
        });
  }
}
