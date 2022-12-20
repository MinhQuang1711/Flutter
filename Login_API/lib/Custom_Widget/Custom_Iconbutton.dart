import 'package:flutter/material.dart';

class Custom_IconButtom extends StatefulWidget {
  final Function() onPressed;
  final IconData? Icondata;
  const Custom_IconButtom({this.Icondata, required this.onPressed, Key? key})
      : super(key: key);

  @override
  State<Custom_IconButtom> createState() => _Custom_IconButtomState();
}

class _Custom_IconButtomState extends State<Custom_IconButtom> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          widget.onPressed;
        },
        icon: Icon(widget.Icondata));
  }
}
