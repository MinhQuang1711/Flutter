import 'package:flutter/material.dart';
import 'body_signin.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: BodyLogin(),
      ),
    );
  }
}
