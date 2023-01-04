import 'package:flutter/material.dart';
import 'package:homework2/custom_widget/custom_button.dart';
import 'bottom_bar.dart';
import 'cart_body.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.yellow.shade700,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_outlined, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text('Giỏ hàng'),
        ),
        body: CartBody(),
        bottomNavigationBar: BottomBar(),
      ),
    );
  }
}
