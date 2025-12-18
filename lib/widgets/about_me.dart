import 'package:flutter/material.dart';
import 'package:portfolio_app/utils/app_colors.dart';
import 'package:portfolio_app/utils/sizes.dart';

class AboutMeAnimated extends StatefulWidget {
  const AboutMeAnimated({super.key});

  @override
  State<AboutMeAnimated> createState() => _AboutMeAnimatedState();
}

class _AboutMeAnimatedState extends State<AboutMeAnimated>
    with SingleTickerProviderStateMixin {
  // Title typing
  String titleVisible = "";
  bool showTitleCursor = true;

  // Description typing
  String descVisible = "";
  bool showDescCursor = false;

  late AnimationController cursorBlink;

  final String description =
      "I’m a passionate Flutter developer with more than 6+ years of experience "
      "crafting elegant and high-performance mobile applications.\n\n"
      "I love transforming ideas into seamless user experiences, solving complex "
      "problems through clean architecture, and delivering products with real impact. "
      "Always learning & pushing the boundaries of what's possible with Flutter.";

  @override
  void initState() {
    super.initState();

    cursorBlink = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 450),
    )..repeat(reverse: true);

    cursorBlink.addListener(() {
      setState(() {
        if (titleVisible.length < 8) {
          showTitleCursor = cursorBlink.value > 0.5;
        } else {
          showDescCursor = cursorBlink.value > 0.5;
        }
      });
    });

    _startTypingSequence();
  }

  Future<void> _startTypingSequence() async {
    const String title = "ABOUT ME";

    // Type TITLE
    for (int i = 0; i <= title.length; i++) {
      await Future.delayed(const Duration(milliseconds: 70));
      if (!mounted) return;

      setState(() => titleVisible = title.substring(0, i));
    }

    // Delay before typing description
    await Future.delayed(const Duration(milliseconds: 200));

    // Type DESCRIPTION
    for (int i = 0; i <= description.length; i++) {
      await Future.delayed(const Duration(milliseconds: 18));
      if (!mounted) return;

      setState(() => descVisible = description.substring(0, i));
    }
  }

  @override
  void dispose() {
    cursorBlink.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [


        const SizedBox(height: 20),

        // ---------------- DESCRIPTION TYPEWRITER ----------------
        Text(
          "$descVisible${showDescCursor ? "|" : ""}",
          style: const TextStyle(
            height: 1.6,
            wordSpacing: 3,
            fontSize: 15,
            color: Colors.white,
          ),
        ),

        const SizedBox(height: AppSizes.xl),
      ],
    );
  }
}
