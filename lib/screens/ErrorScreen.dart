import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final String? errorMessage;

  ErrorScreen({this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Error'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.error, size: 64, color: Colors.red),
            SizedBox(height: 8),
            Text(errorMessage!),
            SizedBox(height: 8),
            FlatButton(
              onPressed: () {
                // retry fetching weather data
              },
              child: Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}
