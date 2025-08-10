import 'package:apollo_mobile/features/auth/data/models/sign_up_request_model.dart';
import 'package:apollo_mobile/features/auth/domain/entities/sign_up_entity.dart';

extension SignUpRequestModelMapper on SignUpRequestModel {
  SignUpEntity toEntity() {
    return SignUpEntity(
      username: username,
      password: password,
      email: email,
      phoneNumber: phoneNumber,
    );
  }
}

extension SignUpEntityMapper on SignUpEntity {
  SignUpRequestModel toModel() {
    return SignUpRequestModel(
      username: username,
      password: password,
      email: email,
      phoneNumber: phoneNumber,
    );
  }
}
