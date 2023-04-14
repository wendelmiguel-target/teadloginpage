import 'package:flutter/material.dart';

import 'login_form.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<StatefulWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  bool selected = false;
  double logoOpacity = 0.0;

  Future<void> changeLogoOpacity() async {
    if (selected) {
      await Future.delayed(const Duration(milliseconds: 500));
    }
    setState(() {
      logoOpacity = logoOpacity == 0.0 ? 1.0 : 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
        });
        changeLogoOpacity();
      },
      child: Center(
          child: Stack(alignment: Alignment.center, children: <Widget>[
        AnimatedAlign(
          alignment: selected ? Alignment.center : const Alignment(0, 0.7),
          duration: const Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          child: AnimatedContainer(
              duration: const Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
              width: selected ? 350 : 200,
              height: selected ? 300 : 80,
              padding: const EdgeInsets.only(
                top: 10,
                left: 20,
                right: 20,
                bottom: 10,
              ),
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(10)),
              child: selected
                  ? const LoginForm()
                  : const Text('Lgin', selectionColor: Colors.black)),
        ),
        Positioned(
          top: 150,
          child: AnimatedOpacity(
            duration: const Duration(seconds: 2),
            opacity: logoOpacity,
            curve: Curves.fastOutSlowIn,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                'assets/images/LogoTEAD.png',
                width: 90,
                height: 90,
              ),
            ),
          ),
        ),
      ])),
    );
  }
}
