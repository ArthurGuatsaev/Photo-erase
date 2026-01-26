import 'package:erasica/features/widgets/wrapper/grass.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListHorizontalWrapper extends StatelessWidget {
  const ListHorizontalWrapper({
    super.key,
    this.aspectValue,
    required this.child,
  });
  final double? aspectValue;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    if (aspectValue == null) {
      return child;
    }
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: AspectRatio(
          aspectRatio: aspectValue!,
          child: GlassWrapper(
            borderRadius: 20,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.5.w, vertical: 10.h),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
