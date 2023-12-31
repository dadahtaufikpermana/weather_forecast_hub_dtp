import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_forecast_hub_dtp/extensions/context_extensions.dart';

import '../utils/provider/weather_provider.dart';
import '../utils/style.dart';

class ButtonWidget extends StatelessWidget {
  final VoidCallback onPress;
  final String title;
  final Color buttonColor, titleColor, borderColor;
  final double paddingVertical, paddingHorizontal;

  const ButtonWidget({
    super.key,
    required this.onPress,
    required this.title,
    required this.buttonColor,
    required this.titleColor,
    required this.borderColor,
    required this.paddingVertical,
    required this.paddingHorizontal,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(
      builder: (context, preferenceSettingsProvider, _) {
        return ElevatedButton(
          onPressed: onPress,
          style: ElevatedButton.styleFrom(
            side: BorderSide(
              width: 1.0,
              color: borderColor,
            ),
            backgroundColor: buttonColor,
            alignment: Alignment.center,
            shadowColor: grayColor,
            elevation: 0,
            padding: EdgeInsets.symmetric(
              vertical: paddingVertical,
              horizontal: paddingHorizontal,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          child: SizedBox(
            width: double.infinity,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: context.theme.textTheme.button?.copyWith(
                fontWeight: FontWeight.w700,
                color: titleColor,
              ),
            ),
          ),
        );
      },
    );
  }
}
