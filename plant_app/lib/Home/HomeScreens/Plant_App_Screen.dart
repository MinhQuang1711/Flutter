import 'package:flutter/material.dart';
import 'package:plant_app/Const_Color/Const_Color.dart';
import 'package:plant_app/Home/Component/Body.dart';

class Plant_App_Screen extends StatefulWidget {
  const Plant_App_Screen({Key? key}) : super(key: key);

  @override
  State<Plant_App_Screen> createState() => _Plant_App_ScreenState();
}

class _Plant_App_ScreenState extends State<Plant_App_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PrimaryColor,
        leading: IconButton(
          icon: Icon(Icons.menu_outlined),
          onPressed: () {},
        ),
      ),
      body: Body(),
    );
  }
}
