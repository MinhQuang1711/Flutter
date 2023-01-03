import 'package:flutter/material.dart';

import '../home_screen/Home.dart';

class BottomBarAddProduct extends StatelessWidget {
  const BottomBarAddProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Home()));
                },
                icon: Icon(
                  Icons.home,
                  size: 40,
                  color: Colors.grey,
                )),
          )
        ],
      ),
    );
  }
}
