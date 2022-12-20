import 'package:flutter/material.dart';
import '../Home/Detail_Conponent/DetailScreens/DetailScreens.dart';
import '../Model/Product_Model.dart';

class Detai_Product extends StatelessWidget {
  const Detai_Product(
      {required this.list_product, required this.index, Key? key})
      : super(key: key);
  final List<Product_Model> list_product;
  final int index;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: DetailScreens(
          ProductName: list_product[index].ProductName,
          Price: list_product[index].Price,
          Country: list_product[index].Country,
          image: list_product[index].iamge,
        ),
      ),
    );
  }
}
