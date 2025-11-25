
import 'package:get/get.dart';
import 'package:portfolio_app/pages/main_page.dart';
import 'package:portfolio_app/pages/splash_view.dart';

class Routes {
  static const home = '/';
  static const splash = '/';
}

class AppPages {
  static final pages = [
    GetPage(name: Routes.splash, page: () => const SplashView()),
    GetPage(name: Routes.home, page: () => const MainPage()),
  ];
}
