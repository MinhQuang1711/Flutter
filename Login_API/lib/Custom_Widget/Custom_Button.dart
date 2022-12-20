import 'package:flutter/material.dart';

class Custombutton extends StatefulWidget {
  final Function() onPressed;
  final String text;
  const Custombutton({required this.text, required this.onPressed, Key? key})
      : super(key: key);

  @override
  State<Custombutton> createState() => _CustombuttonState();
}

class _CustombuttonState extends State<Custombutton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 200,
      child: MaterialButton(
        onPressed: widget.onPressed,
        child: Text(widget.text,
            style: TextStyle(color: Colors.grey, fontSize: 18)),
        shape: OutlineInputBorder(borderRadius: BorderRadius.circular(32)),
      ),
    );
  }
}
