import 'package:flutter/material.dart';
import 'package:inspection/inspection.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../utils/access_form_field.dart';
import '../../../utils/provider/weather_provider.dart';
import '../../../widget/form_label_field_widget.dart';

class LoginFormWidget extends StatefulWidget {
  final TextEditingController emailController, passwordController;

  const LoginFormWidget({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  bool passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(
      builder: (context, preferenceSettingsProvider, _) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AccesorFormFiled(
              hintText: 'Your Email',
              controller: widget.emailController,
              validator: (e) => inspection(
                e,
                'required|email',
                message: 'Field is Required & Type is Email',
              ),
              child: const FormLabelFieldWidget(label: 'E-mail'),
            ),
            const SizedBox(height: 20.0),
            AccesorFormFiled(
              hintText: 'Your Password',
              controller: widget.passwordController,
              obscureText: passwordVisible,
              showObscureToggle: true,
              onPressSufixobscureTextIcon: () {
                setState(() {
                  passwordVisible = !passwordVisible;
                });
              },
              textInputAction: TextInputAction.done,
              validator: (e) => inspection(
                e,
                'required',
                message: 'Field is Required',
                locale: Intl.getCurrentLocale(),
              ),
              child: const FormLabelFieldWidget(
                label: 'Password',
              ),
            ),
          ],
        );
      },
    );
  }
}
