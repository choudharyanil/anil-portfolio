import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:portfolio_app/utils/sizes.dart';
import 'package:portfolio_app/widgets/responsive_widget.dart';
import 'package:portfolio_app/widgets/social_icon.dart';

import '../themes/neon_theme.dart';
import '../utils/app_colors.dart';
import '../utils/app_images.dart';
import '../utils/app_strings.dart';
import '../widgets/gradientbutton.dart';

class ProfileSidebar extends StatelessWidget {
  const ProfileSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final neon = theme.extension<NeonTheme>()!;

    return Container(
      width: Get.width * 0.24,
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
      decoration: AppColors.cardDecoration,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ResponsiveHelper.isMobile(context)
                ? Align(
                    alignment: Alignment.centerRight,
                    child: ShaderMask(
                      shaderCallback: (bounds) =>
                          AppColors.buttonGradient.createShader(bounds),
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Close drawer
                        },
                        icon: Icon(Icons.close, size: 24),
                      ),
                    ),
                  )
                : const SizedBox(height: AppSizes.lg),
            // -----------------------------------------------------
            // PROFILE IMAGE
            // -----------------------------------------------------
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(AppImages.profileImg),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                    color: neon.glowColor.withValues(alpha: .3),
                    blurRadius: 35,
                    spreadRadius: 4,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // -----------------------------------------------------
            // NAME + TITLE
            // -----------------------------------------------------
            Text(
              AppStrings.name,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              AppStrings.title,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: Colors.white70,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 20),

            // -----------------------------------------------------
            // SOCIAL ICONS
            // -----------------------------------------------------
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialIcon(
                  icon: FontAwesomeIcons.linkedin,
                  url: AppStrings.linkedInURL,
                ),
                SocialIcon(
                  icon: FontAwesomeIcons.whatsapp,
                  url: AppStrings.whatsAppUrl,
                ),
                SocialIcon(
                  icon: FontAwesomeIcons.github,
                  url: AppStrings.githubURL,
                ),
                // _social(Icons.person),
              ],
            ),

            const SizedBox(height: 30),

            // -----------------------------------------------------
            // BASIC INFO SECTION (LIKE THE SCREENSHOT)
            // -----------------------------------------------------
            // _infoItem("Phone", AppStrings.phone),
            // _infoItem("Email", AppStrings.email),
            // // _infoItem("Residence:", "India"),
            // // _infoItem("Freelance:", "Available", isGreen: true),
            // _infoItem("Address:", AppStrings.address),
            _infoItem(Icons.phone_in_talk, AppStrings.phone),
            _infoItem(Icons.email_outlined, AppStrings.email),
            // _infoItem(Icons.location_city, "India"),
            // _infoItem("Freelance:", "Available", isGreen: true),
            _infoItem(Icons.location_on_outlined, AppStrings.address),

            Divider(color: Colors.white24, height: 30),

            // -----------------------------------------------------
            // LANGUAGES (ONLY ENGLISH + HINDI)
            // -----------------------------------------------------
            // _sectionTitle("Languages"),
            // _progressItem("English", 0.90),
            // _progressItem("Hindi", 1.0),
            const SizedBox(height: 16),

            // -----------------------------------------------------
            // FLUTTER DEVELOPER SKILLS (CORRECTED)
            // -----------------------------------------------------
            _sectionTitle("Skills"),
            _progressItem("Flutter", 0.95),
            _progressItem("Dart", 0.90),
            _progressItem("REST APIs", 0.85),
            _progressItem("Firebase", 0.85),
            _progressItem("GetX / Bloc", 0.90),
            _progressItem("HiveDB / SQLite", 0.80),
            _progressItem("Play Store Deployment", .95),
            _progressItem("App Store Deployment", 0.95),
            _progressItem("Performance Optimization", 0.90),

            const SizedBox(height: 16),

            // -----------------------------------------------------
            // EXTRA SKILLS
            // -----------------------------------------------------
            _sectionTitle("Extra Skills"),
            _extraSkill("Git / GitHub / Bitbucket"),
            _extraSkill("Google Maps & Location"),
            _extraSkill(
              "Payment Gateways (Stripe / RazorPay / PayPAl / Apple/Google Pay)",
            ),
            _extraSkill("Push Notifications"),
            _extraSkill("Dynamic UI Rendering"),
            _extraSkill("Theme Management"),

            const SizedBox(height: 24),

            // -----------------------------------------------------
            // DOWNLOAD BUTTON
            // -----------------------------------------------------
            SizedBox(
              width: double.infinity,
              child: GradientButton(
                onTap: () {},
                icon: Icons.download,
                text: "Download CV",
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ======================================================
  // COMPONENTS
  // ======================================================

  Widget _infoItem(
    IconData icon,
    /*String label,*/ String value, {
    bool isGreen = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          /*  Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(.3),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ) ,
          ),*/
          ShaderMask(
            shaderCallback: (bounds) =>
                AppColors.buttonGradient.createShader(bounds),
            child: Icon(icon, size: 20),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                color: isGreen ? Colors.greenAccent : Colors.white,
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
      ),
    );
  }

  Widget _progressItem(String label, double value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label, style: const TextStyle(fontSize: 13)),
              Text(
                "${(value * 100).toInt()}%",
                style: const TextStyle(fontSize: 13),
              ),
            ],
          ),
          const SizedBox(height: 5),
          ShaderMask(
            shaderCallback: (bounds) =>
                AppColors.buttonGradient.createShader(bounds),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: value,
                minHeight: 3,
                backgroundColor: Colors.white12,
                // valueColor: AlwaysStoppedAnimation(AppColors.primary),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _extraSkill(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          ShaderMask(
            shaderCallback: (bounds) =>
                AppColors.buttonGradient.createShader(bounds),
            child: Icon(Icons.arrow_right, size: 18),
          ),
          const SizedBox(width: 6),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 13))),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:portfolio_app/utils/app_images.dart';
