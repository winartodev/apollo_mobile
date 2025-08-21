import 'package:apollo_mobile/features/auth/domain/entities/otp_entity.dart';
import 'package:apollo_mobile/features/auth/domain/repositories/otp_repository.dart';

class OtpUseCase {
  final OtpRepository otpRepo;

  OtpUseCase({required this.otpRepo});

  Future<OtpEntity?> validateOtp(int otp) async {
    return await otpRepo.validateOtp(otp);
  }
}
