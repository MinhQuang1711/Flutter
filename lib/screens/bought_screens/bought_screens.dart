import 'package:flutter/material.dart';

import 'bought_screen_body.dart';

class BoughtScreens extends StatelessWidget {
  const BoughtScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_outlined, color: Colors.orange),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: BoughtScreensBody(),
      ),
    );
  }
}
