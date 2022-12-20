import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled7/Blocs/BlocLogin/Login_Bloc.dart';
import 'package:untitled7/Repositoty/Auth_Repo.dart';
import 'package:flutter/material.dart';
import 'package:untitled7/Screens/LoginScreen.dart';

class LoginStateless extends StatelessWidget {
  const LoginStateless({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [BlocProvider(create: (context) => Auth_Bloc(Auth_Repo()))],
        child: MaterialApp(
          home: LoginScreen(),
          debugShowCheckedModeBanner: false,
        ));
  }
}
