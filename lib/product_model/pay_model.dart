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
  int? id;

  @HiveField(4)
  HiveList? listModel2;

  PayModel({required this.listModel, this.total, this.id});
  String toString() => total.toString(); // For print()

  PayModel.fromJson(Map<String, dynamic> Json) {
    total = double.parse(Json["total"]);
    id = int.parse(Json["id"]);
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
