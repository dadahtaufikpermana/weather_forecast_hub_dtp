import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_forecast_hub_dtp/screen/home_screen/widget/list_item_weather.dart';

import '../../utils/provider/prefference_setting_provider.dart';

class HomeContent extends StatefulWidget {
  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PreferenceSettingsProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Weather App'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Consumer<PreferenceSettingsProvider>(
              builder: (context, preferenceSettingsProvider, _) {
                return WeatherList();
              },
            ),
          ),
        ),
      ),
    );
  }
}
