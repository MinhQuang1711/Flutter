import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:homework2/custom_widget/bought_product.dart';
import 'package:homework2/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class BoughtScreensBody extends StatefulWidget {
  const BoughtScreensBody({super.key});

  @override
  State<BoughtScreensBody> createState() => _BoughtScreensBodyState();
}

class _BoughtScreensBodyState extends State<BoughtScreensBody> {
  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<CartProvider>(context);
    var listBought = cart.listBought;
    void onDelete(int index) {
      final model = listBought[index];
      setState(() {
        listBought.removeAt(index);
      });
    }

    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: listBought.length,
        itemBuilder: ((context, index) {
          return Slidable(
            startActionPane: ActionPane(
              motion: const StretchMotion(),
              children: [
                SlidableAction(
                    backgroundColor: Colors.red,
                    icon: Icons.delete,
                    label: 'Delete',
                    onPressed: (context) {
                      onDelete(index);
                      cart.listBought.removeAt(index);
                    })
              ],
            ),
            child: BoughtProduct(
              payModel: listBought[index],
            ),
          );
        }));
  }
}
