import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class AnimatedFooter extends StatefulWidget {
  const AnimatedFooter({super.key});

  @override
  State<AnimatedFooter> createState() => _AnimatedFooterState();
}

class _AnimatedFooterState extends State<AnimatedFooter>
    with SingleTickerProviderStateMixin {

  final List<String> items = [
    "Love ❤️",
    "Passion 🔥",
    "Strength 💪",
    "Creativity 🎨",
    "Coffee ☕",
    "Flutter 💙",
  ];

  int index = 0;

  late AnimationController controller;
  late Animation<double> opacityAnim;
  late Animation<Offset> slideAnim;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    opacityAnim = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeOut),
    );

    slideAnim = Tween<Offset>(
      begin: const Offset(0, 0.4),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeOut),
    );

    _animateLoop();
  }

  void _animateLoop() async {
    while (mounted) {
      controller.forward(); // fade + slide in

      await Future.delayed(const Duration(seconds: 2));

      await controller.reverse(); // fade + slide out

      setState(() {
        index = (index + 1) % items.length;
      });
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Made with ",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),

          ClipRect(
            child: SizedBox(
              height: 20,
              child: FadeTransition(
                opacity: opacityAnim,
                child: SlideTransition(
                  position: slideAnim,
                  child: Text(
                    items[index].padLeft(5),
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
