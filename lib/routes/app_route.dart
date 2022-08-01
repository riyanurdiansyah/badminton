import 'package:badminton/bindings/signin_binding.dart';
import 'package:badminton/bindings/splash_binding.dart';
import 'package:badminton/pages/home_page.dart';
import 'package:badminton/pages/signin_page.dart';
import 'package:badminton/pages/splash_page.dart';
import 'package:badminton/routes/app_route_name.dart';
import 'package:get/get.dart';

class AppRoute {
  static final routes = [
    GetPage(
      name: AppRouteName.splash,
      page: () => const SplashPage(),
      binding: SplashBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: AppRouteName.signin,
      page: () => SigninPage(),
      binding: SigninBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: AppRouteName.home,
      page: () => const HomePage(),
      transition: Transition.cupertino,
    ),
  ];
}
