import 'package:flutter/material.dart';

class FeaturePlantCards extends StatelessWidget {
  FeaturePlantCards(
      {required this.image,
      required this.size,
      required this.onPressed,
      Key? key})
      : super(key: key);
  final Size size;
  final Function() onPressed;
  final AssetImage image;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: size.width * 0.6,
        height: 180,
        margin: EdgeInsets.only(left: 5),
        decoration: BoxDecoration(
          image: DecorationImage(image: image, fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
