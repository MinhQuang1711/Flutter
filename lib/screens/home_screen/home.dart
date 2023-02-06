import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:homework2/main.dart';
import 'package:homework2/provider/cart_provider.dart';
import 'package:homework2/router/router.dart';
import 'package:homework2/screens/cart_screen/cart_screen.dart';
import 'package:provider/provider.dart';

import '../add_product_screen/add_product_screen.dart';
import 'bottom_bar.dart';
import 'home_body.dart';

const String cartScreen = "/cartScreen";

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context, value, child) {
      return MaterialApp(
        routes: <String, WidgetBuilder>{cartScreen: (context) => CartScreen(),
        addProduct:(context) => AddProductScreen()},
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            leadingWidth: 100,
            leading: Padding(
              padding: EdgeInsets.only(top: 18, left: 10),
              child: Padding(
                padding: const EdgeInsets.only(left: 25),
                child: const Text(
                  'MENU',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black),
                ),
              ),
            ),
            actions: <Widget>[
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.search),
                color: Colors.black,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15, top: 10),
                child: Badge(
                  badgeContent: Text('${value.quantity}'),
                  child: Builder(
                    builder: (context) => IconButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(cartScreen);
                      },
                      icon: Icon(Icons.shopping_cart),
                      color: Colors.black,
                    ),
                  ),
                ),
              )
            ],
          ),
          body: HomeBody(),
          bottomNavigationBar: HomeBottomBar(),
        ),
      );
    });
  }
}
