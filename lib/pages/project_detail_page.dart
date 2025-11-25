import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_app/utils/app_colors.dart';

import '../models/project_model.dart';
import '../widgets/store_button.dart';

class ProjectDetailPage extends StatelessWidget {
  final Project project;

  const ProjectDetailPage({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 600;

    // ------------------------------------------------------------------
    // MOBILE VIEW → Simple vertical layout (image → text → buttons)
    // ------------------------------------------------------------------
    if (isMobile) {
      return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(color: AppColors.primary),
        ),
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ---------------------------------------------------
              // FULL-WIDTH IMAGE BEHIND APPBAR (NO STRETCH)
              // ---------------------------------------------------
              Container(
                width: double.infinity,
                color: Colors.black,
                height: Get.height * 0.4,
                child: AspectRatio(
                  aspectRatio: 1.8, // natural non-stretch ratio
                  child: Image.asset(
                    project.image,
                    fit: BoxFit.fill, // keep natural shape
                  ),
                ),
              ),

              // ---------------------------------------------------
              // MAIN CONTENT
              // ---------------------------------------------------
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      project.title,
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Description
                    Text(
                      project.description,
                      style: const TextStyle(
                        fontSize: 15,
                        height: 1.6,
                        color: Colors.white70,
                      ),
                    ),

                    const SizedBox(height: 25),

                    // Store Buttons
                    StoreButtons(
                      playStoreUrl: project.playStore ?? "",
                      appStoreUrl: project.appStore ?? "",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    // ------------------------------------------------------------------
    // WEB / DESKTOP → Keep Glassmorphism Layout
    // (YOUR EXISTING DESIGN)
    // ------------------------------------------------------------------
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Container(
              color: Colors.black,
              child: Center(
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Image.asset(project.image),
                ),
              ),
            ),
          ),

          Container(color: Colors.black.withValues(alpha: 0.55)),

          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 650),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 120),

                    Text(
                      project.title,
                      style: const TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 30),

                    _glassCard(
                      child: Text(
                        project.description,
                        style: const TextStyle(
                          fontSize: 16,
                          height: 1.6,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    StoreButtons(
                      playStoreUrl: project.playStore ?? "",
                      appStoreUrl: project.appStore ?? "",
                    ),

                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ----------------------------------------------------------
  // GLASS CARD (Web/Desktop)
  // ----------------------------------------------------------
  Widget _glassCard({required Widget child}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.13),
            borderRadius: BorderRadius.circular(18),
          ),
          child: child,
        ),
      ),
    );
  }
}