// import 'package:portfolio_app/utils/app_strings.dart';
// import 'package:portfolio_app/widgets/gradientbutton.dart';
// import '../themes/neon_theme.dart';
// import '../utils/app_colors.dart';
//
// class ProfileCard extends StatelessWidget {
//   final String name;
//   final String title;
//   final String image;
//
//   const ProfileCard({
//     super.key,
//     required this.name,
//     required this.title,
//     required this.image,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final bool isMobile = MediaQuery.of(context).size.width < 700;
//     return isMobile ? _mobileCard(context) : _desktopCard(context);
//   }
//
//   // ======================================================================
//   //                           DESKTOP VERSION
//   // ======================================================================
//   Widget _desktopCard(BuildContext context) {
//     final theme = Theme.of(context);
//     final neon = theme.extension<NeonTheme>()!;
//
//     return Stack(
//       clipBehavior: Clip.none,
//       children: [
//         Container(
//           width: Get.width * 0.24,
//           margin: const EdgeInsets.only(top: 70),
//           padding: const EdgeInsets.fromLTRB(24, 90, 24, 24),
//           decoration: BoxDecoration(
//             color: theme.cardColor,
//             borderRadius: BorderRadius.circular(22),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withValues(alpha: 0.15),
//                 blurRadius: 25,
//                 offset: const Offset(0, 10),
//               ),
//             ],
//           ),
//           child: Column(
//             children: [
//               Text(name, style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
//               const SizedBox(height: 4),
//               Text(title, style: theme.textTheme.bodyMedium?.copyWith(color: AppColors.bodyTextColor)),
//               const SizedBox(height: 20),
//
//               // Row(
//               //   mainAxisAlignment: MainAxisAlignment.center,
//               //   children: [
//               //     _socialIcon(Icons.facebook, context),
//               //     _socialIcon(Icons.link, context),
//               //     _socialIcon(Icons.code, context),
//               //     _socialIcon(Icons.person, context),
//               //   ],
//               // ),
//
//               const SizedBox(height: 22),
//               _info(Icons.phone, AppStrings.phone, context),
//               _info(Icons.email, AppStrings.email, context),
//               _info(Icons.location_on, AppStrings.address, context),
//
//               const SizedBox(height: 20),
//               SizedBox(
//                 width: double.infinity,
//                 child: GradientButton(
//                   onTap: () {},
//                   icon: Icons.download,
//                   text: "Download Resume",
//                 ),
//               ),
//             ],
//           ),
//         ),
//
//         Positioned(
//           top: -10,
//           left: 0,
//           right: 0,
//           child: Center(
//             child: Container(
//               height: 120,
//               width: 120,
//
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 gradient: neon.gradient,
//                 image: DecorationImage(image: AssetImage(AppImages.profileImg),fit: BoxFit.cover),
//                 boxShadow: [
//                   BoxShadow(
//                     color: neon.glowColor.withValues(alpha: .7),
//                     blurRadius: 32,
//                     spreadRadius: 4,
//                   )
//                 ],
//               ),
//
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   // ======================================================================
//   //                           MOBILE CARD
//   // ======================================================================
//   Widget _mobileCard(BuildContext context) {
//     final theme = Theme.of(context);
//
//     return Column(
//       children: [
//         Center(
//           child: Container(
//             height: 110,
//             width: 110,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               image: DecorationImage(image: AssetImage(AppImages.profileImg),fit: BoxFit.cover),
//               gradient: theme.extension<NeonTheme>()!.gradient,
//             ),
//           ),
//         ),
//
//         const SizedBox(height: 16),
//
//         Container(
//           width: double.infinity,
//           padding: const EdgeInsets.all(22),
//           decoration: BoxDecoration(
//             color: theme.cardColor,
//             borderRadius: BorderRadius.circular(18),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withValues(alpha: 0.10),
//                 blurRadius: 12,
//                 offset: const Offset(0, 5),
//               ),
//             ],
//           ),
//           child: Column(
//             children: [
//               Text(name, style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
//               const SizedBox(height: 4),
//               Text(title, style: theme.textTheme.bodyMedium),
//               const SizedBox(height: 20),
//
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   _socialIcon(Icons.facebook, context),
//                   _socialIcon(Icons.link, context),
//                   _socialIcon(Icons.code, context),
//                   _socialIcon(Icons.person, context),
//                 ],
//               ),
//
//               const SizedBox(height: 22),
//               _info(Icons.phone, AppStrings.phone, context),
//               _info(Icons.email, AppStrings.email, context),
//               _info(Icons.location_on, AppStrings.address, context),
//
//               const SizedBox(height: 20),
//               GradientButton(
//                 onTap: () {},
//                 icon: Icons.download,
//                 text: "Download Resume",
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
//
//   // ======================================================================
//   //                          HELPERS
//   // ======================================================================
//   Widget _socialIcon(IconData icon, BuildContext context) {
//     final theme = Theme.of(context);
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 6),
//       child: CircleAvatar(
//         radius: 20,
//         backgroundColor: theme.cardColor.withValues(alpha: .5),
//         child: Icon(icon, size: 18, color: theme.iconTheme.color),
//       ),
//     );
//   }
//
//   Widget _info(IconData icon, String text, BuildContext context) {
//     final theme = Theme.of(context);
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 12),
//       child: Row(
//         children: [
//           Icon(icon, color: Colors.pinkAccent),
//           const SizedBox(width: 10),
//           Expanded(child: Text(text, style: theme.textTheme.bodyMedium)),
//         ],
//       ),
//     );
//   }
// }
