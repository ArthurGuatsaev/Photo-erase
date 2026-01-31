import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PhotoBoxWrapper extends StatelessWidget {
  const PhotoBoxWrapper({
    super.key,
    required this.child,
    this.borderRadius,
    this.padding,
  });
  final Widget child;
  final BorderRadius? borderRadius;
  final EdgeInsets? padding;
  @override
  Widget build(BuildContext context) {
    final borderR = 20.r;
    final _borderRadius = borderRadius ?? BorderRadius.circular(borderR);
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 0.1),
        borderRadius: _borderRadius,
      ),
      padding: padding ?? const EdgeInsets.all(6),
      child: ClipRRect(borderRadius: _borderRadius, child: child),
    );
  }
}
