import 'package:apollo_mobile/features/auth/domain/repositories/auth_storage_repository.dart';

class AuthStorageUsecase {
  final AuthStorageRepository authStorageRepo;

  AuthStorageUsecase({required this.authStorageRepo});

  Future<String?> getAccessToken() async {
    try {
      return await authStorageRepo.getAccessToken();
    } on Exception catch (_) {
      return null;
    }
  }

  Future<String?> getRefreshToken() async {
    try {
      return await authStorageRepo.getRefreshToken();
    } on Exception catch (_) {
      return null;
    }
  }
}
