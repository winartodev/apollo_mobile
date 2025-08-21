import 'package:apollo_mobile/core/network/api_client.dart';
import 'package:apollo_mobile/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:apollo_mobile/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:apollo_mobile/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:apollo_mobile/features/auth/data/repositories/auth_storage_repository_impl.dart';
import 'package:apollo_mobile/features/auth/domain/repositories/auth_repository.dart';
import 'package:apollo_mobile/features/auth/domain/repositories/auth_storage_repository.dart';
import 'package:apollo_mobile/features/auth/domain/usecases/auth_storage_usecase.dart';
import 'package:apollo_mobile/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:apollo_mobile/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:apollo_mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl(prefs: Get.find<SharedPreferences>()),
    );

    Get.lazyPut<AuthRemoteDatasource>(
      () => AuthRemoteDatasourceImpl(client: Get.find<ApiClient>()),
    );

    Get.lazyPut<AuthRepository>(
      () => AuthRepositoryImpl(
        remoteDataSource: Get.find<AuthRemoteDatasource>(),
        localDataSource: Get.find<AuthLocalDataSource>(),
      ),
      fenix: true,
    );

    Get.lazyPut<AuthStorageRepository>(
      () => AuthStorageRepositoryImpl(
        localDataSource: Get.find<AuthLocalDataSource>(),
      ),
      fenix: true,
    );

    Get.lazyPut<AuthBloc>(
      () => AuthBloc(
        sharedPreferences: Get.find<SharedPreferences>(),
        signInUsecase: SignInUseCase(authRepo: Get.find<AuthRepository>()),
        signUpUsecase: SignUpUseCase(authRepo: Get.find<AuthRepository>()),
        authStorageUsecase: AuthStorageUsecase(
          authStorageRepo: Get.find<AuthStorageRepository>(),
        ),
      ),
      fenix: true,
    );
  }
}
