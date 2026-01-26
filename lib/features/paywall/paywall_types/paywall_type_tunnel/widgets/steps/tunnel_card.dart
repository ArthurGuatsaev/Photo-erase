import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TunnelCard extends StatelessWidget {
  const TunnelCard({super.key, required this.text, required this.icon});
  final Widget text;
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1.w, color: const Color(0x19191919)),
          borderRadius: BorderRadius.circular(20.r),
        ),
        shadows: [
          BoxShadow(
            color: const Color(0x07000000),
            blurRadius: 2.r,
            offset: const Offset(0, 1),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: const Color(0x07000000),
            blurRadius: 4.r,
            offset: const Offset(0, 4),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 10.w,
        children: [
          icon,
          Flexible(child: text),
        ],
      ),
    );
  }
}
