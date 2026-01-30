import 'package:erasica/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class PrimaryBoxWrapper extends StatelessWidget {
  const PrimaryBoxWrapper({
    super.key,
    this.borderRadius = 32,
    required this.child,
  });
  final double borderRadius;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: context.color.primary,
      ),
      padding: context.appWidget.data.pagePadding.copyWith(top: 18, bottom: 18),
      child: child,
    );
  }
}
