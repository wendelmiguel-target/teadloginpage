import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<StatefulWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isVisible = false;

  final ButtonStyle _loginButtonStyle = ElevatedButton.styleFrom(
    minimumSize: const Size(300, 50),
    padding: const EdgeInsets.all(16),
    foregroundColor: Colors.white,
    backgroundColor: const Color.fromARGB(255, 201, 27, 15),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
  );

  Future<void> loginButtonAnimatedOpacityFutureDelayed() async {
    await Future.delayed(const Duration(milliseconds: 500));
    if (mounted) {
      setState(() {
        isVisible = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    loginButtonAnimatedOpacityFutureDelayed();
    return Form(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
      TextFormField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: Color.fromARGB(255, 160, 0, 0)),
              borderRadius: BorderRadius.circular(20)),
          icon: const Icon(Icons.alternate_email),
          hintText: 'Insira seu email',
        ),
        validator: (String? value) {
          if (value == null) {
            return 'Please enter some text';
          }
          return null;
        },
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: TextFormField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color.fromARGB(255, 160, 0, 0)),
                borderRadius: BorderRadius.circular(20)),
            icon: const Icon(Icons.password),
            hintText: 'Senha',
          ),
          keyboardType: TextInputType.visiblePassword,
          obscureText: true,
          validator: (String? value) {
            if (value == null) {
              return 'Please enter some text';
            }
            return null;
          },
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: AnimatedOpacity(
          duration: const Duration(seconds: 2),
          opacity: isVisible ? 1.0 : 0.0,
          curve: Curves.fastOutSlowIn,
          child: ElevatedButton(
            onPressed: () {
              // Validate will return true if the form is valid, or false if
              // the form is invalid.
              if (_formKey.currentState!.validate()) {
                // Process data.
              }
            },
            style: _loginButtonStyle,
            child: const Text('Login'),
          ),
          onEnd: () {
            setState(() {
              if (!isVisible) {
                isVisible = false;
              }
            });
          },
        ),
      )
    ]));
  }
}
