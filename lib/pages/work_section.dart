import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_app/pages/project_detail_page.dart';
import 'package:portfolio_app/utils/sizes.dart';
import '../../controllers/project_controller.dart';
import '../../utils/app_colors.dart';
import '../../widgets/project_card.dart';

class WorkSection extends StatelessWidget {
  const WorkSection({super.key});

  @override
  Widget build(BuildContext context) {
    final portfolio = Get.find<PortfolioController>();
    final theme = Theme.of(context);
    final bool isMobile = MediaQuery.of(context).size.width < 750;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),

      child: SizedBox(
        width: Get.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            Text(
              "Portfolio",
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 6),

            Container(
              height: 3,
              width: 130,
              decoration: BoxDecoration(
                gradient: AppColors.buttonGradient,
                borderRadius: BorderRadius.circular(4),
              ),
            ),

            const SizedBox(height: 26),

            // ---------------- FILTER CHIPS ----------------
            Obx(() {
              return Wrap(
                spacing: 10,
                runSpacing: 10,
                children: portfolio.categories.map((c) {
                  final bool isSelected = portfolio.selectedCategory.value == c;

                  return GestureDetector(
                    onTap: () => portfolio.selectCategory(c),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      decoration: BoxDecoration(
                        gradient: isSelected ? AppColors.buttonGradient : null,
                        color: isSelected ? null : Colors.white.withValues(alpha: 0.06),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.white24),
                        boxShadow: isSelected
                            ? [
                          BoxShadow(
                            color: Colors.pinkAccent.withValues(alpha: .3),
                            blurRadius: 15,
                            offset: const Offset(0, 4),
                          )
                        ]
                            : [],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            _chipIcon(c),
                            size: 18,
                            color: isSelected ? Colors.white : Colors.white70,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            c,
                            style: TextStyle(
                              fontSize: 13,
                              color: isSelected ? Colors.white : Colors.white70,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              );
            }),

            const SizedBox(height: 28),

            // ---------------- PROJECT CARDS ----------------
            Obx(() {
              return Wrap(
                spacing: 22,
                runSpacing: 22,
                children: portfolio.filteredProjects.map((p) {
                  return SizedBox(
                    width: isMobile ? double.infinity : 340,
                    child: InkWell(
                      onTap: () => Get.to(() => ProjectDetailPage(project: p)),
                      child: ProjectCard(project: p),     // Uses glass style already
                    ),
                  );
                }).toList(),
              );
            }),
          ],
        ),
      ),
    );
  }

  IconData _chipIcon(String c) {
    switch (c.toLowerCase()) {
      case "all":
        return Icons.grid_view_rounded;
      case "app development":
        return Icons.phone_android;
      case "web development":
        return Icons.web;
      case "design":
        return Icons.brush;
      default:
        return Icons.apps;
    }
  }
}
