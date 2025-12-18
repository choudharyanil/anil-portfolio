import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_app/utils/sizes.dart';
import '../utils/app_colors.dart';
import '../widgets/about_me.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 900;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ---------------- ABOUT ME TITLE ----------------
          const Text(
            "ABOUT ME",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.3,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 8),

          Container(
            height: 4,
            width: 160,
            decoration: BoxDecoration(
              gradient: AppColors.buttonGradient,
              borderRadius: BorderRadius.circular(6),
              boxShadow: [
                BoxShadow(
                  color: Colors.blueAccent.withOpacity(0.5),
                  blurRadius: 18,
                  spreadRadius: 2,
                )
              ],
            ),
          ),

          const SizedBox(height: 22),

          // ---------------- ABOUT TEXT ----------------
            const AboutMeAnimated(),

          const SizedBox(height: 40),

          // ---------------- WHAT I DO TITLE ----------------
          ShaderMask(
            shaderCallback: (bounds) => AppColors.buttonGradient
                .createShader(bounds),
            child: const Text(
              "What I Do",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),

          const SizedBox(height: 18),

          // ---------------- SKILL CARDS ----------------
          Wrap(
            spacing: AppSizes.md,
            runSpacing: AppSizes.md,
            children: const [
              SkillCard(
                title: "Mobile App Development",
                icon: Icons.phone_android,
                text:
                "Building robust, scalable and high-performance cross-platform apps "
                    "with Flutter using clean architecture and modern patterns.",
              ),
              SkillCard(
                title: "UI/UX & Animations",
                icon: Icons.animation,
                text:
                "Transforming Figma designs into pixel-perfect layouts with smooth "
                    "animations, transitions and responsiveness.",
              ),
              SkillCard(
                title: "REST & GraphQL APIs",
                icon: Icons.api,
                text:
                "Expert in integrating REST / GraphQL APIs with authentication, error "
                    "handling, caching and real-time data sync.",
              ),
              SkillCard(
                title: "Firebase & Analytics",
                icon: Icons.verified_user,
                text:
                "Auth, Crashlytics, Analytics, Cloud Firestore, Push Notifications, "
                    "Remote Config and A/B Testing experience.",
              ),
              SkillCard(
                title: "State Management",
                icon: Icons.merge_type,
                text:
                "GetX, Bloc, Riverpod, Provider — choosing the best approach for "
                    "scalable architecture & performance.",
              ),
              SkillCard(
                title: "Deployment & CI/CD",
                icon: Icons.cloud_done,
                text:
                "App Store & Play Store publishing, build signing, CI/CD automation "
                    "and release management.",
              ),
            ],
          ),
        ],
      ).paddingSymmetric(horizontal: AppSizes.md),
    );
  }
}


// ==================================
// Neon Glass Skill Card
// ==================================
class SkillCard extends StatefulWidget {
  final String title;
  final String text;
  final IconData icon;

  const SkillCard({
    super.key,
    required this.title,
    required this.text,
    required this.icon,
  });

  @override
  State<SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<SkillCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 700;

    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),

      child: AnimatedContainer(
        duration: const Duration(milliseconds: 240),
        curve: Curves.easeOut,
        constraints: BoxConstraints(
          minHeight: 220,
          maxWidth: isMobile ? double.infinity : 340,
        ),
        padding: const EdgeInsets.all(24),
        transform:
        isHovered ? (Matrix4.identity()..scale(1.04)) : Matrix4.identity(),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: Colors.white.withOpacity(0.15),
          ),
          gradient: LinearGradient(
            colors: [
              Colors.white.withValues(alpha: 0.05),
              Colors.white.withValues(alpha: 0.02),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: isHovered
              ? [
            BoxShadow(
              color:Colors.pinkAccent.withValues(alpha: 0.01),
              blurRadius: 25,
              spreadRadius: 4,
            )
          ]
              : [
            BoxShadow(
              color:AppColors.secondaryColor.withValues(alpha:0.25),
              blurRadius: 12,
              offset: const Offset(0, 6),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // -------- ICON CIRCLE --------
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: AppColors.buttonGradient,
              ),
              child: Icon(widget.icon, size: 28, color: Colors.white),
            ),

            const SizedBox(height: 16),

            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 12),

            Text(
              widget.text,
              style: TextStyle(
                color: Colors.white.withOpacity(0.8),
                height: 1.5,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
