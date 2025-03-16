import 'package:flutter/material.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'There is no weather data,\ntry to search by city name',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.red,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}