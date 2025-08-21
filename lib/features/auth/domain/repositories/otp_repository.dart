import 'package:apollo_mobile/features/auth/domain/entities/otp_entity.dart';

abstract class OtpRepository {
  Future<OtpEntity?> validateOtp(int otp);
  Future<OtpEntity?> resendOtp();
}
