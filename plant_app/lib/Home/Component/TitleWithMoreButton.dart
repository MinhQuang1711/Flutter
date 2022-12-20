import 'package:flutter/material.dart';

import '../../Const_Color/Const_Color.dart';

class TitleWithMoreButton extends StatelessWidget {
  TitleWithMoreButton({required this.Title, required this.OnPresed, Key? key})
      : super(key: key);
  final String Title;
  final Function() OnPresed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
          border: Border(
              bottom:
                  BorderSide(width: 3, color: PrimaryColor.withOpacity(0.5)))),
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      child: Row(
        children: [
          Text(
            Title,
            style: TextStyle(fontWeight: FontWeight.w100, fontSize: 18),
          ),
          Spacer(),
          TextButton(
            onPressed: OnPresed,
            child: Text(
              'More',
              style: TextStyle(
                  color: Colors.white,
                  backgroundColor: PrimaryColor,
                  fontSize: 18),
            ),
            style: TextButton.styleFrom(
                backgroundColor: PrimaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35))),
          )
        ],
      ),
    );
  }
}
