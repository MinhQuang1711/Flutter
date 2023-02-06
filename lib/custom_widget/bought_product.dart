import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:homework2/product_model/pay_model.dart';
import 'package:homework2/screens/order_detail_screen/order_detail.dart';

class BoughtProduct extends StatelessWidget {
  BoughtProduct({required this.payModel,super.key});
  PayModel payModel;

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
              payModel.listModel.first.productModel.imageUrl,
              fit: BoxFit.contain,
            ),
          ),
          Spacer(),
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(right: 100),
                child: Text(
                  'Total: ${payModel.total}',
                  style: TextStyle(fontSize: 17),
                ),
              ),
              Container(
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OrderDetail(payModel: payModel,)));
                    },
                    child:const Text(
                      'Xem chi tiết',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                          decoration: TextDecoration.underline),
                    )),
              )
            ],
          )
        ],
      ),
    );
  }
}
