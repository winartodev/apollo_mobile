import 'package:apollo_mobile/features/auth/data/models/otp_response_model.dart';
import 'package:apollo_mobile/features/auth/domain/entities/otp_entity.dart';

extension OtpResponseMapper on OtpResponseModel {
  OtpEntity toEntity() {
    return OtpEntity(
      retryAfterIn: retryAfterIn,
      retryAttemptLeft: retryAttemptLeft,
      expiresIn: expiresIn,
      isValid: isValid,
    );
  }
}
