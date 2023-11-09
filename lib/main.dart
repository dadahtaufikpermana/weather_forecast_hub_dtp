import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_forecast_hub_dtp/routes/register_routes.dart';
import 'package:weather_forecast_hub_dtp/routes/routes.dart';
import 'package:weather_forecast_hub_dtp/utils/navigation.dart';
import 'package:weather_forecast_hub_dtp/utils/provider/prefference_setting_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PreferenceSettingsProvider(),
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
    return Consumer<PreferenceSettingsProvider>(
      builder: (context, preferenceSettingsProvider, _) {
        return MaterialApp(
          title: 'Weather Forecast Hub',
          theme: ThemeData.light(),
          navigatorKey: navigatorKey,
          initialRoute: Routes.welcomeScreen,
          routes: routesApp,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
