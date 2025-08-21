import 'package:apollo_mobile/features/auth/data/models/otp_response_model.dart';
import 'package:flutter/rendering.dart';

class AuthResponseModel {
  final String accessToken;
  final String refreshToken;
  final String redirectionLink;
  final OtpResponseModel? otp;

  AuthResponseModel({
    required this.accessToken,
    required this.refreshToken,
    required this.redirectionLink,
    this.otp,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    OtpResponseModel? otp;
    if (json['otp'] != null && json['otp'] is Map<String, dynamic>) {
      otp = OtpResponseModel.fromJson(json['otp']);
    }

    return AuthResponseModel(
      accessToken: json['access_token'],
      refreshToken: json['refresh_token'],
      redirectionLink: json['redirection_link'] ?? '',
      otp: otp,
    );
  }

  @override
  String toString() {
    return 'AuthResponseModel{'
        'accessToken: $accessToken, '
        'refreshToken: $refreshToken, '
        'redirectionLink: $redirectionLink,'
        'otp: ${otp!.toString()}'
        '}';
  }
}
