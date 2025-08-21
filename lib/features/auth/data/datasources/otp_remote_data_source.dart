import 'package:apollo_mobile/core/network/api_client.dart';
import 'package:apollo_mobile/core/network/api_response.dart';
import 'package:apollo_mobile/features/auth/data/models/otp_request_model.dart';
import 'package:apollo_mobile/features/auth/data/models/otp_response_model.dart';

abstract class OtpRemoteDataSource {
  Future<ApiResponse<OtpResponseModel>> validateOtp(
    OtpRequestModel request,
    String token,
  );
  Future<ApiResponse<OtpResponseModel>> resendOtp();
}

class OtpRemoteDataSourceImpl extends OtpRemoteDataSource {
  final ApiClient client;

  OtpRemoteDataSourceImpl({required this.client});

  @override
  Future<ApiResponse<OtpResponseModel>> resendOtp() {
    // TODO: implement resendOtp
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<OtpResponseModel>> validateOtp(
    OtpRequestModel request,
    String token,
  ) async {
    try {
      var response = await client.post(
        "/otp/validate",
        body: request.toJson(),
        fromJsonT: (json) => OtpResponseModel.fromJson(json),
        customHeader: {"Authorization": "Bearer $token"},
      );

      if (!response.success) {
        throw Exception(response.error);
      }

      return response;
    } catch (e) {
      return ApiResponse<OtpResponseModel>(
        success: false,
        message: 'otp validation failed',
        data: null,
        error: e.toString(),
      );
    }
  }
}
