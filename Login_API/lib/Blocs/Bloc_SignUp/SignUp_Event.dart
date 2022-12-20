import 'package:equatable/equatable.dart';

abstract class Auth_Event extends Equatable {}

class SignUp_Event extends Auth_Event {
  String? Email;
  String? Password;
  String? Name;
  String? Job;
  SignUp_Event({this.Email, this.Password, this.Name, this.Job});
  @override
  // TODO: implement props
  List<Object?> get props => [Email, Password, Name, Job];
}
