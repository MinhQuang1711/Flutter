import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled7/Blocs/BlocLogin/Login_Event.dart';
import 'package:untitled7/Blocs/BlocLogin/Login_State.dart';
import 'package:untitled7/Repositoty/Auth_Repo.dart';

class Auth_Bloc extends Bloc<Auth_Event, Auth_State> //chưa extends Bloc
{
  final Auth_Repo _auth_repo;
  Auth_Bloc(this._auth_repo) : super(AuthInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());
      final result = await _auth_repo.Login(event.Email, event.Password);
      if (result != "Missing password" || result != "user not found") {
        emit(AuthSuccessful());
      } else {
        if (result == "user not found" || result == "Missing password") {
          emit(AuthError("Missing password or Missing password"));
        }
      }
    });
  }
}
