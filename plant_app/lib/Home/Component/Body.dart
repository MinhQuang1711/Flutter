import 'package:flutter/material.dart';
import 'package:plant_app/Home/Component/FeaturePlantCards.dart';
import 'package:plant_app/Home/Component/Header_SeachBox.dart';
import 'package:plant_app/Home/Component/Product.dart';
import 'package:plant_app/Home/Component/TitleWithMoreButton.dart';
import 'package:plant_app/Stateless/Detail_Product.dart';
import '../../Model/Product_Model.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Product_Model> list_product = [
      Product_Model('SAMANTHA', 'Russia', 400, Image.asset('Image/Image1.jpg')),
      Product_Model('OMOTOZO', 'USA', 600, Image.asset('Image/Image2.jpg')),
      Product_Model(
          'TOTOKAZU', 'VIET NAM', 800, Image.asset('Image/Image3.jpg')),
      Product_Model(
          'Cây táo', 'VIET NAM', 1000, Image.asset('Image/Image4.jpg'))
    ];
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Header_SeachBox(size: size),
          TitleWithMoreButton(Title: 'Recomended', OnPresed: () {}),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Product(
                    size: size,
                    list_product: list_product,
                    index: 1,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Detai_Product(
                                    list_product: list_product,
                                    index: 1,
                                  )));
                    }),
                Product(
                    list_product: list_product,
                    size: size,
                    index: 2,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Detai_Product(
                                    list_product: list_product,
                                    index: 2,
                                  )));
                    }),
                Product(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Detai_Product(
                                  list_product: list_product,
                                  index: 3,
                                )));
                  },
                  list_product: list_product,
                  size: size,
                  index: 3,
                ),
                Product(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Detai_Product(
                                  list_product: list_product,
                                  index: 0,
                                )));
                  },
                  index: 0,
                  list_product: list_product,
                  size: size,
                ),
              ],
            ),
          ),
          TitleWithMoreButton(Title: 'Featured Plans', OnPresed: () {}),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                FeaturePlantCards(
                    size: size,
                    image: AssetImage('Image/XuongRong/xuongrong.png'),
                    onPressed: () {}),
                FeaturePlantCards(
                    size: size,
                    image: AssetImage('Image/XuongRong/xuongrong2.jpg'),
                    onPressed: () {}),
                FeaturePlantCards(
                    size: size,
                    image: AssetImage('Image/XuongRong/xuongrong3.jpg'),
                    onPressed: () {}),
                FeaturePlantCards(
                    size: size,
                    image: AssetImage('Image/XuongRong/xuongrong4.jpg'),
                    onPressed: () {}),
                FeaturePlantCards(
                    size: size,
                    image: AssetImage('Image/XuongRong/xuongrong5.jpg'),
                    onPressed: () {})
              ],
            ),
          )
        ],
      ),
    );
  }
}
