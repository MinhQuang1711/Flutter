import 'package:flutter/material.dart';

import '../../../../Const_Color/Const_Color.dart';

class ProductNameWithPrice extends StatelessWidget {
  ProductNameWithPrice(
      {required this.ProductName,
      required this.Country,
      required this.Price,
      Key? key})
      : super(key: key);
  final String ProductName;
  final String Country;
  final int Price;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      child: Row(
        children: <Widget>[
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: ProductName + '\n',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
            TextSpan(
                text: Country.toUpperCase(),
                style: TextStyle(
                    color: PrimaryColor.withOpacity(0.7), fontSize: 13))
          ])),
          Spacer(),
          Text(
            '${Price}',
            style: TextStyle(color: PrimaryColor, fontWeight: FontWeight.w500),
          )
        ],
      ),
    ));
  }
}
