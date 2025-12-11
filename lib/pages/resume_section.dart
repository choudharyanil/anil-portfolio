import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_app/controllers/project_controller.dart';
import 'package:portfolio_app/utils/sizes.dart';

import '../utils/app_colors.dart';
import '../widgets/store_button.dart';

class ResumeSection extends StatelessWidget {
  const ResumeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery
        .of(context)
        .size
        .width < 850;
    final theme = Theme.of(context);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          //---------------------------------------------------------
          // TITLE
          //---------------------------------------------------------
          Text(
            "Resume",
            style: theme.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 6),

          Container(
            height: 3,
            width: 140,
            decoration: BoxDecoration(
              gradient: AppColors.buttonGradient,
              borderRadius: BorderRadius.circular(4),
            ),
          ),

          const SizedBox(height: 30),

          //---------------------------------------------------------
          // PROFESSIONAL SUMMARY
          //---------------------------------------------------------
          Text(
            "Professional Summary",
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 12),

          Text(
            "Senior Flutter Developer specializing in scalable mobile application development with expertise in Firebase, REST/GraphQL APIs, payment systems, and state management (Bloc / GetX). Published 20+ mobile apps to App Store & Play Store, improved app performance up to 40%, and led cross-functional teams to deliver business-focused products on time.",
            style: theme.textTheme.bodyMedium?.copyWith(
              height: 1.6,
              wordSpacing: 4,
              fontSize: 15,
              color: Colors.white70,
            ),
          ),

          //---------------------------------------------------------
          // TECHNICAL SKILLS
          //---------------------------------------------------------
          const SizedBox(height: 40),

