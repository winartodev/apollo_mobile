import 'package:apollo_mobile/features/auth/domain/entities/auth_entity.dart';
import 'package:apollo_mobile/features/auth/presentation/models/otp_response_model.dart';

class AuthResponseModel {
  final String accessToken;
  final String refreshToken;
  final String redirectionLink;
  OtpResponseModel? otp;

  AuthResponseModel({
    required this.accessToken,
    required this.refreshToken,
    required this.redirectionLink,
    this.otp,
  });

  factory AuthResponseModel.fromEntity(AuthEntity entity) {
    return AuthResponseModel(
      accessToken: entity.accessToken,
      refreshToken: entity.refreshToken,
      redirectionLink: entity.redirectionLink,
      otp: entity.otp != null
          ? OtpResponseModel(
              retryAttemptLeft: entity.otp!.retryAttemptLeft,
              expiresIn: entity.otp!.expiresIn,
              retryAfterIn: entity.otp!.retryAfterIn,
              isValid: entity.otp!.isValid,
            )
          : null,
    );
  }
}
