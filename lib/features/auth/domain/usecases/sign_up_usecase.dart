import 'package:apollo_mobile/core/usecases/usecase.dart';
import 'package:apollo_mobile/features/auth/domain/entities/auth_entity.dart';
import 'package:apollo_mobile/features/auth/domain/entities/sign_up_entity.dart';
import 'package:apollo_mobile/features/auth/domain/repositories/auth_repository.dart';

class SignUpUsecase implements Usecase<AuthEntity, SignUpEntity> {
  final AuthRepository repository;

  SignUpUsecase({required this.repository});

  @override
  Future<AuthEntity> execute(SignUpEntity data) {
    return repository.signUp(data);
  }
}
