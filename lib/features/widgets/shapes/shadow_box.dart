import 'package:erasica/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ShadowBox extends StatelessWidget {
  const ShadowBox({super.key, this.needShadow, required this.child});
  final bool? needShadow;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: needShadow == true
            ? context.color.background.withValues(alpha: 0.5)
            : null,
      ),
      child: child,
    );
  }
}
