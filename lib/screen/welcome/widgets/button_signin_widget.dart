import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_forecast_hub_dtp/extensions/context_extensions.dart';

import '../../../data/service/auth_service.dart';  // Pastikan import AuthService
import '../../../routes/routes.dart';
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
    final AuthService authService = context.read<AuthService>();  // Ambil AuthService dari provider

    return Consumer<WeatherProvider>(
      builder: (context, preferenceSettingsProvider, _) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ButtonSigninWidget(
                onPress: () async{
                  Navigator.pushNamed(context, Routes.phoneAuthScreen).then((_) {});
                },
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
                onPress: () async {
                  final result = await authService.signInWithGoogle();
                  if (result == null) {
                    context.showCustomFlashMessage(
                      status: 'success',
                      title: 'Login Success!',
                      positionBottom: false,
                    );

                    Navigator.pushNamed(context, Routes.homeScreen).then((_) {});
                    print('Login with Google successful!');
                  } else {
                    print('Login with Google Error: $result');
                    context.showCustomFlashMessage(
                      status: 'error',
                      title: 'Google Login Failed',
                      message: 'Error: $result',
                      positionBottom: positionButtom,
                    );
                  }
                },
                title: 'GOOGLE',
                icon: 'assets/icons/google.png',
                buttonColor: whiteColor,
                titleColor: blackColor,
                shadowColor: grayColor20,
              ),
            ),
          ],
        );
      },
    );
  }
}
