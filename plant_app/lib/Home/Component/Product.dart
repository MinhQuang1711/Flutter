import 'package:flutter/material.dart';
import 'package:plant_app/Model/Product_Model.dart';
import '../../Const_Color/Const_Color.dart';

class Product extends StatelessWidget {
  Product(
      {required this.list_product,
      required this.size,
      required this.index,
      required this.onPressed,
      Key? key})
      : super(key: key);
  List<Product_Model> list_product;
  final Function() onPressed;
  final int index;
  final Size size;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.3,
      padding: EdgeInsets.all(15),
      child: Column(
        children: <Widget>[
          list_product[index].iamge,
          GestureDetector(
            onTap: onPressed,
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(70),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 5),
                        blurRadius: 40,
                        color: PrimaryColor.withOpacity(0.2))
                  ]),
              child: Row(
                children: <Widget>[
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: list_product[index].ProductName + '\n',
                        style: TextStyle(fontSize: 13)),
                    TextSpan(
                        text: list_product[index].Country.toUpperCase(),
                        style: TextStyle(
                            color: PrimaryColor.withOpacity(0.7), fontSize: 13))
                  ])),
                  Spacer(),
                  Text(
                    '${list_product[index].Price}',
                    style: TextStyle(
                        color: PrimaryColor, fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
