import 'dart:async';

import 'package:flutter/material.dart';
import 'package:portfolio_app/utils/app_colors.dart';

import 'main_page.dart';
import '../utils/sizes.dart';
import '../widgets/splash/componenets/animated_loading_text.dart';
import '../widgets/splash/componenets/animated_texts_componenets.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedImageContainer(width: 100, height: 100),
            const SizedBox(height: AppSizes.md),
            AnimatedLoadingText(),
          ],
        ),
      ),
    );
  }
}
