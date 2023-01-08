import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:homework2/api/const_api.dart';
import 'package:homework2/product_model/cart_model.dart';
import 'package:homework2/product_model/pay_model.dart';

import '../product_model/product_model.dart';
import 'package:http/http.dart' as http;

class NetworkRequest {
  static Future<dynamic> postProduct(
      String productName, String imageUrl, double ratting, double price) async {
    final response = await http.post(Uri.parse(apiUrl), body: {
      "productName": productName,
      "imageUrl": imageUrl,
      "price": price.toString(),
      "rating": ratting.toString(),
    });
    if (response.statusCode == 200) {
      print('Success');
      return response.body;
    } else if (response.statusCode == 201) {
      print('Success');
    } else {
      throw Exception('Error');
    }
  }

  static Future<List<ProductModel>> fetchProduct() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      return compute(parseProduct, response.body);
    } else if (response.statusCode == 404) {
      throw Exception('Not found');
    } else {
      throw Exception('Can\'t get post');
    }
  }

  static List<ProductModel> parseProduct(String reponseBody) {
    var list = json.decode(reponseBody) as List<dynamic>;
    List<ProductModel> post =
        list.map((e) => ProductModel.formJson(e)).toList();
    return post;
  }

  static List<PayModel> parseListPayModel(String responseBody) {
    final jsonMap = json.decode(responseBody);
    var list = json.decode(responseBody) as List<dynamic>;
    List<PayModel> post = list.map((e) => PayModel.fromJson(e)).toList();
    return post;
  }

  static Future<List<PayModel>> fetchListPayModel() async {
    var response = await http.get(Uri.parse(apiPaySuccessful));
    if (response.statusCode == 200) {
      return compute(parseListPayModel, response.body);
    } else if (response.statusCode == 404) {
      throw Exception('Not found');
    } else {
      throw Exception('Can\'t get post');
    }
  }

  static Future<dynamic> postListPay(
      List<CartModel> listModel, double total, int id) async {
    final response = await http.post(Uri.parse(apiPaySuccessful), body: {
      "listModel": listModel.toString(),
      "total": total.toString(),
      "id": id.toString()
    });
    if (response.statusCode == 201) {
      print('Sussecs post list pay');
    } else {
      print(response.statusCode);
    }
  }

  static Future<dynamic> postDetailPay(int id, CartModel model) async {
    String url = apiPaySuccessful + '/' + id.toString() + apiDetailPay;
    final response = await http.post(
        Uri.parse(apiPaySuccessful + '/' + id.toString() + apiDetailPay),
        body: {
          "PaySuccessfulId": id.toString(),
          "productName": model.productModel.productName,
          "price": model.productModel.price.toString(),
          "quantity": model.quantity.toString()
        });
    if (response.statusCode == 201) {
      print("success post detail pay");
    } else {
      print(response.statusCode);
    }
  }
}
