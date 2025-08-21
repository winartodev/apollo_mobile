part of 'auth_bloc.dart';

class SignUpLoading extends AuthState {}

class SignUpSuccess extends AuthState {
  final AuthResponseModel response;

  const SignUpSuccess(this.response);

  @override
  List<Object> get props => [response];

  @override
  String toString() => 'SignUpSuccess(response: ${response.toString()})';
}

class SignUpFailure extends AuthState {
  final String message;

  const SignUpFailure(this.message);

  @override
  List<Object> get props => [message];

  @override
  String toString() => 'SignUpFailure(message: $message)';
}
