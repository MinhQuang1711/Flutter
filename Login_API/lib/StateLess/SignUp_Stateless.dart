import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled7/Screens/SignUp_Screen.dart';

import '../Blocs/Bloc_SignUp/SignUp_Bloc.dart';
import '../Repositoty/Auth_Repo.dart';

class SignUp_Stateless extends StatelessWidget {
  const SignUp_Stateless({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => SignUp_Bloc(Auth_Repo()))
        ],
        child: MaterialApp(
          home: SignUp_Screen(),
          debugShowCheckedModeBanner: false,
        ));
  }
}
