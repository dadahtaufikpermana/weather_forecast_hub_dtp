import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_forecast_hub_dtp/routes/register_routes.dart';
import 'package:weather_forecast_hub_dtp/routes/routes.dart';
import 'package:weather_forecast_hub_dtp/utils/navigation.dart';
import 'package:weather_forecast_hub_dtp/utils/provider/weather_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => WeatherProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<WeatherProvider>().initializeWeatherData();

    return Consumer<WeatherProvider>(
      builder: (context, weatherProvider, _) {
        return MaterialApp(
          title: 'Weather Forecast Hub',
          theme: ThemeData.light(),
          navigatorKey: navigatorKey,
          initialRoute: Routes.splashScreen,
          routes: routesApp,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}

