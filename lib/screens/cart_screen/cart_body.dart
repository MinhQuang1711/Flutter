import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:homework2/custom_widget/ItemCart.dart';
import 'package:homework2/provider/cart_provider.dart';
import 'package:homework2/screens/bought_screens/bought_screens.dart';
import 'package:provider/provider.dart';

class CartBody extends StatelessWidget {
  const CartBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final cart = Provider.of<CartProvider>(context);
    var itemCart = cart.listCart;
    return Column(
      children: [
        Container(
          height: 40,
          width: size.width,
          child: Row(
            children: [
              Expanded(
                  child: Center(
                      child: GestureDetector(
                child: const Text(
                  "Giỏ hàng",
                ),
                onTap: () {},
              ))),
              Expanded(
                  child: Center(
                      child: GestureDetector(
                child: const Text('Đã mua'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => BoughtScreens()));
                },
              )))
            ],
          ),
        ),
        Expanded(
          flex: 5,
          child: ListView.builder(
            itemCount: itemCart.length,
            itemBuilder: (context, index) {
              return ItemCart(model: itemCart[index]);
            },
          ),
        ),
      ],
    );
  }
}
