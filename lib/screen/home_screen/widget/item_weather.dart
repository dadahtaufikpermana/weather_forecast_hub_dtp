import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_forecast_hub_dtp/extensions/context_extensions.dart';

import '../../../utils/style.dart';
import '../../detail_weather/detail_weather_screen.dart';

class ItemWeather extends StatelessWidget {
  final String iconUrl;

  ItemWeather({required this.iconUrl});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = context.theme;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => WeatherDetailsScreen()),
        );
      },
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
                child: ClipOval(
                  child: Image.asset(
                    iconUrl,
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _getCurrentDateTime(),
                    style: theme.textTheme.subtitle1!.copyWith(
                        color: blackColor, fontWeight: FontWeight.bold),
                  ),
                  Text('Clouds'),
                  Text('Temp: 25°C'),
                ],
              ),
            ],
          ),
          Divider(
            thickness: 1,
          ),
        ],
      ),
    );
  }

  String _getCurrentDateTime() {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('E, MMM d, y H:mm').format(now);

    return formattedDate;
  }
}
