import 'package:flutter/material.dart';
import 'package:homework2/Test/Hive/hive_actions.dart';
import 'package:homework2/api/network_request.dart';

import 'package:homework2/provider/cart_provider.dart';
import 'package:provider/provider.dart';

import '../../custom_widget/custom_button.dart';
import '../../product_model/pay_model.dart';
import 'package:hive/hive.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);
  @override
  State<BottomBar> createState() => _BottomBarState();
}

int id = 1;

class _BottomBarState extends State<BottomBar> {
  addToBox() {
    PayModel model = PayModel(
        listModel: context.read<CartProvider>().listCart,
        total: context.read<CartProvider>().total);
    HiveActions.addToBox(model);
  }

  addToBox2() {
    PayModel model = PayModel(
        listModel: context.read<CartProvider>().listCart,
        total: context.read<CartProvider>().total);
    HiveActions.addToBox2(model, id);
  }

  getFromBox2() {
    HiveActions.getFromBox2();
  }

  postListPay() {
    PayModel payModel = PayModel(
        listModel: context.read<CartProvider>().listCart,
        total: context.read<CartProvider>().total,
        id: id);
    NetworkRequest.postListPay(payModel);
  }

  addtoBought() {
    PayModel model = PayModel(
        listModel: context.read<CartProvider>().listCart,
        total: context.read<CartProvider>().total,
        id: id);
    context.read<CartProvider>().addListBought(model);
  }

  @override
  void dispose() {
    //Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(25), topLeft: Radius.circular(25)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(offset: Offset(0, -7), blurRadius: 10, color: Colors.grey)
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text.rich(TextSpan(
                    text: 'Total: \n',
                    style: TextStyle(fontSize: 16),
                    children: [
                      TextSpan(
                          text: '\$ ${context.watch<CartProvider>().total}',
                          style: TextStyle(fontSize: 16, color: Colors.red))
                    ])),
              ),
              Spacer(),
              CustomButton(
                  sizeHeight: 50,
                  sizeWidth: 150,
                  circular: 15,
                  backgroundColor: Colors.yellow.shade800,
                  content: Text('BUY'),
                  onPressed: () {
                    postListPay();
                    addToBox2();
                    addtoBought();
                    context.read<CartProvider>().refesh();
                    id++;
                  })
            ],
          )
        ],
      ),
    );
  }
}
