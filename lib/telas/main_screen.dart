import 'package:flutter/material.dart';
import 'package:teadloginpage/sign_up_form.dart';
import '../animation_button_to_form.dart';
import '../login_form.dart';
import '../uteis/utils.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          top: 150,
          child: Image.asset(
            "assets/images/arvore_logo_tead_600X600.png",
            width: 200,
            height: 200,
          ),
        ),
        const Positioned(
          bottom: 180,
          child: ButtonToLoginForm(
              formHeight: Utils.loginFormHeight,
              childWidget: LoginForm(),
              buttonText: Text("LOGIN", style: Utils.buttonTextStyle),
              color: Colors.red),
        ),
        ButtonToLoginForm(
          formHeight: Utils.signUpFormHeight,
          childWidget: SignUpButton(),
          buttonText: const Text("CADASTRE-SE", style: Utils.buttonTextStyle),
          color: Colors.grey,
        ),
      ],
    ));
  }
}
