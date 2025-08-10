part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class SignInLoading extends AuthState {}

class SignInSuccess extends AuthState {
  final dynamic response;

  const SignInSuccess(this.response);

  @override
  List<Object> get props => [response];
}

class SignInFailure extends AuthState {
  final String message;

  const SignInFailure(this.message);

  @override
  List<Object> get props => [message];

  @override
  String toString() => 'SignInFailure(message: $message)';
}
