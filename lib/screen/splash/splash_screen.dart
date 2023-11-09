import 'dart:async';

import 'package:flutter/material.dart';
import 'package:weather_forecast_hub_dtp/utils/style.dart';

import '../../routes/routes.dart';
import '../../utils/navigation.dart';

class SplashScreen extends StatelessWidget {
  final duration = const Duration(seconds: 3);

  SplashScreen({Key? key}) : super(key: key) {
    handleOnInitialize();
  }

  void handleOnInitialize() async {
    Future.delayed(duration).then((_) {
      Navigator.pushNamed(
        Navigation.getContext(),
        Routes.welcomeScreen,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade900,
      body: SafeArea(
        child: Center(
          child: Image.asset(
            'assets/icons/weather_logo.png',
            height: 180,
          ),
        ),
      ),
    );
  }
}
