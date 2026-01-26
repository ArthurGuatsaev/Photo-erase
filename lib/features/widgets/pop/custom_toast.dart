import 'package:erasica/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/text/texts.dart';
import '../wrapper/grass.dart';

class CustomToast extends StatelessWidget {
  final Widget content;
  final VoidCallback? onTap;
  final Widget? icon;
  final IconData? iconData;

  const CustomToast({
    super.key,
    required this.content,
    this.onTap,
    this.icon,
    this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return GlassWrapper(
      borderRadius: 16.r,
      // Отключаем, тк проблема с рендерингом (появляется черная полоска за toast)
      // на версии: liquid_glass_renderer: ^0.2.0-dev.4
      // fake: true,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 55.h,
          padding: context.pagePadding.data.pagePadding,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 10.w,
            children: [
              if (icon != null) ...[
                icon!,
              ] else if (iconData != null) ...[
                Icon(iconData, color: Colors.green, size: 24.w),
              ],
              Expanded(
                child: DefaultTextStyle.merge(
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontFamily: font(FontWeight.w600),
                    height: 1.50,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  child: content,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
