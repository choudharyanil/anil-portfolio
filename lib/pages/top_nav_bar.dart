import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_app/utils/sizes.dart';
import 'package:portfolio_app/widgets/responsive_widget.dart';

import '../controllers/nav_controller.dart';
import '../utils/app_colors.dart';

class TopNavBar extends StatelessWidget {
  const TopNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final nav = Get.find<NavController>();
    bool isMobile = MediaQuery.sizeOf(context).width < 900;

    return Column(
      children: [
        Obx(
              () => Align(
            alignment: isMobile
                ? Alignment.centerLeft
                : Alignment.centerRight,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.05),
                borderRadius: BorderRadius.circular(40),
                border: Border.all(
                  color: Colors.white.withOpacity(0.15),
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.35),
                    blurRadius: 18,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: isMobile ? _scrollableTabs(nav) : _centerTabs(nav),
            ),
          ),
        ),
      ],
    );
  }

  // ---------------- DESKTOP NAV ----------------
  Widget _centerTabs(NavController nav) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _tab("Home", 0, Icons.home, nav),
        _tab("Resume", 1, Icons.article, nav),
        _tab("Work", 2, Icons.work, nav),
        _tab("Contact", 3, Icons.mail, nav),
      ],
    );
  }

  // ---------------- MOBILE SCROLL NAV ----------------
  Widget _scrollableTabs(NavController nav) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _tab("Home", 0, Icons.home, nav),
          _tab("Resume", 1, Icons.article, nav),
          _tab("Work", 2, Icons.work, nav),
          _tab("Contact", 3, Icons.mail, nav),
        ],
      ),
    );
  }

  // ---------------- TAB BUTTON ----------------
  Widget _tab(String text, int index, IconData icon, NavController c) {
    final active = c.pageIndex.value == index;

    return InkWell(
      onTap: () => c.changePage(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: EdgeInsets.symmetric(
          horizontal: ResponsiveHelper.isMobile(Get.context!)
              ? AppSizes.sm
              : AppSizes.sm,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: ResponsiveHelper.isMobile(Get.context!)
              ? AppSizes.rg
              : AppSizes.md,
          vertical: AppSizes.rg,
        ),
        decoration: BoxDecoration(
          gradient: active ? AppColors.buttonGradient : null,
          color: active ? null : Colors.white.withOpacity(0.08),
          borderRadius: BorderRadius.circular(30),
          boxShadow: active
              ? [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.6),
              blurRadius: 20,
              spreadRadius: 3,
            )
          ]
              : [],
        ),
        child: Row(
          children: [
            Icon(icon, size: 18, color: Colors.white),
            const SizedBox(width: 6),
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
