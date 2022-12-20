import 'package:flutter/material.dart';

import '../../Const_Color/Const_Color.dart';

class Header_SeachBox extends StatelessWidget {
  Size size;
  Header_SeachBox({required this.size, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.2,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            height: size.height * 0.2 - 25,
            decoration: BoxDecoration(
                color: PrimaryColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            child: Row(
              children: <Widget>[
                Text(
                  'Hello Quang',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            left: 30,
            right: 30,
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 70),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                height: 35,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 0),
                          blurRadius: 40,
                          color: PrimaryColor.withOpacity(0.5))
                    ]),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Seach',
                      hintStyle: TextStyle(
                        fontSize: 15,
                        color: PrimaryColor.withOpacity(0.5),
                      ),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      suffixIcon: Icon(
                        Icons.search,
                        color: PrimaryColor.withOpacity(0.5),
                      )),
                )),
          ),
        ],
      ),
    );
  }
}
