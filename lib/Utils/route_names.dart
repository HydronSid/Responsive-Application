import 'package:get/get.dart';
import 'package:responsive_project/Screens/Auth/Login/login_screen.dart';
import 'package:responsive_project/Screens/Auth/Register/register_screen.dart';
import 'package:responsive_project/Screens/Home-Screen/home_screen.dart';

class RouteNames {
  static const String loginScreen = "/login_screen";
  static const String registrationScreen = "/registration_screen";
  static const String homeScreen = "/home_screen";
}

class AppRoute {
  static appRoutes() => [
        GetPage(
            name: RouteNames.loginScreen,
            page: () => const LoginScreen(),
            transition: Transition.fadeIn,
            transitionDuration: const Duration(milliseconds: 250)),
        GetPage(
            name: RouteNames.registrationScreen,
            page: () => const RegistrationScreen(),
            transition: Transition.fadeIn,
            transitionDuration: const Duration(milliseconds: 250)),
        GetPage(
            name: RouteNames.homeScreen,
            page: () => const HomeScreen(),
            transition: Transition.fadeIn,
            transitionDuration: const Duration(milliseconds: 250)),
      ];
}
