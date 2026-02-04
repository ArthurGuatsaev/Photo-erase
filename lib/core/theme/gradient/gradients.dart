import 'package:flutter/material.dart';
import 'package:theme_code_gen_annotations/theme_code_gen_annotations.dart';

part 'gradients.g.dart';

@gradientAnnotation
class AppGradients {
  static const Gradient mainBtnLight = LinearGradient(
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

  static const Gradient mainBtnDark = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF1E47C5), Color(0xFF8939F8), Color(0xFF1448C0)],
  );

  static const Gradient opacityBgLight = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color.fromRGBO(4, 2, 15, 0),
      Color.fromRGBO(4, 2, 15, 0.2),
      Color.fromRGBO(4, 2, 15, 0.5),
      Color.fromRGBO(4, 2, 15, 0.8),
      Color.fromRGBO(4, 2, 15, 1),
      Color.fromRGBO(4, 2, 15, 1),
    ],
  );

  static const Gradient opacityBgDark = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color.fromRGBO(4, 2, 15, 0),
      Color.fromRGBO(4, 2, 15, 0.2),
      Color.fromRGBO(4, 2, 15, 0.5),
      Color.fromRGBO(4, 2, 15, 0.8),
      Color.fromRGBO(4, 2, 15, 1),
      Color.fromRGBO(4, 2, 15, 1),
    ],
  );

  static const Gradient boxLight = LinearGradient(
    begin: Alignment(0.00, 0.00),
    end: Alignment(1.00, 1.00),
    colors: [Color(0xFF2E6ACA), Color(0xFF21429E)],
  );

  static const Gradient boxDark = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF2E6ACA), Color(0xFF21429E)],
  );
}
