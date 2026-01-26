import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/const/assets_path.dart';

class CircleArrowBox extends StatelessWidget {
  const CircleArrowBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24.w,
      height: 24.h,
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
      clipBehavior: Clip.antiAlias,
      padding: const EdgeInsets.all(8),
      child: Image.asset(AssetsPath.removingBtnArrow, color: Colors.white),
    );
  }
}
