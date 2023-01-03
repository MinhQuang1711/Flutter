import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

class ProductModel {
  late final String productName;
  late final double price;
  late final double rating;
  late final String imageUrl;

  ProductModel(this.productName, this.price, this.rating, this.imageUrl);

  ProductModel.formJson(Map<String, dynamic> json) {
    productName = json["productName"];
    price = json["price"];
    rating = json["rating"];
    imageUrl = json["imageUrl"];
  }

  Map<String, dynamic> toJson() => {
        'productName': productName,
        'price': price,
        'rating': rating,
        'imageUrl': imageUrl
      };
}
