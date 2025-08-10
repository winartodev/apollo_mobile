import 'package:apollo_mobile/features/auth/data/models/sign_in_request_model.dart';
import 'package:apollo_mobile/features/auth/domain/entities/sign_in_entity.dart';

extension SignInRequestModelMapper on SignInRequestModel {
  SignInEntity toEntity() {
    return SignInEntity(username: username, password: password);
  }
}

extension SignInEntityMapper on SignInEntity {
  SignInRequestModel toModel() {
    return SignInRequestModel(username: username, password: password);
  }
}
