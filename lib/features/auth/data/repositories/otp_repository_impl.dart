import 'package:apollo_mobile/core/network/api_response_mapper.dart';
import 'package:apollo_mobile/features/auth/data/datasources/otp_remote_data_source.dart';
import 'package:apollo_mobile/features/auth/data/mappers/otp_response_mapper.dart';
import 'package:apollo_mobile/features/auth/data/models/otp_request_model.dart';
import 'package:apollo_mobile/features/auth/domain/entities/otp_entity.dart';
import 'package:apollo_mobile/features/auth/domain/repositories/auth_storage_repository.dart';
import 'package:apollo_mobile/features/auth/domain/repositories/otp_repository.dart';

class OtpRepositoryImpl extends OtpRepository {
  final AuthStorageRepository authStorageRepository;
  final OtpRemoteDataSource otpRemoteDataSource;

  OtpRepositoryImpl({
    required this.otpRemoteDataSource,
    required this.authStorageRepository,
  });

  @override
  Future<OtpEntity> resendOtp() {
    // TODO: implement resendOtp
    throw UnimplementedError();
  }

  @override
  Future<OtpEntity?> validateOtp(int otp) async {
    try {
      var accessToken = await authStorageRepository.getAccessToken();
      if (accessToken == null) {
        throw Exception("unauthorized");
      }

      var response = await otpRemoteDataSource.validateOtp(
        OtpRequestModel(otpNumber: otp),
        accessToken,
      );

      return response.mapData((mapper) => mapper.toEntity());
    } on Exception catch (e) {
      return null;
    }
  }
}
