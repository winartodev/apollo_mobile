import 'package:apollo_mobile/features/auth/domain/entities/auth_entity.dart';
import 'package:apollo_mobile/features/auth/domain/entities/sign_in_entity.dart';
import 'package:apollo_mobile/features/auth/domain/entities/sign_up_entity.dart';

abstract class AuthRepository {
  Future<AuthEntity> signIn(SignInEntity data);
  Future<AuthEntity> signUp(SignUpEntity data);
}
