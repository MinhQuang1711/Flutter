import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:homework2/custom_widget/ItemCart.dart';
import 'package:homework2/custom_widget/bought_product.dart';
import 'package:homework2/product_model/cart_model.dart';
import 'package:homework2/product_model/pay_model.dart';
import 'package:homework2/product_model/product_model.dart';
import 'package:homework2/provider/cart_provider.dart';
import 'package:homework2/screens/add_product_screen/add_product_screen.dart';
import 'package:homework2/screens/cart_screen/cart_screen.dart';
import 'package:homework2/screens/home_screen/home.dart';
import 'package:homework2/screens/start_screen/body_my_app.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(PayModelAdapter());
  Hive.registerAdapter(CartModelAdapter()); // REGISTER ADAPTER TO USE
  Hive.registerAdapter(ProductModelAdapter());

  var payBox2 = await Hive.openBox<Map<String, dynamic>>('payBox2');
  var cartBox = await Hive.openBox<CartModel>('cartModelBox'); // OPEN BOX
  var PayBox = await Hive.openBox<PayModel>('PayModelBox'); //OPEN BOX
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => CartProvider()),
  ], child: MaterialApp(debugShowCheckedModeBanner: false, home: Home())));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: BodyMyApp(),
      ),
    );
  }
}
