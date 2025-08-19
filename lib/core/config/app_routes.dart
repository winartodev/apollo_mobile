import 'package:apollo_mobile/features/auth/auth_routes.dart';
import 'package:apollo_mobile/features/home/home_routes.dart';
import 'package:get/get.dart';

abstract class AppRoutes {
  static String initialRoute = AuthRoutes.signInPage;
  static List<GetPage> routes = [...AuthRoutes.routes, ...HomeRoutes.routes];
}
