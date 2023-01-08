import 'package:flutter/material.dart';
import 'package:homework2/custom_widget/ItemCart.dart';
import 'package:homework2/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class CartBody extends StatelessWidget {
  const CartBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    var itemCart = cart.listCart;
    return ListView.builder(
      itemCount: itemCart.length,
      itemBuilder: (context, index) {
        return ItemCart(model: itemCart[index]);
      },
    );
  }
}
