import 'package:apollo_mobile/features/auth/presentation/pages/otp_page.dart';
import 'package:apollo_mobile/features/auth/presentation/pages/sign_in_page.dart';
import 'package:apollo_mobile/features/auth/presentation/pages/sign_up_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

abstract class AuthRoutes {
  static const signInPage = '/signInPage';
  static const signUpPage = "/signUpPage";
  static const otpVerificationPage = "/otpVerificationPage";

  static List<GetPage> routes = [
    GetPage(name: signInPage, page: () => SignInPage()),
    GetPage(name: signUpPage, page: () => SignUpPage()),
    GetPage(name: otpVerificationPage, page: () => OtpPage()),
  ];
}
