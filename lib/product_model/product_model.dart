import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';
part 'product_model.g.dart';

@HiveType(typeId: 5)
class ProductModel {
@HiveField(1)
  late String productName;

@HiveField(2)
  late double price;

@HiveField(3)
  late double rating;

@HiveField(4)
  late String imageUrl;

  ProductModel(this.productName, this.price, this.rating, this.imageUrl);

  ProductModel.fromJson(Map<String, dynamic> json) {
    productName = json["productName"];
    price = json["price"];
    rating = (json["rating"] as int).toDouble();
    imageUrl = json["imageUrl"];
  }

  Map<String, dynamic> toJson() => {
        'productName': productName,
        'price': price.toString(),
        'rating': rating.toString(),
        'imageUrl': imageUrl.toString()
      };
}
