import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:homework2/custom_widget/cart_order_detail.dart';
import 'package:homework2/product_model/cart_model.dart';
import 'package:homework2/product_model/pay_model.dart';

class OrderDetailBody extends StatelessWidget {
  OrderDetailBody({required this.model, super.key});
  PayModel model;

  @override
  Widget build(BuildContext context) {
    List<CartModel> listmodel = model.listModel;
    return ListView.builder(
      itemCount: listmodel.length,
      itemBuilder: (context, index) {
        return CartOrderDetail(
            imageUrl: listmodel[index].productModel.imageUrl,
            price: listmodel[index].productModel.price,
            productName: listmodel[index].productModel.productName,
            quantity: listmodel[index].quantity);
      },
    );
  }
}
