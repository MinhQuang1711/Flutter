import 'dart:convert';

import 'package:untitled7/Constant/constant.dart';
import 'package:http/http.dart' as http;

class api_base {
  Future<dynamic> postUser(String url, dynamic body) async {
    final response = await http.post(Uri.parse(Url + url), body: body);
    var responseJson = _returnResponse(response);
    print(responseJson);
    return responseJson;
  }

  Future<dynamic> postLogin(String url, dynamic body) async {
    final response = await http.post(Uri.parse(Url + url), body: body);
    var responseJson = _returnResponse(response);
    print(responseJson);
    return responseJson;
  }

  Future<dynamic> postSignUp(String url, dynamic body) async {
    final response = await http.post(Uri.parse(Url + url), body: body);
    var responseJson = _returnResponse(response);
    print(responseJson);
    return responseJson;
  }
}

_returnResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      var responseJson = jsonDecode(response.body.toString());
      return responseJson["token"];
    case 400:
      var responseError = jsonDecode(response.body.toString());
      return responseError;
    default:
      return Exception('default Error ${response.statusCode.toString()}');
  }
}
