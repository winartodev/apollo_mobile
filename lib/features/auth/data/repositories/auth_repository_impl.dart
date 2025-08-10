import 'package:apollo_mobile/core/network/api_response_mapper.dart';
import 'package:apollo_mobile/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:apollo_mobile/features/auth/data/mappers/auth_response_mapper.dart';
import 'package:apollo_mobile/features/auth/data/mappers/sign_in_mapper.dart';
import 'package:apollo_mobile/features/auth/data/mappers/sign_up_mapper.dart';
import 'package:apollo_mobile/features/auth/domain/entities/auth_entity.dart';
import 'package:apollo_mobile/features/auth/domain/entities/sign_in_entity.dart';
import 'package:apollo_mobile/features/auth/domain/entities/sign_up_entity.dart';
import 'package:apollo_mobile/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource remoteDatasource;

  AuthRepositoryImpl({required this.remoteDatasource});

  @override
  Future<AuthEntity> signIn(SignInEntity data) async {
    var response = await remoteDatasource.signIn(data.toModel());
    return response.mapData((m) => m.toEntity());
  }

  @override
  Future<AuthEntity> signUp(SignUpEntity data) async {
    var response = await remoteDatasource.signUp(data.toModel());
    return response.mapData((m) => m.toEntity());
  }
}
