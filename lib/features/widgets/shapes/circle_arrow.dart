import 'package:erasica/core/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircleArrowBox extends StatelessWidget {
  const CircleArrowBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24.w,
      height: 24.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: context.gradient.continueBtn,
      ),
      clipBehavior: Clip.antiAlias,
      child: Icon(CupertinoIcons.arrow_up_right, size: 18, color: Colors.white),
    );
  }
}
