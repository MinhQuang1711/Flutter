import 'package:flutter/material.dart';

import 'Custom_Iconbutton.dart';

class CustomTextField extends StatefulWidget {
  final Custom_IconButtom? iconbutton_custom;
  final TextEditingController? controller;
  final bool? obscure;
  final String HindText;
  const CustomTextField(
      {this.controller,
      this.iconbutton_custom,
      this.obscure,
      required this.HindText,
      Key? key})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool obs = widget.obscure ?? false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: obs,
      decoration: InputDecoration(
        suffix: widget.iconbutton_custom,
        hintText: widget.HindText,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.black45)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.black45)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: Colors.cyan,
            )),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.red)),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.white10)),
      ),
    );
  }
}
