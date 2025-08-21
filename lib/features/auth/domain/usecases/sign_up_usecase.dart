import 'package:apollo_mobile/core/usecases/usecase.dart';
import 'package:apollo_mobile/features/auth/domain/entities/auth_entity.dart';
import 'package:apollo_mobile/features/auth/domain/entities/sign_up_entity.dart';
import 'package:apollo_mobile/features/auth/domain/repositories/auth_repository.dart';

class SignUpUseCase implements UseCase<AuthEntity, SignUpEntity> {
  final AuthRepository authRepo;

  SignUpUseCase({required this.authRepo});

  @override
  Future<AuthEntity> execute(SignUpEntity data) {
    return authRepo.signUp(data);
  }
}
