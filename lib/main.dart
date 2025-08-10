import 'package:apollo_mobile/core/config/app_bindings.dart';
import 'package:apollo_mobile/core/config/app_routes.dart';
import 'package:apollo_mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppBindings.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider.value(value: Get.find<AuthBloc>())],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.initialRoute,
        getPages: AppRoutes.routes,
        navigatorObservers: [],
      ),
    );
  }
}
