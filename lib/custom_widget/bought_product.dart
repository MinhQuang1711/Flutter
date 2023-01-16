import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BoughtProduct extends StatelessWidget {
 BoughtProduct({required this.imageUrl,required this.total,super.key});
  String imageUrl;
  double? total;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17),
          color: Colors.grey.shade100,
          boxShadow: [
            BoxShadow(
                offset: Offset(2, 7),
                color: Colors.orange.withOpacity(0.4),
                blurRadius: 3)
          ]),
      height: size.height * 0.14,
      width: size.width,
      child: Row(
        children: [
          Container(
            child: Image.asset(
              imageUrl,
              fit: BoxFit.contain,
            ),
          ),
          Spacer(),
          Container(
            margin: EdgeInsets.only(right: 100),
            child: Text(
              'Total: ${total}',
              style: TextStyle(fontSize: 17),
            ),
          )
        ],
      ),
    );
  }
}
