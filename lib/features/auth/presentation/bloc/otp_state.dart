part of 'auth_bloc.dart';

class OtpLoading extends AuthState {}

class OtpValidateSuccess extends AuthState {}

class OtpValidateFailure extends AuthState {
  final String message;

  const OtpValidateFailure(this.message);

  @override
  List<Object> get props => [message];

  @override
  String toString() => 'OtpValidateFailure(message: $message)';
}
