import 'package:flutter/material.dart';

class NeonTheme extends ThemeExtension<NeonTheme> {
  final Gradient gradient;
  final Color glowColor;

  const NeonTheme({
    required this.gradient,
    required this.glowColor,
  });

  @override
  NeonTheme copyWith({
    Gradient? gradient,
    Color? glowColor,
  }) {
    return NeonTheme(
      gradient: gradient ?? this.gradient,
      glowColor: glowColor ?? this.glowColor,
    );
  }

  @override
  NeonTheme lerp(ThemeExtension<NeonTheme>? other, double t) {
    if (other is! NeonTheme) return this;
    return NeonTheme(
      gradient: Gradient.lerp(gradient, other.gradient, t)!,
      glowColor: Color.lerp(glowColor, other.glowColor, t)!,
    );
  }
}
