import 'package:apollo_mobile/features/auth/presentation/pages/otp_page.dart';
import 'package:apollo_mobile/features/auth/presentation/pages/sign_in_page.dart';
import 'package:apollo_mobile/features/auth/presentation/pages/sign_up_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

abstract class AuthRoutes {
  static const signIn = '/signIn';
  static const signUp = "/signUp";
  static const otpVerification = "/otpVerification";

  static List<GetPage> routes = [
    GetPage(name: signIn, page: () => SignInPage()),
    GetPage(name: signUp, page: () => SignUpPage()),
    GetPage(name: otpVerification, page: () => OtpPage())
  ];
}
