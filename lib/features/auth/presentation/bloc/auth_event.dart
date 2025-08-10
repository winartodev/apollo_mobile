part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class SignInRequested extends AuthEvent {
  final String username;
  final String password;

  const SignInRequested({required this.username, required this.password});

  @override
  List<Object> get props => [username, password];
}
