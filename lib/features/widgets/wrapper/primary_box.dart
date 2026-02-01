import 'package:erasica/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class PrimaryBoxWrapper extends StatelessWidget {
  const PrimaryBoxWrapper({
    super.key,
    this.borderRadius = 32,
    required this.child,
    required this.padding,
  });
  final double borderRadius;
  final Widget child;
  final EdgeInsets padding;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: context.color.box,
      ),
      padding: padding,
      child: child,
    );
  }
}
