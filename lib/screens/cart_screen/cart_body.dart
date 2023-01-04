import 'package:flutter/material.dart';
import 'package:homework2/custom_widget/ItemCart.dart';
import 'package:homework2/provider/cart_provider.dart';
import 'package:provider/provider.dart';

import '../../product_model/product_model.dart';
import '../../provider/badge_provider.dart';

class CartBody extends StatelessWidget {
  const CartBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    var item = cart.listProduct;
    return ListView.builder(
      itemCount: item.length,
      itemBuilder: (context, index) {
        return ItemCart(model: item[index]);
      },
    );
  }
}
// Expanded(
//       child: ListView.builder(
//         scrollDirection: Axis.vertical,
//         itemCount: cart.listProduct.length,
//         itemBuilder: (context, index) {
//           return ItemCart(
//               productName: 'quang',
//               price: 10,
//               imageUrl: 'asset/Image/backgroundimage.jpg');
//         },
//       ),
//     );
