import 'package:homework2/product_model/cart_model.dart';
import 'package:homework2/product_model/pay_model.dart';

import 'package:hive/hive.dart';
import 'package:homework2/product_model/product_model.dart';

class Boxes {
  static Box<Map<String, dynamic>> getPayModel2() {
    return Hive.box<Map<String,dynamic>>('payBox2');
  }

  static Box<PayModel> getPayModel() {
    return Hive.box<PayModel>('PayModelBox');
  }

  static Box<CartModel> getCartModel() {
    return Hive.box<CartModel>('CartModelBox');
  }

  static Box<ProductModel> getProductModel() {
    return Hive.box<ProductModel>('ProductModelBox');
  }
}
