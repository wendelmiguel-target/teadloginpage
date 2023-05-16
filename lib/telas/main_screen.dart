import 'package:flutter/material.dart';
import 'package:teadloginpage/sign_up_form.dart';
import 'animation_button_to_form.dart';
import 'login_form.dart';
import 'utils.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        const ButtonToLoginForm(
            formHeight: Utils.loginFormHeight,
            childWidget: LoginForm(),
            buttonText: Text("LOGIN", style: Utils.buttonTextStyle),
            color: Colors.red),
        ButtonToLoginForm(
          formHeight: Utils.signUpFormHeight,
          childWidget: SignUpButton(),
          buttonText: const Text("CADASTRE-SE", style: Utils.buttonTextStyle),
          color: Colors.grey,
        )
      ],
    ));
  }
}
