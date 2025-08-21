part of 'auth_bloc.dart';

class ValidateOtpLoading extends AuthState {}

class ValidateOtpSuccess extends AuthState {
  final OtpResponseModel response;

  const ValidateOtpSuccess(this.response);

  @override
  List<Object> get props => [response];
}

class ValidateOtpFailure extends AuthState {
  final String message;

  const ValidateOtpFailure(this.message);

  @override
  List<Object> get props => [message];

  @override
  String toString() => 'ValidateOtpFailure(message: $message)';
}
