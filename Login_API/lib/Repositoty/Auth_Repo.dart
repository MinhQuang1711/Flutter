import 'package:untitled7/Base/api_base.dart';

class Auth_Repo {
  final String _apiKeyUser = "api/users";
  final String _apiKeyLogin = "api/login";
  final String _apiKeyRegister = "api/register";
  final api_base _aipbase = api_base();

  Future<dynamic> CreateUsers(String? name, String? job) async {
    final response =
        await _aipbase.postUser(_apiKeyUser, {"name": name, "job": job});
    return response;
  }

  Future<dynamic> SignUp(
    String? email,
    String? password,
  ) async {
    final response = await _aipbase
        .postSignUp(_apiKeyRegister, {"email": email, "password": password});
    return response;
  }

  Future<dynamic> Login(String? email, String? password) async {
    final response = await _aipbase
        .postLogin(_apiKeyLogin, {"email": email, "password": password});
    return response;
  }
}
