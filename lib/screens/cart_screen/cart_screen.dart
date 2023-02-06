import 'package:flutter/material.dart';
import 'package:homework2/custom_widget/custom_button.dart';
import 'package:homework2/screens/bought_screens/bought_screens.dart';
import 'bottom_bar.dart';
import 'cart_body.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.yellow.shade700,
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios_outlined, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: const Text('Giỏ hàng'),
              bottom: TabBar(
                tabs: [
                  Tab(
                    text: 'Giỏ hàng',
                  ),
                  Tab(
                    text: 'Đã mua',
                  )
                ],
              ),
            ),
            body: TabBarView(children: [CartBody(), BoughtScreens()]),
            // bottomNavigationBar: BottomBar(),
          ),
        ));
  }
}
