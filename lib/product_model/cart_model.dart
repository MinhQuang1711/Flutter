import 'package:homework2/product_model/product_model.dart';
import 'package:convert/convert.dart';

class CartModel {
  late final ProductModel productModel;
  int quantity = 1;
  CartModel(this.productModel);

  CartModel.formJson(Map<String, dynamic> json) {
    productModel = json["productModel"];
    quantity = json["quantity"];
  }

  Map<String, dynamic> toJson() => {
        'productModel': productModel,
        'quantity': quantity,
      };
}
