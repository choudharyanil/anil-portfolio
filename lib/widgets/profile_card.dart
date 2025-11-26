import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_app/utils/app_images.dart';
import 'package:portfolio_app/utils/app_strings.dart';
import 'package:portfolio_app/widgets/gradientbutton.dart';
import '../themes/neon_theme.dart';
import '../utils/app_colors.dart';

class ProfileCard extends StatelessWidget {
  final String name;
  final String title;
  final String image;

  const ProfileCard({
    super.key,
    required this.name,
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 700;
    return isMobile ? _mobileCard(context) : _desktopCard(context);
  }

  // ======================================================================
  //                           DESKTOP VERSION
  // ======================================================================
  Widget _desktopCard(BuildContext context) {
    final theme = Theme.of(context);
    final neon = theme.extension<NeonTheme>()!;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: Get.width * 0.24,
          margin: const EdgeInsets.only(top: 70),
          padding: const EdgeInsets.fromLTRB(24, 90, 24, 24),
          decoration: BoxDecoration(
            color: theme.cardColor,
            borderRadius: BorderRadius.circular(22),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.15),
                blurRadius: 25,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            children: [
              Text(name, style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text(title, style: theme.textTheme.bodyMedium?.copyWith(color: AppColors.bodyTextColor)),
              const SizedBox(height: 20),

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     _socialIcon(Icons.facebook, context),
              //     _socialIcon(Icons.link, context),
              //     _socialIcon(Icons.code, context),
              //     _socialIcon(Icons.person, context),
              //   ],
              // ),

              const SizedBox(height: 22),
              _info(Icons.phone, AppStrings.phone, context),
              _info(Icons.email, AppStrings.email, context),
              _info(Icons.location_on, AppStrings.address, context),

              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: GradientButton(
                  onTap: () {},
                  icon: Icons.download,
                  text: "Download Resume",
                ),
              ),
            ],
          ),
        ),

        Positioned(
          top: -10,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              height: 120,
              width: 120,
              
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: neon.gradient,
                image: DecorationImage(image: AssetImage(AppImages.profileImg),fit: BoxFit.cover),
                boxShadow: [
                  BoxShadow(
                    color: neon.glowColor.withValues(alpha: .7),
                    blurRadius: 32,
                    spreadRadius: 4,
                  )
                ],
              ),

            ),
          ),
        ),
      ],
    );
  }

  // ======================================================================
  //                           MOBILE CARD
  // ======================================================================
  Widget _mobileCard(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Center(
          child: Container(
            height: 110,
            width: 110,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: AssetImage(AppImages.profileImg),fit: BoxFit.cover),
              gradient: theme.extension<NeonTheme>()!.gradient,
            ),
          ),
        ),

        const SizedBox(height: 16),

        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            color: theme.cardColor,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.10),
                blurRadius: 12,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            children: [
              Text(name, style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text(title, style: theme.textTheme.bodyMedium),
              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _socialIcon(Icons.facebook, context),
                  _socialIcon(Icons.link, context),
                  _socialIcon(Icons.code, context),
                  _socialIcon(Icons.person, context),
                ],
              ),

              const SizedBox(height: 22),
              _info(Icons.phone, AppStrings.phone, context),
              _info(Icons.email, AppStrings.email, context),
              _info(Icons.location_on, AppStrings.address, context),

              const SizedBox(height: 20),
              GradientButton(
                onTap: () {},
                icon: Icons.download,
                text: "Download Resume",
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ======================================================================
  //                          HELPERS
  // ======================================================================
  Widget _socialIcon(IconData icon, BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: CircleAvatar(
        radius: 20,
        backgroundColor: theme.cardColor.withValues(alpha: .5),
        child: Icon(icon, size: 18, color: theme.iconTheme.color),
      ),
    );
  }

  Widget _info(IconData icon, String text, BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(icon, color: Colors.pinkAccent),
          const SizedBox(width: 10),
          Expanded(child: Text(text, style: theme.textTheme.bodyMedium)),
        ],
      ),
    );
  }
}
