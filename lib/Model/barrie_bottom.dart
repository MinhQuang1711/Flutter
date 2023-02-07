import 'package:flutter/material.dart';

class Barrie extends StatelessWidget {
  Barrie(
      {required this.height,
      required this.columX,
      required this.columY,
      this.text,
      super.key});
  double columX;
  double columY;
  double? height;
  String? text;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 1),
      alignment: Alignment(columX, columY),
      child: Container(
        child: Text(text!),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            color: Colors.green,
            border: Border.all(color: Colors.green.shade900, width: 10)),
        height: height,
        width: 80,
        // color: Colors.green,
      ),
    );
  }
}
