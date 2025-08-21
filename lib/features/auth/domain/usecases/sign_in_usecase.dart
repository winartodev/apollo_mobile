import 'package:apollo_mobile/core/usecases/usecase.dart';
import 'package:apollo_mobile/features/auth/domain/entities/auth_entity.dart';
import 'package:apollo_mobile/features/auth/domain/entities/sign_in_entity.dart';
import 'package:apollo_mobile/features/auth/domain/repositories/auth_repository.dart';

class SignInUseCase implements UseCase<AuthEntity, SignInEntity> {
  final AuthRepository authRepo;

  SignInUseCase({required this.authRepo});

  @override
  Future<AuthEntity> execute(SignInEntity data) {
    return authRepo.signIn(data);
  }
}
