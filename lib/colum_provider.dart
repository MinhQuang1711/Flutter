import 'dart:async';

import 'package:flutter/foundation.dart';

class ColumProvider extends ChangeNotifier {
  double _columX = 0;
  double get columX => _columX;

  void ChangeColumX() {
    Timer.periodic(Duration(milliseconds: 25), (timer) {
      print(columX);
      _columX = _columX + 0.015;
      notifyListeners();
    });
  }
}
