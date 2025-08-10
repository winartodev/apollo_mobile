import 'package:apollo_mobile/core/network/api_client.dart';
import 'package:apollo_mobile/core/network/api_response.dart';
import 'package:apollo_mobile/features/auth/data/models/auth_response_model.dart';
import 'package:apollo_mobile/features/auth/data/models/sign_in_request_model.dart';
import 'package:apollo_mobile/features/auth/data/models/sign_up_request_model.dart';

abstract class AuthRemoteDatasource {
  Future<ApiResponse<AuthResponseModel>> signIn(SignInRequestModel request);
  Future<ApiResponse<AuthResponseModel>> signUp(SignUpRequestModel request);
}

class AuthRemoteDatasourceImpl extends AuthRemoteDatasource {
  final ApiClient client;

  AuthRemoteDatasourceImpl({required this.client});

  @override
  Future<ApiResponse<AuthResponseModel>> signIn(
    SignInRequestModel request,
  ) async {
    try {
      var response = await client.post(
        "/auth/sign-in",
        body: request.toJson(),
        fromJsonT: (json) => AuthResponseModel.fromJson(json),
        withAuth: false,
      );

      if (!response.success) {
        throw Exception(response.error);
      }

      return response;
    } on Exception catch (e) {
      return ApiResponse<AuthResponseModel>(
        success: false,
        message: 'sign in failed',
        data: null,
        error: e.toString(),
      );
    }
  }

  @override
  Future<ApiResponse<AuthResponseModel>> signUp(
    SignUpRequestModel request,
  ) async {
    try {
      return await client.post(
        "/auth/sign-up",
        body: request.toJson(),
        fromJsonT: (json) => AuthResponseModel.fromJson(json),
        withAuth: false,
      );
    } on Exception catch (e) {
      return ApiResponse<AuthResponseModel>(
        success: false,
        message: 'sign up failed',
        data: null,
        error: e.toString(),
      );
    }
  }
}
