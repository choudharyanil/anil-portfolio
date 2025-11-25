import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app_bindings.dart';
import 'routes.dart';
import 'themes/theme_service.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await ThemeService().init();
  runApp(const PortfolioApp());
}


class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Portfolio',
      initialBinding: AppBindings(),
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      // themeMode: ThemeService().li,
      initialRoute: Routes.splash,
      getPages: AppPages.pages,
    );
  }
}
