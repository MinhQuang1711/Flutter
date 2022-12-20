import 'package:flutter/material.dart';

import '../../../../Const_Color/Const_Color.dart';

class IconCard extends StatelessWidget {
  IconCard({required this.onPressed, required this.icon, Key? key})
      : super(key: key);
  final Icon icon;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.only(bottom: 20),
      child: IconButton(
        icon: icon,
        onPressed: onPressed,
        color: PrimaryColor.withOpacity(0.5),
      ),
      height: 60,
      width: 40,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(8), boxShadow: [
        BoxShadow(
            offset: Offset(0, 10),
            blurRadius: 20,
            color: PrimaryColor.withOpacity(0.3)),
        BoxShadow(offset: Offset(0, -10), blurRadius: 20, color: Colors.white)
      ]),
    );
  }
}
