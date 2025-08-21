part of 'auth_bloc.dart';

class SignInLoading extends AuthState {}

class SignInSuccess extends AuthState {
  final AuthResponseModel response;

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
