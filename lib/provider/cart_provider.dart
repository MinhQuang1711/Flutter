import 'package:flutter/foundation.dart';
import 'package:homework2/product_model/cart_model.dart';
import 'package:homework2/product_model/pay_model.dart';

import '../product_model/product_model.dart';

class CartProvider extends ChangeNotifier {
  double _total = 0;
  int _quantity = 0;
  List<CartModel> _listCard = [];
  List<PayModel> _listBought = [];

  double get total => _total;
  int get quantity => _quantity;
  List<CartModel> get listCart => _listCard;
  List<PayModel> get listBought => _listBought;

  void addListBought(PayModel payModel) {
    listBought.add(payModel);
  }

  void refesh() {
    _listCard = [];
    _total = 0;
    notifyListeners();
  }

  void count() {
    _quantity = 0;
    for (int i = 0; i < _listCard.length; i++) {
      _quantity = _quantity + _listCard[i].quantity;
    }
    notifyListeners();
  }

  void addquantity(CartModel model) {
    _total = _total + model.productModel.price;
    if (_listCard.any((element) =>
        element.productModel.productName == model.productModel.productName)) {
      _listCard
          .firstWhere((element) =>
              element.productModel.productName ==
              model.productModel.productName)
          .quantity++;
    } else {
      _listCard.add(model);
    }
    print(model.productModel.productName);
    notifyListeners();
  }

  void removequantity(CartModel model) {
    _total = _total - model.productModel.price;
    if (_listCard.any((element) =>
        element.productModel.productName == model.productModel.productName)) {
      _listCard
          .firstWhere((element) =>
              element.productModel.productName ==
              model.productModel.productName)
          .quantity--;
      if (_listCard
              .firstWhere((element) =>
                  element.productModel.productName ==
                  model.productModel.productName)
              .quantity ==
          0) {
        _listCard.removeWhere((element) =>
            element.productModel.productName == model.productModel.productName);
      }
    }
    notifyListeners();
  }
}
