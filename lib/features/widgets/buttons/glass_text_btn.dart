import 'package:erasica/core/theme/app_theme.dart';
import 'package:erasica/core/theme/text/texts.dart';
import 'package:erasica/features/widgets/text/text_row.dart';
import 'package:erasica/features/widgets/wrapper/grass.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlassTextBtn extends StatelessWidget {
  const GlassTextBtn({super.key, required this.onTap, required this.title});
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(30);
    return GlassWrapper(
      bcgOpacity: 0.1,
      borderRadius: 30,
      child: SizedBox(
        height: 40.h,
        child: Material(
          color: Colors.transparent,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(borderRadius: borderRadius),
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 9.h),
            ),
            onPressed: onTap,
            child: TextRow(
              style: context.text.btnTitle.copyWith(
                color: context.color.title,
                fontFamily: font(FontWeight.w400),
              ),
              text: title,
            ),
          ),
        ),
      ),
    );
  }
}
