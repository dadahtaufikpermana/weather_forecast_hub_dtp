import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_forecast_hub_dtp/extensions/context_extensions.dart';
import '../../data/service/auth_service.dart';
import '../../routes/routes.dart';
import '../../utils/provider/weather_provider.dart';
import '../../utils/style.dart';
import '../../widget/button_widget.dart';
import '../welcome/widgets/button_signin_widget.dart';
import 'widgets/login_form_widget.dart';

class LoginContent extends StatefulWidget {
  const LoginContent({super.key});

  @override
  State<LoginContent> createState() => _LoginContentState();
}

class _LoginContentState extends State<LoginContent> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  late TextEditingController _email;
  late TextEditingController _password;

  @override
  void initState() {
    super.initState();
    _email = TextEditingController();
    _password = TextEditingController();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  void onPressSignInButton() async {
    final AuthService authService = context.read<AuthService>();

    if (_formState.currentState?.validate() == true) {
      final result = await authService.signInWithEmailAndPassword(
        _email.text,
        _password.text,
      );

      if (result == null) {
        _email.clear();
        _password.clear();

        context.showCustomFlashMessage(
          status: 'success',
          title: 'Login Success!',
          positionBottom: false,
        );

        Navigator.pushNamed(context, Routes.homeScreen).then((_) {});
      } else {
        context.showCustomFlashMessage(
          status: 'error',
          title: 'Login Failed!',
          message: 'Error : email or password are wrong',
          positionBottom: false,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = context.theme;

    return Consumer<WeatherProvider>(
      builder: (context, preferenceSettingsProvider, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset('assets/images/sky_header.jpg'),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 37,
                    left: 27,
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    enableFeedback: false,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(14),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 8,
                              offset: const Offset(0, 3),
                            ),
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          size: 18,
                          color: blackColor80,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 60.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Sign In',
                    style: theme.textTheme.headline4!.copyWith(
                      fontSize: 34,
                      color:  blackColor20
                    ),
                  ),
                  const SizedBox(height: 38.0),
                  Form(
                    key: _formState,
                    child: LoginFormWidget(
                      emailController: _email,
                      passwordController: _password,
                    ),
                  ),
                  const SizedBox(height: 32.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 42.0),
                    child: ButtonWidget(
                      onPress: () => onPressSignInButton(),
                      title: 'LOGIN',
                      buttonColor: Colors.cyan,
                      titleColor: whiteColor,
                      borderColor: Colors.blue,
                      paddingHorizontal: 22.0,
                      paddingVertical: 22.0,
                    ),
                  ),
                  const SizedBox(height: 36.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: context.theme.textTheme.subtitle2!.copyWith(
                          color:  blackColor20,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      InkWell(
                        onTap: () => Navigator.pushNamed(
                          context,
                          Routes.registerScreen,
                        ),
                        child: Text(
                          'Sign Up',
                          style: context.theme.textTheme.subtitle2!.copyWith(
                            color: Colors.blue,
                            fontSize: 16,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.blue,
                            decorationThickness: 1.3,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 36.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 1,
                            color: grayColor20,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 16.0,
                            right: 16.0,
                          ),
                          child: Text(
                            'sign in with',
                            style: theme.textTheme.subtitle2!.apply(
                                color: blackColor20),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 1,
                            color: grayColor20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 18.0),
                  const ButtonSigninWith(
                    positionButtom: false,
                  ),
                  const SizedBox(height: 18.0),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
