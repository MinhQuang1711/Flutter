import 'package:flutter/material.dart';
import 'package:homework2/product_model/pay_model.dart';
import 'package:homework2/screens/order_detail_screen/order_detail_body.dart';

import 'bottom_bar_order_detail.dart';

class OrderDetail extends StatelessWidget {
  OrderDetail({required this.payModel, super.key});
  PayModel payModel;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_outlined,
              color: Colors.orange,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Center(
            child: Text('Chi tiết',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.black)),
          ),
        ),
        body: OrderDetailBody(
          model: payModel,
        ),
        bottomNavigationBar: BottomBarOrderDetail(total: payModel.total,),
      ),
    );
  }
}
