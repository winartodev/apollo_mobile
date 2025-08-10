import 'package:apollo_mobile/core/usecases/usecase.dart';
import 'package:apollo_mobile/features/auth/domain/entities/auth_entity.dart';
import 'package:apollo_mobile/features/auth/domain/entities/sign_in_entity.dart';
import 'package:apollo_mobile/features/auth/domain/repositories/auth_repository.dart';

class SignInUsecase implements Usecase<AuthEntity, SignInEntity> {
  final AuthRepository repository;

  SignInUsecase({required this.repository});

  @override
  Future<AuthEntity> execute(SignInEntity data) {
    return repository.signIn(data);
  }
}
