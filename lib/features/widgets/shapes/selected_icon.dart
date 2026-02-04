import 'package:erasica/core/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';

import 'shadow_box.dart';

class SelectedIcon extends StatelessWidget {
  const SelectedIcon({super.key, this.needShadow});
  final bool? needShadow;
  @override
  Widget build(BuildContext context) {
    return ShadowBox(
      needShadow: needShadow,
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: context.gradient.mainBtn,
          ),
          child: Icon(
            CupertinoIcons.check_mark,
            color: context.color.title,
            size: 18,
          ),
        ),
      ),
    );
  }
}