          Text("Technical Skills",
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
                color: Colors.white,
              )),

          const SizedBox(height: 18),

          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: const [
              SkillChip("Flutter"),
              SkillChip("Dart"),
              SkillChip("Android / Kotlin"),
              SkillChip("IOS"),
              SkillChip("Dynamic UI Rendering"),
              SkillChip("Custom Form Builder"),
              SkillChip("Real-Time Sync"),
              SkillChip("Role-Based UI Control"),
              SkillChip("Performance Optimization"),
              SkillChip("Offline-First Architecture"),
              SkillChip("Security & Encryption"),
              SkillChip("REST APIs"),
              SkillChip("Firebase Auth"),
              SkillChip("Google Analytics"),
              SkillChip("Firebase Crashlytics"),
              SkillChip("Firebase Remote Config"),
              SkillChip("Cloud Firestore / Realtime DB"),
              SkillChip("Hive / SQLite"),
              SkillChip("Stripe / PayPal / RazorPay / ApplePay / GooglePay"),
              SkillChip("Push Notifications / Notification Channel"),
              SkillChip("In-App Purchase"),
              SkillChip("Social Login"),
              SkillChip("GetX / Bloc / Provider"),
              SkillChip("Language Localization"),
              SkillChip("Github / Bitbucket"),
              SkillChip("GraphQL APIs"),
              SkillChip("Google Maps"),
              SkillChip("Google Ads"),
              SkillChip("App Links/Dynamic Links"),
              SkillChip("Theme Management"),
              SkillChip("App Deployment on PlayStore/AppStore"),
              SkillChip("Web Applications"),
            ],
          ),

          //---------------------------------------------------------
          // SOFT SKILLS
          //---------------------------------------------------------
          const SizedBox(height: 40),

          Text("Soft Skills",
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
                color: Colors.white,
              )),

          const SizedBox(height: 16),

          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: const [
              SkillChip("Team Collaboration"),
              SkillChip("Problem Solving"),
              SkillChip("Adaptability"),
              SkillChip("Creativity"),
              SkillChip("Communication"),
              SkillChip("Time Management"),
              SkillChip("Mentorship"),

            ],
          ),

          const SizedBox(height: 40),

          //---------------------------------------------------------
          // EXPERIENCE + EDUCATION
          //---------------------------------------------------------
          _educationBlock(context),
          // isMobile
          //     ? Column(
          //   children: [
          //     _experienceBlock(context),
          //     const SizedBox(height: 30),
          //     _educationBlock(context),
          //   ],
          // )
          //     : Row(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Expanded(child: _experienceBlock(context)),
          //     const SizedBox(width: 40),
          //     Expanded(child: _educationBlock(context)),
          //   ],
          // ),

          //---------------------------------------------------------
          // PROJECTS
          //---------------------------------------------------------
          const SizedBox(height: 40),
          Text(
            "Projects",
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),

          Obx(() {
            final portfolio = Get.find<PortfolioController>();

            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: portfolio.projects.map((p) {
                return _projectCard(
                  title: p.title,
                  playStoreUrl: p.playStore ?? "",
                  appStoreUrl: p.appStore ?? "",
                  description: p.description,
                  context: context,
                );
              }).toList(),
            );
          }),

          //---------------------------------------------------------
          // CERTIFICATIONS
          //---------------------------------------------------------
          // const SizedBox(height: 40),
          // Text("Certifications",
          //     style: theme.textTheme.titleLarge?.copyWith(
          //       fontWeight: FontWeight.bold,
          //       color: Colors.white,
          //     )),
          //
          // const SizedBox(height: 16),
          // const SkillChip("Employee Of The Quarter"),

          //---------------------------------------------------------
          // LANGUAGES + HOBBIES
          //---------------------------------------------------------
          const SizedBox(height: 40),
          Text("Languages",
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              )),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: const [SkillChip("English"), SkillChip("Hindi")],
          ),

          const SizedBox(height: 40),
          Text("Hobbies",
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              )),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: const [
              SkillChip("Playing Cricket"),
              SkillChip("Learning New Skills"),
            ],
          ),

          const SizedBox(height: 40),
        ],
      ).paddingSymmetric(horizontal: AppSizes.md),
    );
  }

  //---------------------------------------------------------
  // EXPERIENCE BLOCK
  //---------------------------------------------------------
  Widget _experienceBlock(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            Icon(Icons.work, color: Colors.pinkAccent),
            SizedBox(width: 8),
            Text(
              "Experience",
              style: TextStyle(fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
          ],
        ),
        const SizedBox(height: 18),
        _resumeCard("2024 – Present", "Sr. Flutter Developer",
            "OptimoShell Global Private Limited", context),
        _resumeCard("2023 – 2024", "Sr. Flutter Developer",
            "Softuvo Solutions Pvt. Ltd.", context),
        _resumeCard("2019 – 2023", "Flutter Developer", "Elintminds", context),
        _resumeCard("2018 – 2019", "Android Developer", "Elintminds", context),
      ],
    );
  }

  //---------------------------------------------------------
  // EDUCATION BLOCK
  //---------------------------------------------------------
  Widget _educationBlock(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            Icon(Icons.school, color: Colors.blueAccent),
            SizedBox(width: 8),
            Text(
              "Education",
              style: TextStyle(fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
          ],
        ),
        const SizedBox(height: 18),
        _resumeCard("2018", "MCA – Computers",
            "Himachal Pradesh University (HPU) • 75%", context),
        _resumeCard("2015", "BCA – Computers",
            "Himachal Pradesh University (HPU) • 64%", context),
      ],
    );
  }

  //---------------------------------------------------------
  // PROJECT CARD
  //---------------------------------------------------------
  Widget _projectCard({
    required String title,
    required String description,
    required String playStoreUrl,
    required String appStoreUrl,
    required BuildContext context,
  }) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 22),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white12),
        gradient: LinearGradient(
            colors: [Colors.white.withValues(alpha: 0.05),
        Colors.white.withValues(alpha: 0.02)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w700,
            color: Colors.white,
          )),
          const SizedBox(height: 10),
          Text(description, style: theme.textTheme.bodyMedium?.copyWith(
            fontSize: 14,
            height: 1.6,
            color: Colors.white70,
          )),
          const SizedBox(height: 10),
          StoreButtons(
            hideBorder: true,
            size: 28,
            appStoreUrl: appStoreUrl,
            playStoreUrl: playStoreUrl,
          ),
        ],
      ),
    );
  }

  //---------------------------------------------------------
  // GENERIC RESUME CARD BLOCK
  //---------------------------------------------------------
  Widget _resumeCard(String year, String title, String place,
      BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white12),
        gradient: LinearGradient(
            colors: [Colors.white.withValues(alpha: 0.05),
        Colors.white.withValues(alpha: 0.02)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(year,
              style: const TextStyle(color: Colors.white60, fontSize: 13)),
          const SizedBox(height: 6),
          Text(title, style: const TextStyle(
              fontSize: 17, fontWeight: FontWeight.w700, color: Colors.white)),
          const SizedBox(height: 4),
          Text(place,
              style: const TextStyle(fontSize: 14, color: Colors.white70)),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------
// CHIP
// ---------------------------------------------------------
class SkillChip extends StatelessWidget {
  final String text;

  const SkillChip(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Chip(
        backgroundColor: Colors.white.withValues(alpha: .07),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Colors.white12),
          ),
          label: Text(
            text,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        );
    }
}
