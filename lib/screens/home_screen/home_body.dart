import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

import '../../custom_widget/cart_product.dart';
import '../../product_model/product_model.dart';

import 'package:homework2/api/network_request.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);
  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
            child: Categories(),
          ),
          SizedBox(height: 30),
          MainProduct()
        ],
      ),
    );
  }
}

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = ['Salad', 'Pizza', 'Asian', 'Buger', 'Sandwich'];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      backgroundColor: Colors.grey.shade400),
                  onPressed: () {},
                  child: Text(
                    categories[index],
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                ),
              )),
    );
  }
}

class MainProduct extends StatefulWidget {
  const MainProduct({Key? key}) : super(key: key);

  @override
  State<MainProduct> createState() => _MainProductState();
}

class _MainProductState extends State<MainProduct> {
  List<ProductModel> postData = [];

  @override
  void initState() {
    super.initState();
    NetworkRequest.fetchProduct().then((data) {
      setState(() {
        postData = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GridView.builder(
            itemCount: postData.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 10, crossAxisSpacing: 10, crossAxisCount: 2),
            itemBuilder: (context, index) {
              return CardProduct(
                ratingBar: RatingBar.builder(
                    itemSize: 18,
                    initialRating: postData[index].rating,
                    minRating: 0,
                    itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    }),
                productName: postData[index].productName,
                price: postData[index].price,
                imageurl: postData[index].imageUrl,
                rating: postData[index].rating,
              );
            }));
  }
}
