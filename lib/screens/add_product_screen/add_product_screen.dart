import 'package:flutter/material.dart';
import 'package:homework2/screens/add_product_screen/bottom_bar_add_product.dart';

import 'body_add_product.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: BodyAddProduct(),
        bottomNavigationBar: BottomBarAddProduct(),
      ),
    );
  }
}
