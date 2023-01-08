import 'dart:convert';

import 'package:homework2/product_model/cart_model.dart';

class PayModel {
  List<CartModel>? listModel;
  double? total;
  int? id;

  PayModel({this.listModel, this.total, this.id});

  PayModel.fromJson(Map<String, dynamic> Json) {
    total = double.parse(Json["total"]);
    id = int.parse(Json["id"]);
  }

  Map<String, dynamic> toJson() => {
        'listModel': listModel,
        'total': total,
        'id': id,
      };
}
