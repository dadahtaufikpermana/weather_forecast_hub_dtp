import 'package:flutter/cupertino.dart';
import 'package:weather_forecast_hub_dtp/routes/routes.dart';
import 'package:weather_forecast_hub_dtp/screen/register/register_screen.dart';

import '../data/model/weather_forecast.dart';
import '../screen/detail_weather/detail_weather_screen.dart';
import '../screen/home_screen/home_screen.dart';
import '../screen/login/login_screen.dart';
import '../screen/splash/splash_screen.dart';
import '../screen/welcome/welcome_screen.dart';

Map<String, WidgetBuilder> routesApp = {
  Routes.splashScreen: (_) => SplashScreen(),
  Routes.welcomeScreen: (_) => const WelcomeScreen(),
  Routes.loginScreen: (_) => const LoginScreen(),
  Routes.registerScreen: (_) => const RegisterScreen(),
  Routes.homeScreen: (_) => const HomeScreen(),
  Routes.weatherDetailsScreen: (context) => WeatherDetailsScreen(
    weatherData: ModalRoute.of(context)!.settings.arguments as WeatherData,
  ),
};
