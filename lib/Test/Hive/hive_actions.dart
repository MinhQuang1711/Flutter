import 'package:homework2/Box/box.dart';
import 'package:homework2/product_model/pay_model.dart';

class HiveActions {
  static Future addPayModel(PayModel model) async {
    //TODO
    final payModel = PayModel(listModel: model.listModel, total: model.total);
    final box = Boxes.getPayModel();
    box.add(model);
    print(box);
  }

  static Future getPayModel() async {
    //TODO
    final box = Boxes.getPayModel();
    var list = box.values.toList();
    print(list);
  }
}
