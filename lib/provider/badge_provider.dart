import 'package:flutter/cupertino.dart';

class BadgeProvider extends ChangeNotifier {
  int _counter = 0;
  int get counter => _counter;
  void add() {
    _counter++;
    notifyListeners();
  }

  void remove() {
    _counter--;
    notifyListeners();
  }
}
