import 'package:homework2/product_model/cart_model.dart';

class PayModel {
  late CartModel cartModel;
  late int quantity;
  PayModel(this.cartModel, this.quantity);

  PayModel.formJson(Map<String, dynamic> json) {
    cartModel = json["listPay"];
    quantity = json["quantity"];
  }
}
