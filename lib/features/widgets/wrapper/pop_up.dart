import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/app_theme.dart';
import '../../../main.dart';

class PopUpWrapper extends StatelessWidget {
  const PopUpWrapper({super.key, required this.children});
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: appRouter.pop,
      child: Stack(
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(color: Colors.black.withValues(alpha: 0.15)),
          ),
          Material(
            color: Colors.transparent,
            child: Center(
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    color: context.color.errorPopupBg,
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 21,
                    horizontal: 16,
                  ),
                  child: Column(
                    spacing: 20.h,
                    mainAxisSize: MainAxisSize.min,
                    children: children,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
