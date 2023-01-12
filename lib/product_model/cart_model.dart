import 'package:hive/hive.dart';
import 'package:homework2/product_model/product_model.dart';
import 'package:convert/convert.dart';
part 'cart_model.g.dart';

@HiveType(typeId: 4)
class CartModel {
  @HiveField(1)
  late final ProductModel productModel;

  @HiveField(2)
  int quantity = 1;

  CartModel(this.productModel);

  CartModel.fromJson(Map<String, dynamic> json) {
    productModel = json["productModel"];
    quantity = json["quantity"];
  }

  Map<String, dynamic> toJson() => {
        'productModel': productModel,
        'quantity': quantity.toString(),
      };
}
