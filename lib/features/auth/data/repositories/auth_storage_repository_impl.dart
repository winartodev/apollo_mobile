import 'package:apollo_mobile/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:apollo_mobile/features/auth/domain/repositories/auth_storage_repository.dart';

class AuthStorageRepositoryImpl implements AuthStorageRepository {
  final AuthLocalDataSource localDataSource;
  AuthStorageRepositoryImpl({required this.localDataSource});

  @override
  Future<String?> getAccessToken() async {
    try {
      return await localDataSource.getAccessToken();
    } catch (e) {
      return null;
    }
  }

  @override
  Future<String?> getRefreshToken() async {
    try {
      return await localDataSource.getRefreshToken();
    } catch (e) {
      return null;
    }
  }
}
