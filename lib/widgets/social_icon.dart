import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/app_colors.dart';

class SocialIcon extends StatelessWidget {
  final IconData icon;
  final String url;
  final double radius;
  final double size;
  final EdgeInsets padding;

  const SocialIcon({
    super.key,
    required this.icon,
    required this.url,
    this.radius = 18,
    this.size = 18,
    this.padding = const EdgeInsets.symmetric(horizontal: 6),
  });

  Future<void> _launchURL() async {
    final uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      debugPrint("❌ Could not launch $url");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: InkWell(
        borderRadius: BorderRadius.circular(radius),
        onTap: _launchURL,
        child: ShaderMask(
          shaderCallback: (bounds) =>
              AppColors.buttonGradient.createShader(bounds),
          child: CircleAvatar(
            radius: radius,
            backgroundColor: Colors.white.withValues(alpha: .10),
            child: Icon(icon, size: size, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
