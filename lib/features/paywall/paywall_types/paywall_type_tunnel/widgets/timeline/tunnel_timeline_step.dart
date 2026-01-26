import 'package:erasica/core/theme/app_theme.dart';
import 'package:erasica/features/widgets/text/text_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/theme/text/texts.dart';

class TunnelTimelineStep extends StatelessWidget {
  const TunnelTimelineStep({
    super.key,
    required this.title,
    required this.text,
    required this.icon,
    required this.lineGradientColors,
    required this.iconGradientColors,
    required this.isLast,
    required this.bottomTextGap,
    required this.minHeight,
    required this.spacing,
  });

  final String title;
  final String text;
  final IconData icon;
  final List<Color> lineGradientColors;
  final List<Color> iconGradientColors;
  final bool isLast;
  final double bottomTextGap;
  final double minHeight;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    final dot = 46.w;
    final overlap = dot * 0;

    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: minHeight),
      child: IntrinsicHeight(
        child: Row(
          spacing: 16.w,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: dot,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: dot + spacing,
                    bottom: isLast ? 0 : -overlap,
                    left: 0,
                    right: 0,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: dot / 3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(
                            begin: const Alignment(0, -1.0),
                            end: const Alignment(0, 1.0),
                            colors: lineGradientColors,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: dot,
                      height: dot,
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: lineGradientColors.first,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: ShaderMask(
                        blendMode: BlendMode.srcIn,
                        shaderCallback: (Rect bounds) {
                          return LinearGradient(
                            colors: iconGradientColors,
                          ).createShader(bounds);
                        },
                        child: Icon(icon, color: Colors.white, size: 24.sp),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextRow(
                    text: title,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontFamily: font(FontWeight.w700),
                      color: context.color.title,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  TextRow(
                    text: text,
                    style: context.text.subtitle.copyWith(
                      color: context.color.subtitle,
                    ),
                    align: TextAlign.start,
                    lines: 4,
                  ),
                  SizedBox(height: bottomTextGap),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
