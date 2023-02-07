import 'package:flutter/material.dart';

class ChewBird extends StatelessWidget {
  const ChewBird({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CircleAvatar(
          backgroundImage: AssetImage('lib/assets/image_chew.png'), radius: 30),
    );
  }
}
