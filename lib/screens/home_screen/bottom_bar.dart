import 'package:flutter/material.dart';
import 'package:homework2/custom_widget/custom_button.dart';
import 'package:homework2/router/router.dart';
import 'package:homework2/screens/add_product_screen/add_product_screen.dart';

import 'Home.dart';

class HomeBottomBar extends StatelessWidget {
  const HomeBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 30,
            width: 60,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, addProduct);
              },
              child: Icon(Icons.add),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
            ),
          ),
        ],
      ),
    );
  }
}
