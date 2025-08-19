import 'package:apollo_mobile/features/home/presentation/pages/home_page.dart';
import 'package:get/get.dart';

abstract class HomeRoutes {
  static const String homePage = "/homePage";

  static List<GetPage> routes = [
    GetPage(name: homePage, page: () => HomePage()),
  ];
}
