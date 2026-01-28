import 'package:flutter/material.dart';
import 'package:theme_code_gen_annotations/theme_code_gen_annotations.dart';

part 'gradients.g.dart';

@gradientAnnotation
class AppGradients {
  static const Gradient continueBtnLight = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color.fromRGBO(137, 57, 248, 1),
      Color.fromRGBO(30, 71, 197, 1),
      Color.fromRGBO(20, 72, 192, 1),
    ],
    stops: [0, 0.4, 1],
    transform: GradientRotation(0.6),
  );

  static const Gradient continueBtnDark = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF1E47C5), Color(0xFF8939F8), Color(0xFF1448C0)],
  );

  static const Gradient backgroundLight = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color.fromRGBO(255, 255, 255, 0.05),
      Color.fromRGBO(255, 255, 255, 0.05),
      Color.fromRGBO(255, 255, 255, 0.05),
    ],
  );

  static const Gradient backgroundDark = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color.fromRGBO(113, 113, 224, 1),
      Color.fromRGBO(46, 106, 203, 1),
      Color.fromRGBO(33, 67, 159, 1),
    ],
  );

  static const Gradient thicknessLight = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color.fromRGBO(137, 57, 248, 1), Color.fromRGBO(20, 72, 192, 1)],
  );

  static const Gradient thicknessDark = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF1E47C5), Color(0xFF8939F8), Color(0xFF1448C0)],
  );
}
