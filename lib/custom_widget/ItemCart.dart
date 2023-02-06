import 'package:flutter/material.dart';
import 'package:homework2/product_model/cart_model.dart';
import 'package:homework2/product_model/product_model.dart';
import 'package:homework2/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class ItemCart extends StatelessWidget {
  ItemCart({required this.model, Key? key}) : super(key: key);
  CartModel model;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 110,
              width: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  image: DecorationImage(
                      image: AssetImage(model.productModel.imageUrl))),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.productModel.productName,
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '\$ ${model.productModel.price}',
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(width: 20),
                ],
              ),
            ),
            SizedBox(width: 100),
            OutlinedButton(
              onPressed: () {
                context.read<CartProvider>().addquantity(model);
                context.read<CartProvider>().count_item();
              },
              child: Icon(Icons.add),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5))),
            ),
            Container(
                height: 20, width: 10, child: Text(model.quantity.toString())),
            OutlinedButton(
                onPressed: () {
                  context.read<CartProvider>().removequantity(model);
                  context.read<CartProvider>().count_item();
                },
                child: Icon(Icons.minimize_sharp))
          ],
        ),
      ],
    );
  }
}
