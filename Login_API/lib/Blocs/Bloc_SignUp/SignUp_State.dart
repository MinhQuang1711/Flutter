import 'package:equatable/equatable.dart';

abstract class SignUp_State extends Equatable {}

class SignUp_Initial extends SignUp_State {
  @override
  List<Object?> get props => [];
}

class SignUp_Loading extends SignUp_State {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SignUp_Successful extends SignUp_State {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SignUp_Error extends SignUp_State {
  String? Message;
  SignUp_Error(this.Message);

  @override
  // TODO: implement props
  List<Object?> get props => [Message];
}
