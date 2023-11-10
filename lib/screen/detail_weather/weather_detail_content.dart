import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../data/model/weather_forecast.dart';

class WeatherDetailContent extends StatelessWidget {
  final WeatherData weatherData;

  const WeatherDetailContent({Key? key, required this.weatherData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Details'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              DateFormat('EEEE, MMMM d, y').format(weatherData.dateTime),
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 8),
          Text(
            DateFormat('h:mm a').format(weatherData.dateTime),
            style: TextStyle(fontSize: 16),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 36),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${(weatherData.temperature - 273.15).toStringAsFixed(2)}°C',
                  style: TextStyle(fontSize: 46, fontWeight: FontWeight.bold),
                ),

                SizedBox(width: 8),
                Image.network(
                  'https://openweathermap.org/img/wn/${weatherData.weatherIcon}@2x.png',
                  width: 60,
                  height: 60,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 36),
            child: Text(
              '${weatherData.weatherMain} (${weatherData.weatherDescription})',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 26),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '${(weatherData.tempMin- 273.15).toStringAsFixed(2)}°C',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '${(weatherData.tempMax- 273.15).toStringAsFixed(2)}°C',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
