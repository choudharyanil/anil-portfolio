import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_app/pages/top_nav_bar.dart';
import 'package:portfolio_app/utils/app_images.dart';
import 'package:portfolio_app/utils/app_strings.dart';
import 'package:portfolio_app/utils/sizes.dart';

import '../controllers/nav_controller.dart';
import '../controllers/theme_controller.dart';
import '../utils/app_colors.dart';
import '../widgets/profile_card.dart';
import 'contact_section.dart';
import 'home_section.dart';
import 'resume_section.dart';
import 'work_section.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final nav = Get.find<NavController>();
    final themeC = Get.find<ThemeController>();

    final width = MediaQuery.of(context).size.width;
    bool isMobile = width < 900;

    return Scaffold(
      backgroundColor: AppColors.bgColor,

      drawer: isMobile
          ? Drawer(
        backgroundColor: AppColors.darkColor,
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: const ProfileCard(
              name: AppStrings.name,
              title: AppStrings.title,
              image: AppImages.profileImg,
            ),
          ),
        ),
      )
          : null,

      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF000515),
              Color(0xFF0A0F29),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Top bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      if (isMobile)
                        Builder(
                          builder: (context) => IconButton(
                            icon: const Icon(
                              Icons.menu,
                              size: 30,
                              color: AppColors.primary,
                            ),
                            onPressed: () => Scaffold.of(context).openDrawer(),
                          ),
                        ),

                      AnimatedContainer(
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.easeOut,
                        width: isMobile ? Get.width * 0.6 : Get.width * 0.2,
                        child: ShaderMask(
                          shaderCallback: (bounds) => const LinearGradient(
                            colors: [
                              Color(0xFFFF9C1A),
                              Color(0xFFF63D2E),
                            ],
                          ).createShader(bounds),
                          child: Text(
                            AppStrings.name,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.sacramento(
                              fontSize: isMobile ? 26 : 40,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ).paddingOnly(top: isMobile ? AppSizes.sm : 0),
                    ],
                  ),

                  IconButton(
                    onPressed: () => themeC.toggleTheme(),
                    icon: const Icon(
                      Icons.brightness_6,
                      size: 24,
                      color: Colors.white,
                    ),
                  ),
                ],
              ).paddingOnly(bottom: AppSizes.md),

              Expanded(
                child: isMobile ? _mobileLayout(nav) : _desktopLayout(nav),
              ),
            ],
          ).paddingSymmetric(
            horizontal: isMobile ? AppSizes.sm : AppSizes.md,
            vertical: isMobile ? AppSizes.sm : AppSizes.md,
          ),
        ),
      ),
    );
  }

  // ------- Desktop Layout -------
  Widget _desktopLayout(NavController nav) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TweenAnimationBuilder(
          tween: Tween<double>(begin: -40, end: 0),
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeOut,
          builder: (context, value, child) => Transform.translate(
            offset: Offset(value, 0),
            child: Opacity(opacity: 1 - (value / -40), child: child),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.4),
                  blurRadius: 22,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: const ProfileCard(
              name: AppStrings.name,
              title: AppStrings.title,
              image: AppImages.profileImg,
            ),
          ),
        ),
        const SizedBox(width: 32),
        Expanded(child: _contentBox(nav)),
      ],
    );
  }

  // ------- Mobile Layout -------
  Widget _mobileLayout(NavController nav) {
    return Column(
      children: [
        const TopNavBar(),
        const SizedBox(height: 20),
        Expanded(child: _mobileContent(nav)),
      ],
    );
  }

  Widget _mobileContent(NavController nav) {
    return Obx(() {
      return AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        switchInCurve: Curves.easeOutQuart,
        switchOutCurve: Curves.easeInQuart,
        transitionBuilder: _coolTransition,
        child: _buildPage(nav.pageIndex.value),
      );
    });
  }

  // ------- Desktop Content Box -------
  Widget _contentBox(NavController nav) {
    return Column(
      children: [
        const TopNavBar(),
        const SizedBox(height: AppSizes.sm),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: AppSizes.xl,
            ),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF101526), Color(0xFF0B1120)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(22),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.5),
                  blurRadius: 25,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Obx(
                  () => AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                switchInCurve: Curves.easeOutQuart,
                switchOutCurve: Curves.easeInQuart,
                transitionBuilder: _coolTransition,
                child: _buildPage(nav.pageIndex.value),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // --------- CUSTOM COOL TRANSITION ---------
  Widget _coolTransition(Widget child, Animation<double> animation) {
    final fade = Tween<double>(begin: 0, end: 1).animate(animation);
    final scale = Tween<double>(begin: 0.95, end: 1.0).animate(
      CurvedAnimation(parent: animation, curve: Curves.easeOutBack),
    );
    final slide = Tween<Offset>(
      begin: const Offset(0.05, 0),
      end: Offset.zero,
    ).animate(animation);

    return FadeTransition(
      opacity: fade,
      child: SlideTransition(
        position: slide,
        child: ScaleTransition(scale: scale, child: child),
      ),
    );
  }

  // ------- Page Builder -------
  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return const HomeSection(key: ValueKey("home"));
      case 1:
        return const ResumeSection(key: ValueKey("resume"));
      case 2:
        return const WorkSection(key: ValueKey("work"));
      case 3:
        return const ContactSection(key: ValueKey("contact"));
      default:
        return const HomeSection(key: ValueKey("default"));
    }
  }
}
