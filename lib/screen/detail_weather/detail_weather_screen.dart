import 'package:flutter/material.dart';
import 'package:weather_forecast_hub_dtp/screen/detail_weather/weather_detail_content.dart';

class WeatherDetailsScreen extends StatelessWidget {
  const WeatherDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: WeatherDetailContent(),
        ),
      ),
    );
  }
}
