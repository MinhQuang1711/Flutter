import 'package:flutter/material.dart';

import '../../custom_widget/custom_button.dart';
import '../signin_screen/signin.dart';
import '../signup_screen/signup.dart';

class BodyMyApp extends StatefulWidget {
  const BodyMyApp({Key? key}) : super(key: key);

  @override
  State<BodyMyApp> createState() => _BodyMyAppState();
}

class _BodyMyAppState extends State<BodyMyApp> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        children: <Widget>[
          SizedBox(height: size.height * 0.8),
          CustomButton(
              sizeHeight: size.height * 0.08,
              sizeWidth: size.width * 0.73,
              circular: 30,
              backgroundColor: Colors.blueAccent,
              content: const Text('Sign In'),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => SignIn()));
              }),
          const SizedBox(height: 5),
          CustomButton(
              sizeHeight: size.height * 0.08,
              sizeWidth: size.width * 0.73,
              circular: 30,
              backgroundColor: Colors.redAccent,
              content: const Text('Sign Up'),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => SignUp()));
              })
        ],
      ),
    );
  }
}
