import 'package:flutter/material.dart';

class ItemCart extends StatelessWidget {
  ItemCart(
      {required this.productName,
      required this.price,
      required this.imageUrl,
      Key? key})
      : super(key: key);
  String? productName;
  double? price;
  String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 110,
              width: 110,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  image: DecorationImage(image: AssetImage(imageUrl!))),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productName!,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '\$ ${price}',
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.w400),
                  )
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
