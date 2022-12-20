import 'package:equatable/equatable.dart';

abstract class Auth_Event extends Equatable {}

class LoginEvent extends Auth_Event {
  String? Email;
  String? Password;
  LoginEvent({this.Email, this.Password});
  @override
  // TODO: implement props
  List<Object?> get props => [Email, Password];
}
