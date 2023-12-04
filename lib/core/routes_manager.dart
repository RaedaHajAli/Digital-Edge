import 'package:digitaledge/pages/home/bindings.dart';
import 'package:digitaledge/pages/home/view.dart';
import 'package:digitaledge/pages/login/bindings.dart';

import 'package:digitaledge/pages/register/bindings.dart';
import 'package:digitaledge/pages/login/view.dart';
import 'package:digitaledge/pages/register/view.dart';
import 'package:digitaledge/pages/update_information/bindings.dart';
import 'package:digitaledge/pages/update_information/view.dart';
import 'package:digitaledge/pages/welcome/view.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String welcomeRoute = '/';
  static const String homeRoute = '/home';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';

  static const String updateInformationRoute = '/updateInformation';
}

class AppPages {
  static const initial = AppRoutes.welcomeRoute;


  static final List<GetPage> routes = [
    GetPage(
        name: AppRoutes.welcomeRoute,
        page: () => WelcomeView(),
        binding: LoginBiniding()),
    GetPage(
        name: AppRoutes.loginRoute,
        page: () => LoginView(),
        binding: LoginBiniding()),
    GetPage(
        name: AppRoutes.registerRoute,
        page: () => const RegisterView(),
        binding: RegisterBiniding()),
    GetPage(
        name: AppRoutes.homeRoute,
        page: () => const HomeView(),
        binding: HomeBiniding()),
    GetPage(
        name: AppRoutes.updateInformationRoute,
        page: () => const UpdateInformationView(),
        binding: UpdateInformationBiniding()),
  ];
}
