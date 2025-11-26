import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/app_images.dart';

class StoreButtons extends StatelessWidget {
  final String? playStoreUrl;
  final String? appStoreUrl;
  final bool? hideBorder;
  final double? size;

  const StoreButtons({
    super.key,
    this.playStoreUrl,
    this.appStoreUrl,
    this.hideBorder,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    // If both are null → don't show anything
    if (playStoreUrl == null && appStoreUrl == null) {
      return const SizedBox.shrink();
    }

    return Row(
      children: [
        if (playStoreUrl?.isNotEmpty == true)
          _storeButton(image: AppImages.googlePlay, url: playStoreUrl!),

        if (appStoreUrl?.isNotEmpty == true)
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: _storeButton(image: AppImages.appStore, url: appStoreUrl!),
          ),
      ],
    );

  }

  // ------------------------------------------------------
  // Single Store Button (GestureDetector + Image.asset)
  // ------------------------------------------------------
  Widget _storeButton({required String image, required String url}) {
    return GestureDetector(
      onTap: () => _launchURL(url),
      child: Container(
        padding:  EdgeInsets.all(hideBorder == true?4:8),
        decoration:
          BoxDecoration(
                borderRadius: BorderRadius.circular(hideBorder == true?6:12),
                border: Border.all(color: Colors.white24, width: 1.4),
                color: Colors.white.withValues(alpha: 0.06),
              ),
        child: Image.asset(image, height: size ?? 42, fit: BoxFit.contain),
      ),
    );
  }

  // ------------------------------------------------------
  // Platform-Aware URL Launcher
  // ------------------------------------------------------
  Future<void> _launchURL(String link) async {
    final uri = Uri.parse(link);

    if (kIsWeb) {
      await launchUrl(uri, webOnlyWindowName: "_blank");
      return;
    }

    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}
