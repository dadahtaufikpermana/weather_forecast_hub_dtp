import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../routes/routes.dart';
import '../../../utils/provider/weather_provider.dart';

class ItemWeather extends StatelessWidget {
  final int index;

  ItemWeather({required this.index});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final weatherProvider = Provider.of<WeatherProvider>(context);

    return GestureDetector(
      onTap: () {
        print('Item Tapped: $index');
        Navigator.pushNamed(
          context,
          Routes.weatherDetailsScreen,
          arguments: weatherProvider.getWeatherDataAtIndex(index),
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
                  child: Image.network(
                    weatherProvider.getWeatherIconCode(index),
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
                    weatherProvider.getDateTime(index),
                    style: theme.textTheme.subtitle1!.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(weatherProvider.getWeatherMainAtIndex(index)),
                  ),
                  Text('Temp: ${weatherProvider.temperature(index)}°C'),
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
}
