import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/provider/weather_provider.dart';
import 'item_weather.dart';

class WeatherList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);

    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: weatherProvider.forecastLength,
      itemBuilder: (context, index) {
        return ItemWeather(index: index);
      },
    );
  }
}
