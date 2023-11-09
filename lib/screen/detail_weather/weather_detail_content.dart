import 'package:flutter/material.dart';

class WeatherDetailContent extends StatelessWidget {
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
              'Thursday, November 9, 2023',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 8),
          Text(
            '12:30 PM',
            style: TextStyle(fontSize: 16),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 36),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '25°C',
                  style: TextStyle(fontSize: 46, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 8),
                Image.asset(
                  'assets/icons/weather_logo.png',
                  width: 60,
                  height: 60,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 36),
            child: Text(
              'Clouds (few clouds)',
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
                      'Temp (Min)',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      '20°C',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Temp (Max)',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      '30°C',
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
