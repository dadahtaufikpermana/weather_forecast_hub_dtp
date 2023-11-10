import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_forecast_hub_dtp/extensions/context_extensions.dart';

import '../../../utils/provider/weather_provider.dart';
import '../../../utils/style.dart';
import '../../../widget/button_signin_widget.dart';

class ButtonSigninWith extends StatelessWidget {
  final bool positionButtom;

  const ButtonSigninWith({
    Key? key,
    required this.positionButtom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(
      builder: (context, preferenceSettingsProvider, _) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ButtonSigninWidget(
                onPress: () => context.showCustomFlashMessage(
                  status: 'info',
                  positionBottom: positionButtom,
                ),
                title: 'PHONE NUMBER',
                icon: 'assets/icons/handphone.png',
                buttonColor: whiteColor,
                titleColor: blackColor,
                shadowColor: grayColor20,
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: ButtonSigninWidget(
                onPress: () => context.showCustomFlashMessage(
                  status: 'info',
                  positionBottom: positionButtom,
                ),
                title: 'GOOGLE',
                icon: 'assets/icons/google.png',
                buttonColor:  whiteColor,
                titleColor:blackColor,
                shadowColor:  grayColor20,
              ),
            ),
          ],
        );
      },
    );
  }
}
