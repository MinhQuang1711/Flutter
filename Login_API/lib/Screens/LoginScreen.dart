import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled7/Blocs/BlocLogin/Login_Bloc.dart';
import 'package:untitled7/Blocs/BlocLogin/Login_Event.dart';
import 'package:untitled7/Blocs/BlocLogin/Login_State.dart';
import 'package:untitled7/Custom_Widget/Custom_Button.dart';
import 'package:untitled7/Custom_Widget/Custom_Iconbutton.dart';
import 'package:untitled7/Custom_Widget/Custom_TextField.dart';
import 'package:untitled7/Screens/Screen_Successful.dart';
import 'package:untitled7/StateLess/SignUp_Stateless.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obs = false;
  Auth_Bloc? _auth_bloc;
  final TextEditingController Email =
      new TextEditingController(text: "eve.holt@reqres.in");
  final TextEditingController Password =
      new TextEditingController(text: "cityslicka");
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _auth_bloc = BlocProvider.of<Auth_Bloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 140),
                CustomTextField(
                  controller: Email,
                  obscure: false,
                  HindText: 'Enter your Email',
                ),
                SizedBox(height: 30),
                CustomTextField(
                  iconbutton_custom: Custom_IconButtom(
                      Icondata: Icons.remove_red_eye_outlined,
                      onPressed: () {
                        print('touches');
                      }),
                  controller: Password,
                  obscure: !obs,
                  HindText: 'Enter your password',
                ),
                SizedBox(
                  height: 40,
                ),
                BlocListener<Auth_Bloc, Auth_State>(
                  listener: (context, state) {
                    if (state is AuthLoading) {
                      Center(
                        child: CircularProgressIndicator(
                          color: Colors.blue,
                        ),
                      );
                    } else {
                      if (state is AuthSuccessful) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Login_Successful();
                        }));
                      }
                    }
                  },
                  child: Custombutton(
                      text: 'Login',
                      onPressed: () {
                        _auth_bloc?.add(LoginEvent(
                            Email: Email.text, Password: Password.text));
                      }),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'You have no an acccount?',
                        style: TextStyle(fontSize: 13),
                      ),
                      GestureDetector(
                        child: Text(
                          'Sign up?',
                          style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 13,
                              fontWeight: FontWeight.bold),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUp_Stateless()),
                          );
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
