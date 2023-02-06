import 'package:flutter/material.dart';
import 'package:homework2/api/network_request.dart';

import 'package:homework2/provider/cart_provider.dart';
import 'package:provider/provider.dart';

import '../../custom_widget/custom_button.dart';
import '../../hive/hive_action.dart';
import '../../product_model/pay_model.dart';
import 'package:hive/hive.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);
  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  List<PayModel> listPay = [];

  savePayment(DateTime id) {
    PayModel model = PayModel(
        listModel: context.read<CartProvider>().listCart,
        total: context.read<CartProvider>().total);
    HiveActions.savePayment(model, id.toString());
  }

  postListPay(DateTime id) {
    PayModel payModel = PayModel(
        listModel: context.read<CartProvider>().listCart,
        total: context.read<CartProvider>().total,
        id: id.toString());

    print(payModel.id);
    NetworkRequest.postListPay(payModel);
  }

  addtoBought(DateTime id) {
    PayModel model = PayModel(
        listModel: context.read<CartProvider>().listCart,
        total: context.read<CartProvider>().total,
        id: id.toString());
    context.read<CartProvider>().addListBought(model);
  }

  @override
  void dispose() {
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
            const BoxShadow(
                offset: Offset(0, -7), blurRadius: 10, color: Colors.grey)
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text.rich(TextSpan(
                    text: 'Total: \n',
                    style: TextStyle(fontSize: 16),
                    children: [
                      TextSpan(
                          text: '\$ ${context.watch<CartProvider>().total}',
                          style: TextStyle(fontSize: 16, color: Colors.red))
                    ])),
              ),
              const Spacer(),
              CustomButton(
                  sizeHeight: 50,
                  sizeWidth: 150,
                  circular: 15,
                  backgroundColor: Colors.yellow.shade800,
                  content: const Text('BUY'),
                  onPressed: () {
                    DateTime id = DateTime.now();
                    postListPay(id);
                    savePayment(id);
                    addtoBought(id);
                    context.read<CartProvider>().refesh();
                  })
            ],
          )
        ],
      ),
    );
  }
}
