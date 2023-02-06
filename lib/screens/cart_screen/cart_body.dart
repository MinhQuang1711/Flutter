import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:homework2/custom_widget/ItemCart.dart';
import 'package:homework2/provider/cart_provider.dart';
import 'package:homework2/screens/bought_screens/bought_screens.dart';
import 'package:provider/provider.dart';

import 'bottom_bar.dart';

class CartBody extends StatelessWidget {
  const CartBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final cart = Provider.of<CartProvider>(context);
    var itemCart = cart.listCart;
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: itemCart.length,
            itemBuilder: (context, index) {
              return ItemCart(model: itemCart[index]);
            },
          ),
        ),
        Container(alignment: Alignment.bottomCenter, child: BottomBar())
      ],
    );
  }
}
