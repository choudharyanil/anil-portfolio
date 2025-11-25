import 'package:flutter/material.dart';


class SkillBar extends StatelessWidget {
  final String label;
  final double percent; // 0.0 - 1.0
  const SkillBar({super.key, required this.label, required this.percent});


  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(label, style: Theme.of(context).textTheme.bodySmall),
      const SizedBox(height: 6),
      ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: LinearProgressIndicator(value: percent, minHeight: 8),
      )
    ]);
  }
}