import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_app/utils/app_strings.dart';
import 'package:portfolio_app/utils/sizes.dart';
import 'package:url_launcher/url_launcher.dart';

class ConnectButton extends StatelessWidget {
  const ConnectButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        launchUrl(Uri.parse(AppStrings.whatsAppUrl));
      },
      borderRadius: BorderRadius.circular(AppSizes.sm),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal:  AppSizes.md,
          vertical:   AppSizes.sm,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSizes.md),
          gradient: LinearGradient(colors: [Colors.pink, Colors.blue.shade900]),
          boxShadow: [
            BoxShadow(
              color: Colors.blue,
              offset: Offset(0, -1),
              blurRadius: AppSizes.sm / 4,
            ),
            BoxShadow(
              color: Colors.red,
              offset: Offset(0, 1),
              blurRadius: AppSizes.sm / 4,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              FontAwesomeIcons.whatsapp,
              color: Colors.greenAccent,
              size: 15,
            ),
            const SizedBox(width: AppSizes.sm / 4),
            Text(
              'Whatsapp',
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                color: Colors.white,
                letterSpacing: 1.2,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
