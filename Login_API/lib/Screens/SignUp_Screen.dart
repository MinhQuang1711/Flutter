import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled7/Blocs/BlocLogin/Login_Event.dart';
import 'package:untitled7/Blocs/Bloc_SignUp/SignUp_Event.dart';
import 'package:untitled7/Blocs/Bloc_SignUp/SignUp_State.dart';
import 'package:untitled7/Custom_Widget/Custom_Iconbutton.dart';
import 'package:untitled7/Custom_Widget/Custom_TextField.dart';
import 'package:untitled7/Custom_Widget/Custom_Button.dart';
import 'package:untitled7/Screens/Screen_Successful.dart';

import '../Blocs/BlocLogin/Login_Bloc.dart';
import '../Blocs/Bloc_SignUp/SignUp_Bloc.dart';

class SignUp_Screen extends StatefulWidget {
  const SignUp_Screen({Key? key}) : super(key: key);

  @override
  State<SignUp_Screen> createState() => _SignUp_ScreenState();
}

class _SignUp_ScreenState extends State<SignUp_Screen> {
  SignUp_Bloc? _signUp_Bloc;
  TextEditingController Email =
      TextEditingController(text: "eve.holt@reqres.in");
  TextEditingController Password = TextEditingController(text: "pistol");
  TextEditingController ConfirmPassword = TextEditingController();
  TextEditingController Name = TextEditingController();
  TextEditingController Job = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _signUp_Bloc = BlocProvider.of<SignUp_Bloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 140),
              CustomTextField(controller: Email, HindText: 'Enter your email'),
              SizedBox(height: 20),
              CustomTextField(
                  controller: Name,
                  obscure: false,
                  HindText: 'Enter your name'),
              SizedBox(height: 20),
              CustomTextField(
                  controller: Job, obscure: false, HindText: 'Enter your job'),
              SizedBox(height: 20),
              CustomTextField(
                  obscure: true,
                  controller: Password,
                  HindText: 'Enter your Password'),
              SizedBox(height: 20),
              CustomTextField(
                  obscure: true,
                  controller: ConfirmPassword,
                  HindText: 'Comfirm your password'),
              SizedBox(height: 35),
              BlocListener<SignUp_Bloc, SignUp_State>(
                listener: (context, state) {
                  if (state is SignUp_Successful) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Login_Successful();
                    }));
                  }
                },
                child: Custombutton(
                    text: 'Sign Up',
                    onPressed: () {
                      print('touched');
                      _signUp_Bloc?.add(SignUp_Event(
                          Email: Email.text,
                          Password: Password.text,
                          Name: Name.text,
                          Job: Job.text));
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
