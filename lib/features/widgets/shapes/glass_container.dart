import 'package:erasica/features/widgets/wrapper/grass.dart';
import 'package:flutter/material.dart';

class GlassContainer extends StatelessWidget {
  const GlassContainer({
    super.key,
    required this.borderRadius,
    required this.gradient,
    required this.child,
    required this.padding,
  });
  final double borderRadius;
  final Gradient gradient;
  final Widget child;
  final EdgeInsets padding;
  @override
  Widget build(BuildContext context) {
    return GlassWrapper(
      borderRadius: borderRadius,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: child,
      ),
    );
  }
}
