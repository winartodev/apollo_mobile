import 'package:apollo_mobile/features/auth/auth_routes.dart';
import 'package:get/get.dart';

abstract class AppRoutes {
  static String initialRoute = AuthRoutes.signIn;
  static List<GetPage> routes = [...AuthRoutes.routes];
}
