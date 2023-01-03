import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../custom_widget/custom_button.dart';
import '../../custom_widget/custom_textfields.dart';
import '../home_screen/home.dart';
import '../signup_screen/signup.dart';

class BodyLogin extends StatefulWidget {
  const BodyLogin({Key? key}) : super(key: key);

  @override
  State<BodyLogin> createState() => _BodyLoginState();
}

class _BodyLoginState extends State<BodyLogin> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: <Widget>[
            Container(
              width: size.width * 0.5,
              height: size.width * 0.5,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('asset/Image/imagelogin.jpg'),
                      fit: BoxFit.cover)),
            ),
            const Text(
              'Welcome back!',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            const SizedBox(height: 10),
            Text(
              'Login in to your existant account of Q Aliure ',
              style: TextStyle(fontSize: 14, color: Colors.grey.shade400),
            ),
            const SizedBox(height: 10),
            CustomTextFields(
                controllrer: emailController,
                obs: false,
                icon: Icons.person_outline_rounded,
                size: size,
                colorOutline: Colors.blue,
                circular: 30,
                hindtext: 'Enter your email'),
            CustomTextFields(
                controllrer: passwordController,
                obs: true,
                icon: Icons.password,
                size: size,
                colorOutline: Colors.blue,
                circular: 30,
                hindtext: 'Enter your password'),
            Row(children: <Widget>[
              SizedBox(
                width: size.width * 0.8,
              ),
              GestureDetector(
                  child: const Text('Forgot Password?',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 10)),
                  onTap: () {
                    print('Tabed');
                  })
            ]),
            const SizedBox(
              height: 30,
            ),
            CustomButton(
                sizeHeight: size.height * 0.05,
                sizeWidth: size.width * 0.4,
                circular: 30,
                backgroundColor: Colors.blue,
                content: const Text(
                  'LOG IN',
                  style: TextStyle(fontWeight: FontWeight.w900),
                ),
                onPressed: () async {
                  if (emailController.text == 'Phamminhquang@gmail.com' &&
                      passwordController.text == '123') {
                    final prefs = await SharedPreferences.getInstance();
                    prefs.setString('Email:', emailController.text);
                    prefs.setString('Password: ', passwordController.text);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Home()));
                  } else {
                    print('error');
                  }
                  /*final prefs = await SharedPreferences.getInstance();
                  prefs.setString('Email:', emailController.text);
                  prefs.setString('Password: ', passwordController.text);*/
                }),
            const SizedBox(height: 40),
            const Text(
              'OR CONNECT USING ',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                const SizedBox(
                  width: 60,
                ),
                ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    onPressed: () {},
                    child: Container(
                      margin: EdgeInsets.only(left: 30, right: 30),
                      width: size.width * 0.17,
                      height: size.height * 0.05,
                      child: Center(
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.facebook_outlined),
                            const Text(
                              'Facebook',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    )),
                SizedBox(width: size.width * 0.1),
                ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    onPressed: () {},
                    child: Container(
                      width: size.width * 0.27,
                      height: size.height * 0.05,
                      child: Center(
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.email_outlined),
                            const Text(
                              'Google',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ))
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            RichText(
                text: TextSpan(children: <TextSpan>[
              const TextSpan(text: "Don't have an account?"),
              TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignUp()));
                    },
                  text: 'Sign Up',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.blue))
            ])),
          ],
        ),
      ),
    );
  }
}
