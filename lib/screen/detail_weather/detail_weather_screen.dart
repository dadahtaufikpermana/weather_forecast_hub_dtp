import 'package:flutter/material.dart';
import '../../data/model/weather_forecast.dart';
import 'weather_detail_content.dart';

class WeatherDetailsScreen extends StatelessWidget {
  final WeatherData weatherData;

  const WeatherDetailsScreen({Key? key, required this.weatherData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: WeatherDetailContent(weatherData: weatherData),
        ),
      ),
    );
  }
}
