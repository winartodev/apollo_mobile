import 'package:apollo_mobile/features/auth/data/models/auth_response_model.dart';
import 'package:apollo_mobile/features/auth/domain/entities/auth_entity.dart';

extension AuthResponseMapper on AuthResponseModel {
  AuthEntity toEntity() {
    return AuthEntity(accessToken: accessToken, refreshToken: refreshToken);
  }
}
