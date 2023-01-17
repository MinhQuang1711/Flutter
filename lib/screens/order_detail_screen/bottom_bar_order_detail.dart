import 'package:flutter/material.dart';

class BottomBarOrderDetail extends StatelessWidget {
  BottomBarOrderDetail({required this.total, super.key});
  double? total;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(25), topLeft: Radius.circular(25)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(offset: Offset(0, -7), blurRadius: 10, color: Colors.grey)
          ]),
      child: Center(
        child: Text(
          'Total: ${total}',
          style: TextStyle(fontSize: 17),
        ),
      ),
    );
  }
}
