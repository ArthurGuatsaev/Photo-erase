import 'package:easy_localization/easy_localization.dart';
import 'package:erasica/core/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'tunnel_timeline_step.dart';

class DayStepper extends StatelessWidget {
  const DayStepper({super.key, required this.price});

  final String price;

  @override
  Widget build(BuildContext context) {
    final primary = context.color.paywallPrimary;
    return LayoutBuilder(
      builder: (context, c) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: c.maxHeight),
            child: Center(
              child: Column(
                spacing: 4,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TunnelTimelineStep(
                    spacing: 4,
                    title: 'time_line_day_1_title'.tr(),
                    text: 'time_line_day_1_text'.tr(),
                    icon: CupertinoIcons.lock_open_fill,
                    isLast: false,
                    bottomTextGap: 12.h,
                    minHeight: 120.h,
                    lineGradientColors: [
                      Color.fromRGBO(30, 71, 197, 1),
                      Color.fromRGBO(30, 71, 197, 1).withValues(alpha: 0.8),
                      Colors.white.withValues(alpha: 0.1),
                    ],
                    iconGradientColors: const [Colors.white, Colors.white],
                  ),
                  TunnelTimelineStep(
                    spacing: 4,
                    title: 'time_line_day_5_title'.tr(),
                    text: 'time_line_day_5_text'.tr(),
                    icon: CupertinoIcons.bell_solid,
                    isLast: false,
                    bottomTextGap: 12.h,
                    minHeight: 90.h,
                    lineGradientColors: const [
                      Color.fromRGBO(255, 255, 255, 0.2),
                      Color.fromRGBO(255, 255, 255, 0.2),
                    ],
                    iconGradientColors: [primary, primary],
                  ),
                  TunnelTimelineStep(
                    spacing: 4,
                    title: 'time_line_day_7_title'.tr(),
                    text: 'time_line_day_7_text'.tr(),
                    icon: CupertinoIcons.star_fill,
                    isLast: true,
                    bottomTextGap: 12.h,
                    minHeight: 90.h,
                    lineGradientColors: const [
                      Color.fromRGBO(255, 255, 255, 0.2),
                      Color.fromRGBO(255, 255, 255, 0),
                    ],
                    iconGradientColors: [primary, primary],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
