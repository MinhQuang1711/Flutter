import 'dart:convert';
import 'package:homework2/product_model/cart_model.dart';
import 'package:hive/hive.dart';
part 'pay_model.g.dart';

@HiveType(typeId: 3)
class PayModel extends HiveObject {
  //  CREATE HIVE MODEL
  @HiveField(1)
  late List<CartModel> listModel;

  @HiveField(2)
  double? total;
  @HiveField(3)
  String? id;

  PayModel({required this.listModel, this.total, this.id});

  PayModel.fromJson(Map<String, dynamic> Json) {
    listModel = Json["listModel"] ;
    total = double.parse(Json["total"]);
    id = (Json["id"]);
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> listmodel =
        listModel.map((e) => e.toJson()).toList();
    return {
      'listModel': listmodel,
      'total': total.toString(),
      'id': id.toString(),
    };
  }
}
