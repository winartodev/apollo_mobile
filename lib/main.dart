import 'package:apollo_mobile/core/network/api_client.dart';
import 'package:apollo_mobile/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:apollo_mobile/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:apollo_mobile/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:apollo_mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:apollo_mobile/features/auth/presentation/pages/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(
    GetMaterialApp(debugShowCheckedModeBanner: false, home: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) =>
              ApiClient(baseUrl: "http://192.168.18.20:8081/api"),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(
              signInUsecase: SignInUsecase(
                repository: AuthRepositoryImpl(
                  remoteDatasource: AuthRemoteDatasourceImpl(
                    client: context.read<ApiClient>(),
                  ),
                ),
              ),
            ),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: SignInPage(),
          onGenerateRoute: (settings) {
            // Add your route generation logic here if needed
            return null;
          },
        ),
      ),
    );
  }
}
