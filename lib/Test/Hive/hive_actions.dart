import 'package:hive/hive.dart';
import 'package:homework2/Box/box.dart';
import 'package:homework2/product_model/cart_model.dart';
import 'package:homework2/product_model/pay_model.dart';
import 'dart:convert';

class HiveActions {
  static Future addToBox2(PayModel model, int id) async {
    var box = await Hive.openBox("payment");
    box.put(
      id,
      json.encode({
        "modelList": model.listModel.map((e) => e.toJson()).toList(),
        "total": model.total
      }),
    );

    final saveResult = box.values;
    print(saveResult);
  }

  static Future addToBox(PayModel model) async {
    var box = await Hive.openBox("payment");
    box.add(model);
    final saveResult = box.values;
    print(saveResult);
  }

  static Future getFromBox2() async {
    var box = Boxes.getPayModel2();
  }
}
