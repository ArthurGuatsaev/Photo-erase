import 'package:erasica/core/theme/app_theme.dart';
import 'package:erasica/features/widgets/text/text_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    this.onTap,
    required this.title,
    this.icon,
    this.color,
  });
  final VoidCallback? onTap;
  final String title;
  final IconData? icon;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(60.r);
    return Opacity(
      opacity: onTap == null ? 0.5 : 1,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: borderRadius,
          onTap: onTap,
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: 56.h),
            child: Ink(
              decoration: BoxDecoration(
                borderRadius: borderRadius,
                gradient: color != null ? null : context.gradient.continueBtn,
                color: color,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                spacing: 12,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null) Icon(icon!, size: 24.h),
                  TextRow(
                    style: context.text.galleryBoxTitle.copyWith(
                      color: context.color.textBase,
                    ),
                    text: title,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
