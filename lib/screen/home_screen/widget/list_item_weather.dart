import 'package:flutter/material.dart';

import 'item_weather.dart';

class WeatherList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 12,
      itemBuilder: (context, index) {
        return ItemWeather(
          iconUrl:
          'assets/icons/weather_logo.png',
        );
      },
    );
  }
}
