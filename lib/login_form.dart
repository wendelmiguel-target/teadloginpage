import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<StatefulWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(children: <Widget>[
      TextFormField(
        decoration: const InputDecoration(
          hintText: 'Enter your email',
        ),
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: ElevatedButton(
          onPressed: () {
            // Validate will return true if the form is valid, or false if
            // the form is invalid.
            if (_formKey.currentState!.validate()) {
              // Process data.
            }
          },
          child: const Text('Submit'),
        ),
      )
    ]));
  }
}