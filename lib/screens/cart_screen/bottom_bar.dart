import 'package:flutter/material.dart';
import 'package:homework2/provider/cart_provider.dart';
import 'package:provider/provider.dart';

import '../../custom_widget/custom_button.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int total = 0;
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
                          text: '${context.read<CartProvider>().total}',
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
                  onPressed: () {})
            ],
          )
        ],
      ),
    );
  }
}
