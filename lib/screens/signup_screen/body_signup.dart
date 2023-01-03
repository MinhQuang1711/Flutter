import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../custom_widget/custom_button.dart';
import '../../custom_widget/custom_textfields.dart';
import '../signin_screen/signin.dart';

class BodySignUp extends StatefulWidget {
  const BodySignUp({Key? key}) : super(key: key);

  @override
  State<BodySignUp> createState() => _BodySignUpState();
}

class _BodySignUpState extends State<BodySignUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 30,
          ),
          const Text(
            "Let's Get Started!",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Create an account to QAliure to get feature",
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(
            height: 30,
          ),
          CustomTextFields(
              controllrer: nameController,
              icon: Icons.person_outline_rounded,
              size: size,
              colorOutline: Colors.blue,
              circular: 30,
              hindtext: 'Name',
              obs: false),
          CustomTextFields(
              controllrer: emailController,
              icon: Icons.email_outlined,
              size: size,
              colorOutline: Colors.blue,
              circular: 30,
              hindtext: 'Email',
              obs: false),
          CustomTextFields(
              controllrer: phoneController,
              icon: Icons.phone_android,
              size: size,
              colorOutline: Colors.blue,
              circular: 30,
              hindtext: 'Phone',
              obs: false),
          CustomTextFields(
              controllrer: passwordController,
              icon: Icons.password,
              size: size,
              colorOutline: Colors.blue,
              circular: 30,
              hindtext: 'Password',
              obs: true),
          CustomTextFields(
              controllrer: confirmPasswordController,
              icon: Icons.password,
              size: size,
              colorOutline: Colors.blue,
              circular: 30,
              hindtext: 'Confirm Password',
              obs: true),
          CustomButton(
              sizeWidth: size.width * 0.5,
              sizeHeight: size.width * 0.1,
              circular: 30,
              backgroundColor: Colors.blue,
              content: const Text('CREATE'),
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                prefs.setString('Email: ', emailController.text);
                prefs.setString('Password: ', passwordController.text);
                prefs.setString('Phone', phoneController.text);
                prefs.setString('Name: ', nameController.text);
              }),
          SizedBox(
            height: 35,
          ),
          RichText(
              text: TextSpan(children: <TextSpan>[
            TextSpan(text: 'Already have an account? '),
            TextSpan(
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignIn()));
                  },
                text: 'SigIn',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.blue))
          ]))
        ],
      ),
    );
  }
}
