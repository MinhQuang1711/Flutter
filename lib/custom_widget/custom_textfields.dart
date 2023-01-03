import 'package:flutter/material.dart';

class CustomTextFields extends StatelessWidget {
  CustomTextFields(
      {required this.icon,
      required this.size,
      required this.colorOutline,
      required this.controllrer,
      required this.circular,
      required this.hindtext,
      required this.obs,
      Key? key})
      : super(key: key);
  TextEditingController controllrer;
  String hindtext;
  double circular;
  Color colorOutline;
  IconData icon;
  Size size;
  bool obs = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      height: size.height * 0.1,
      width: size.width * 0.75,
      child: TextField(
        controller: controllrer,
        obscureText: obs,
        decoration: InputDecoration(
            hintText: hindtext,
            border: OutlineInputBorder(
                borderSide: BorderSide(color: colorOutline),
                borderRadius: BorderRadius.circular(circular)),
            prefixIcon: Icon(icon)),
      ),
    );
  }
}
