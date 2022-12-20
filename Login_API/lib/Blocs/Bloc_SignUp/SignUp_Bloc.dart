import 'package:bloc/bloc.dart';
import 'package:untitled7/Blocs/Bloc_SignUp/SignUp_Event.dart';
import 'package:untitled7/Blocs/Bloc_SignUp/SignUp_State.dart';

import '../../Repositoty/Auth_Repo.dart';

class SignUp_Bloc extends Bloc<Auth_Event, SignUp_State> {
  final Auth_Repo _auth_repo;
  SignUp_Bloc(this._auth_repo) : super(SignUp_Initial()) {
    on<SignUp_Event>((event, emit) async {
      emit(SignUp_Loading());
      final result_SignUp =
          await _auth_repo.SignUp(event.Email, event.Password);
      if (result_SignUp != "Missing password" ||
          result_SignUp != "Note: Only defined users succeed registration") {
        emit(SignUp_Successful());
        _auth_repo.CreateUsers(event.Name, event.Job);
      } else {
        if (result_SignUp == "Missing password" ||
            result_SignUp == "Note: Only defined users succeed registration")
          emit(SignUp_Error("Missing password"));
      }
    });
  }
}
