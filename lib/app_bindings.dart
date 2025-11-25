/*--- lib/app_bindings.dart ---*/
import 'package:get/get.dart';

import 'controllers/nav_controller.dart';
import 'controllers/project_controller.dart';
import 'controllers/theme_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController());
    Get.put(PortfolioController());
    Get.put(NavController());
  }
}
