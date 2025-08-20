import 'package:apollo_mobile/features/auth/domain/entities/auth_entity.dart';

class AuthResponseModel {
  final String accessToken;
  final String refreshToken;
  final String redirectionLink;

  AuthResponseModel({
    required this.accessToken,
    required this.refreshToken,
    required this.redirectionLink,
  });

  factory AuthResponseModel.fromEntity(AuthEntity entity) {
    return AuthResponseModel(
      accessToken: entity.accessToken,
      refreshToken: entity.refreshToken,
      redirectionLink: entity.redirectionLink,
    );
  }
}
