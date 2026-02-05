import 'package:flutter/material.dart';

import '../../../core/theme/app_theme.dart';
import 'glass.dart';

class ListHorizontalWrapper extends StatelessWidget {
  const ListHorizontalWrapper({
    super.key,
    this.aspectValue,
    required this.child,
    this.withoutGlass,
  });
  final double? aspectValue;
  final Widget child;
  final bool? withoutGlass;
  @override
  Widget build(BuildContext context) {
    if (aspectValue == null) {
      return child;
    }
    if (withoutGlass == true) {
      return SliverToBoxAdapter(
        child: AspectRatio(aspectRatio: aspectValue!, child: child),
      );
    }
    return SliverToBoxAdapter(
      child: Padding(
        padding: context.appWidget.data.pagePadding,
        child: AspectRatio(
          aspectRatio: aspectValue!,
          child: GlassWrapper(
            borderRadius: 20,
            data: context.glass.darkBox,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.5,
                vertical: 10,
              ),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
