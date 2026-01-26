import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSwitch extends StatelessWidget {
  const CustomSwitch({super.key, required this.value, required this.onChanged});

  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 64.w,
      height: 28.h,
      child: Stack(
        children: [
          Container(
            width: 64.w,
            height: 28.h,
            padding: EdgeInsets.all(2.r),
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: value ? const Color(0xFF34C759) : const Color(0x4C3C3C43),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100.r),
              ),
            ),
            alignment: Alignment.centerLeft,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  right: 5.5.w,
                  child: Container(
                    width: 10.w,
                    height: 10.h,
                    decoration: ShapeDecoration(
                      shape: OvalBorder(
                        side: BorderSide(
                          width: 1.w,
                          color: const Color(0xFFB3B3B3),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 10.w,
                  child: Container(
                    width: 1.w,
                    height: 10.h,
                    decoration: const BoxDecoration(color: Colors.white),
                  ),
                ),
                Align(
                  alignment: value
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    width: 39.w,
                    height: 24.h,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.r),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Opacity(
            opacity: 0,
            child: CupertinoSwitch(value: value, onChanged: onChanged),
          ),
        ],
      ),
    );
  }
}
