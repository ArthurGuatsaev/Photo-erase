import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'shadow_box.dart';

class UnselectedIcon extends StatelessWidget {
  const UnselectedIcon({super.key, this.needShadow = false, this.color});
  final bool? needShadow;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return ShadowBox(
      needShadow: needShadow,
      child: Center(
        child: Icon(CupertinoIcons.circle, color: color ?? Colors.white),
      ),
    );
  }
}
