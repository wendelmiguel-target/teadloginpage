import 'package:flutter/material.dart';

import 'login_form.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<StatefulWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: Center(
          child: AnimatedAlign(
        alignment: selected ? Alignment.center : const Alignment(0, 0.7),
        duration: const Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
        child: AnimatedContainer(
            duration: const Duration(seconds: 1),
            curve: Curves.fastOutSlowIn,
            width: selected ? 350 : 200,
            height: selected ? 300 : 80,
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(10)),
            child: selected
                ? const LoginForm()
                : const Text('World', selectionColor: Colors.black)),
      )),
    );
  }
}
