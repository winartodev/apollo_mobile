import 'package:apollo_mobile/features/auth/domain/entities/otp_entity.dart';

class OtpResponseModel {
  final int retryAttemptLeft;
  final int expiresIn;
  final int retryAfterIn;
  final bool isValid;
  String? redirectionLink;

  OtpResponseModel({
    required this.retryAttemptLeft,
    required this.expiresIn,
    required this.retryAfterIn,
    required this.isValid,
    this.redirectionLink,
  });

  factory OtpResponseModel.fromEntity(OtpEntity e) {
    return OtpResponseModel(
      retryAttemptLeft: e.retryAttemptLeft,
      expiresIn: e.expiresIn,
      retryAfterIn: e.retryAfterIn,
      isValid: e.isValid,
      redirectionLink: e.redirectionLink,
    );
  }
}
