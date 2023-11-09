import 'package:flutter/cupertino.dart';
import 'package:weather_forecast_hub_dtp/routes/routes.dart';
import 'package:weather_forecast_hub_dtp/screen/register/register_screen.dart';

import '../screen/home_screen/home_screen.dart';
import '../screen/login/login_screen.dart';
import '../screen/splashscreen/splash_screen.dart';
import '../screen/welcome/welcome_screen.dart';

Map<String, WidgetBuilder> routesApp = {
  Routes.splashScreen: (_) => SplashScreen(),
  Routes.welcomeScreen: (_) => const WelcomeScreen(),
  Routes.loginScreen: (_) => const LoginScreen(),
  Routes.registerScreen: (_) => const RegisterScreen(),
  Routes.homeScreen: (_) => const HomeScreen(),
};
