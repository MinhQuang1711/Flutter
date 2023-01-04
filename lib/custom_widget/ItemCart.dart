import 'package:flutter/material.dart';
import 'package:homework2/product_model/product_model.dart';
import 'package:provider/provider.dart';

import '../provider/badge_provider.dart';

class ItemCart extends StatelessWidget {
  ItemCart({required this.model, Key? key}) : super(key: key);
  ProductModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 110,
                width: 110,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    image: DecorationImage(image: AssetImage(model.imageUrl))),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.productName,
                      style: TextStyle(color: Colors.black),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '\$ ${model.price}',
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
                  context.read<BadgeProvider>().add();
                },
                child: Icon(Icons.add),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5))),
              ),
              Container(height: 20, width: 10, child: Text('${'0'}')),
              OutlinedButton(
                  onPressed: () {
                    context.read<BadgeProvider>().remove();
                  },
                  child: Icon(Icons.minimize_sharp))
            ],
          ),
        ],
      ),
    );
  }
}
