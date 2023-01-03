import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {this.sizeWidth,
      this.sizeHeight,
      required this.circular,
      required this.backgroundColor,
      required this.content,
      required this.onPressed,
      Key? key})
      : super(key: key);
  Function() onPressed;
  Text content;
  Color backgroundColor;
  double? sizeHeight;
  double? sizeWidth;
  double circular;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: sizeHeight,
      width: sizeWidth,
      child: ElevatedButton(
        onPressed: onPressed,
        child: content,
        style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(circular))),
      ),
    );
  }
}
