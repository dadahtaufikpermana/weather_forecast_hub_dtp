import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_forecast_hub_dtp/screen/home_screen/widget/list_item_weather.dart';
import 'package:weather_forecast_hub_dtp/utils/provider/weather_provider.dart';

class HomeContent extends StatefulWidget {
  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Consumer<WeatherProvider>(
                builder: (context, weatherProvider, _) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Text(
                      weatherProvider.locationName,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              ),
              WeatherList(),
            ],
          ),
        ),
      ),
    );
  }
}
