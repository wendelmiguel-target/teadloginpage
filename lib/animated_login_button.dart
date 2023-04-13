import 'package:flutter/material.dart';

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
            width: selected ? 350 : 200,
            height: selected ? 300 : 80,
            duration: const Duration(seconds: 1),
            color: Colors.red,
            curve: Curves.fastOutSlowIn,
            child: const Text('Hello', selectionColor: Colors.black)),
      )),
    );
  }
}
