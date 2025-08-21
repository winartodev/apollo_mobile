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

class SignUpRequested extends AuthEvent {
  final String username;
  final String password;
  final String email;
  final String phoneNumber;

  const SignUpRequested({
    required this.username,
    required this.password,
    required this.email,
    required this.phoneNumber,
  });

  @override
  List<Object> get props => [username, password, email, phoneNumber];
}

class ValidateOtpRequested extends AuthEvent {
  final String otpNumber;

  const ValidateOtpRequested({required this.otpNumber});

  @override
  List<Object> get props => [otpNumber];
}
