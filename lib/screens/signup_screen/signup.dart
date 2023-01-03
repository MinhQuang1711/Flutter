import 'package:flutter/material.dart';

import 'body_signup.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.keyboard_return),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: BodySignUp(),
      ),
    );
  }
}
