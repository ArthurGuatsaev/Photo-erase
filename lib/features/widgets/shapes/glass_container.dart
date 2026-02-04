import 'package:erasica/features/widgets/wrapper/glass.dart';
import 'package:flutter/material.dart';

import '../../../core/theme/app_theme.dart';

class GlassContainer extends StatelessWidget {
  const GlassContainer({
    super.key,
    required this.borderRadius,
    this.gradient,
    required this.child,
    this.padding,
  });
  final double borderRadius;
  final Gradient? gradient;
  final Widget child;
  final EdgeInsets? padding;
  @override
  Widget build(BuildContext context) {
    return GlassWrapper(
      data: context.glass.box,
      borderRadius: borderRadius,
      child: Ink(
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        padding: padding,
        child: child,
      ),
    );
  }
}
