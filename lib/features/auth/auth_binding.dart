import 'package:apollo_mobile/core/network/api_client.dart';
import 'package:apollo_mobile/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:apollo_mobile/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:apollo_mobile/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:apollo_mobile/features/auth/domain/repositories/auth_repository.dart';
import 'package:apollo_mobile/features/auth/domain/usecases/sign_in_usecase.dart';
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
        localDataSource: Get.find<AuthLocalDataSource>(),
        remoteDataSource: Get.find<AuthRemoteDatasource>(),
      ),
      fenix: true,
    );

    Get.lazyPut<AuthBloc>(
      () => AuthBloc(
        sharedPreferences: Get.find<SharedPreferences>(),
        signInUsecase: SignInUsecase(repository: Get.find<AuthRepository>()),
      ),
      fenix: true,
    );
  }
}
