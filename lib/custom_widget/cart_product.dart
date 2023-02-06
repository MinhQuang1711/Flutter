import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:homework2/product_model/cart_model.dart';
import 'package:homework2/product_model/product_model.dart';
import 'package:homework2/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class CardProduct extends StatelessWidget {
  CardProduct(
      {required this.productName,
      required this.imageurl,
      required this.ratingBar,
      required this.rating,
      required this.price,
      Key? key})
      : super(key: key);
  String productName;
  double rating;
  double price;
  String imageurl;
  RatingBar ratingBar;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            width: 200,
            height: 100,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    blurRadius: 50,
                    color: Colors.yellow.shade200,
                    offset: Offset(0, 10))
              ],
              image: DecorationImage(
                  image: AssetImage(imageurl), fit: BoxFit.cover),
              //color: Colors.yellow.withOpacity(0.2),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
          ),
          SizedBox(height: 10),
          Text(productName),
          SizedBox(height: 5),
          Expanded(child: ratingBar),
          SizedBox(height: 3),
          Row(
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: Text('Price: ${price}')),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(right: 15),
                child: IconButton(
                    onPressed: () {
                      context.read<CartProvider>().addquantity(CartModel(
                          ProductModel(productName, price, rating, imageurl)));
                      context.read<CartProvider>().count_item();
                    },
                    icon: Icon(
                      Icons.add_box,
                      color: Colors.yellow.shade600,
                    )),
              )
            ],
          )
        ],
      ),
    );
  }
}
