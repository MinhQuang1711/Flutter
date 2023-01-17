import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CartOrderDetail extends StatelessWidget {
  CartOrderDetail(
      {required this.imageUrl,
      required this.price,
      required this.productName,
      required this.quantity,
      super.key});
  String imageUrl;
  String productName;
  int quantity;
  double price;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 80,
                width: 80,
                child: Image.asset(imageUrl),
              ),
              SizedBox(width: 15),
              Container(
                  margin: EdgeInsets.only(right: 20), child: Text(productName)),
              Container(
                margin: EdgeInsets.only(right: 20),
                child: Text('x${quantity}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.red,
                    )),
              ),
              Spacer(),
              Container(
                margin: EdgeInsets.only(right: 20, top: 30),
                child: Text('\$ ${price}',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
