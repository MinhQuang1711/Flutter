import 'package:flutter/material.dart';
import 'package:homework2/api/network_request.dart';
import 'package:homework2/product_model/cart_model.dart';
import 'package:homework2/provider/cart_provider.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

import '../../custom_widget/custom_button.dart';
import '../../product_model/pay_model.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);
  @override
  State<BottomBar> createState() => _BottomBarState();
}

int id = 1;

class _BottomBarState extends State<BottomBar> {
  postListPay() async {
    var res = NetworkRequest.postListPay(context.read<CartProvider>().listCart,
        context.read<CartProvider>().total, id);
  }

  postDetailPay() async {
    int a = context.read<CartProvider>().listCart.length;
    print(a);
    for (int i = 0; i < a; i++) {
      var res = NetworkRequest.postDetailPay(
          id, context.read<CartProvider>().listCart[i]);
    }
  }

  List<PayModel> list = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    NetworkRequest.fetchListPayModel().then((data) {
      setState(() {
        list = data;
      });
    });
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
                    postDetailPay();
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
