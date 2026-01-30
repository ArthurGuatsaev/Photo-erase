import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class OrbitaBox extends StatelessWidget {
  const OrbitaBox({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    final padding = 25.0;
    final gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Colors.white.withValues(alpha: 0.1),
        Colors.white.withValues(alpha: 0.015),
        Colors.white.withValues(alpha: 0),
      ],
    );
    final decoration = BoxDecoration(
      border: GradientBoxBorder(gradient: gradient, width: 1.5),
      shape: BoxShape.circle,
    );
    return Container(
      decoration: decoration,
      padding: EdgeInsets.all(padding),
      child: Container(
        decoration: decoration,
        padding: EdgeInsets.all(padding),
        child: child,
      ),
    );
  }
}
