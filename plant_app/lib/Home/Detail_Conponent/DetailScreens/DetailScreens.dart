import 'package:flutter/material.dart';

import '../../../Const_Color/Const_Color.dart';
import 'Conponent/Iconcard.dart';
import 'Conponent/ProductNameWithPrice.dart';

class DetailScreens extends StatelessWidget {
  const DetailScreens(
      {required this.ProductName,
      required this.Country,
      required this.Price,
      required this.image,
      Key? key})
      : super(key: key);
  final Image image;
  final String ProductName;
  final String Country;
  final int Price;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: PrimaryColor,
                      )),
                  SizedBox(
                    height: 150,
                  ),
                  IconCard(
                      onPressed: () {},
                      icon: Icon(Icons.sunny, color: PrimaryColor)),
                  IconCard(
                      onPressed: () {},
                      icon:
                          Icon(Icons.water_drop_outlined, color: PrimaryColor)),
                  IconCard(
                      onPressed: () {},
                      icon: Icon(
                        Icons.add_chart,
                        color: PrimaryColor,
                      )),
                  IconCard(
                      onPressed: () {},
                      icon: Icon(
                        Icons.cut_sharp,
                        color: PrimaryColor,
                      ))
                ],
              ),
            ),
            Container(
              width: size.width * 0.7,
              height: size.height * 0.7,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(65),
                      topLeft: Radius.circular(65)),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 20),
                        blurRadius: 60,
                        color: PrimaryColor.withOpacity(0.5))
                  ],
                  image: DecorationImage(
                    alignment: Alignment.centerLeft,
                    fit: BoxFit.fill,
                    image: image.image,
                  )),
            )
          ],
        ),
        ProductNameWithPrice(
            ProductName: ProductName, Price: Price, Country: Country)
      ],
    );
  }
}
