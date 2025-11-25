import 'package:flutter/material.dart';
import 'package:portfolio_app/utils/sizes.dart';
import 'package:portfolio_app/widgets/store_button.dart';

import '../models/project_model.dart';
import '../utils/app_colors.dart';

class ProjectCard extends StatelessWidget {
  final Project project;

  const ProjectCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: AppSizes.sm,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              project.image,
              height: 160,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          Text(
            project.title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),

          Text(
            project.description ?? "N/A",
            style: const TextStyle(fontSize: 13, color: Colors.grey),
          ),

          StoreButtons(
            hideBorder: true,
            size: 24,
            appStoreUrl: project.appStore ?? "",
            playStoreUrl: project.playStore ?? "",
          ),
        ],
      ),
    );
  }
}
