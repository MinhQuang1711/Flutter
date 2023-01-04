import 'package:flutter/foundation.dart';

import '../product_model/product_model.dart';

class CartProvider extends ChangeNotifier {
  double _total = 0;
  int _quantity = 0;
  List<ProductModel> _listProduct = [];

  double get total => _total;
  int get quantity => _quantity;
  List<ProductModel> get listProduct => _listProduct;

  void addquantity(ProductModel model) {
    _quantity++;
    _listProduct.add(model);
    print('added');
    print(listProduct[0].productName);
    print(listProduct[0].imageUrl);
    print(listProduct[0].price);
  }

  void removequantity(ProductModel model) {
    _quantity--;
    _listProduct.removeWhere((item) => item.productName == model.productName);
  }

  void addTotal(double price) {
    _total = _total + price;
    notifyListeners();
  }

  void removeTotal(double price) {
    _total = _total - price;
    notifyListeners();
  }
}
