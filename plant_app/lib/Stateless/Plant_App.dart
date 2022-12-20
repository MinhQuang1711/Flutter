import 'package:flutter/material.dart';
import '../Home/HomeScreens/Plant_App_Screen.dart';
import 'package:plant_app/Const_Color/Const_Color.dart';

class Plant_App extends StatelessWidget {
  const Plant_App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: PrimaryColor,
      ),
      home: Plant_App_Screen(),
    );
  }
}
