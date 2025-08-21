import 'package:apollo_mobile/features/auth/domain/entities/otp_entity.dart';

class AuthEntity {
  final String accessToken;
  final String refreshToken;
  final String redirectionLink;
  OtpEntity? otp;

  AuthEntity({
    required this.accessToken,
    required this.refreshToken,
    required this.redirectionLink,
    this.otp,
  });
}
