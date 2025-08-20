import 'package:apollo_mobile/core/network/api_response_mapper.dart';
import 'package:apollo_mobile/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:apollo_mobile/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:apollo_mobile/features/auth/data/mappers/auth_response_mapper.dart';
import 'package:apollo_mobile/features/auth/data/mappers/sign_in_mapper.dart';
import 'package:apollo_mobile/features/auth/data/mappers/sign_up_mapper.dart';
import 'package:apollo_mobile/features/auth/domain/entities/auth_entity.dart';
import 'package:apollo_mobile/features/auth/domain/entities/sign_in_entity.dart';
import 'package:apollo_mobile/features/auth/domain/entities/sign_up_entity.dart';
import 'package:apollo_mobile/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<AuthEntity> signIn(SignInEntity data) async {
    var response = await remoteDataSource.signIn(data.toModel());

    await _saveTokenToLocalStorage(
      response.data!.accessToken,
      response.data!.refreshToken,
    );

    return response.mapData((m) => m.toEntity());
  }

  @override
  Future<AuthEntity> signUp(SignUpEntity data) async {
    var response = await remoteDataSource.signUp(data.toModel());

    await _saveTokenToLocalStorage(
      response.data!.accessToken,
      response.data!.refreshToken,
    );

    return response.mapData((m) => m.toEntity());
  }

  Future<void> _saveTokenToLocalStorage(
    String accessToken,
    String refreshToken,
  ) async {
    var _ = await localDataSource.cacheAccessToken(accessToken);
    var _ = await localDataSource.cacheAccessToken(accessToken);
  }
}
