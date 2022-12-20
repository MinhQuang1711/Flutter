import 'package:equatable/equatable.dart';

abstract class Auth_State extends Equatable {} // chưa extends Equatable

class AuthInitial extends Auth_State {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AuthSuccessful extends Auth_State {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AuthLoading extends Auth_State {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AuthError extends Auth_State {
  String? Message;
  AuthError(this.Message);
  @override
  // TODO: implement props
  List<Object?> get props => [Message];
}
