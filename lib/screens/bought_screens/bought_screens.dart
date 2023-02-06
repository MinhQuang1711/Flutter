import 'package:flutter/material.dart';
import 'package:homework2/api/network_request.dart';
import 'package:homework2/product_model/pay_model.dart';

import 'bought_screen_body.dart';

class BoughtScreens extends StatefulWidget {
  const BoughtScreens({super.key});

  @override
  State<BoughtScreens> createState() => _BoughtScreensState();
}

class _BoughtScreensState extends State<BoughtScreens> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: BoughtScreensBody(),
      ),
    );
  }
}
