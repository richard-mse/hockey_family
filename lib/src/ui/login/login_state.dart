import '../../repositories/models/user_model.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginLoaded extends LoginState {
  final List<User> users;

  LoginLoaded(this.users);
}

class LoginError extends LoginState {
  final String message;

  LoginError(this.message);
}
