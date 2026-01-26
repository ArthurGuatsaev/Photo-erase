import 'package:erasica/features/widgets/text/text_row.dart';
import 'package:erasica/features/widgets/wrapper/photo_box_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/theme/text/texts.dart';

class PaywallBenefitItem extends StatelessWidget {
  const PaywallBenefitItem({
    super.key,
    required this.imageAsset,
    required this.iconAsset,
    required this.title,
    required this.subtitle,
    this.padding,
  });

  final String imageAsset;
  final String iconAsset;
  final String title;
  final String subtitle;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8.h,
      children: [
        Expanded(
          child: Padding(
            padding: padding ?? EdgeInsets.zero,
            child: PhotoBoxWrapper(child: Image.asset(imageAsset)),
          ),
        ),
        Padding(
          padding: context.appWidget.data.pagePadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 12.w,
            children: [
              Flexible(
                child: Column(
                  spacing: 4.h,
                  children: [
                    TextRow(
                      text: title,
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontFamily: font(FontWeight.w700),
                        color: context.color.title,
                      ),
                    ),
                    TextRow(
                      text: subtitle,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontFamily: font(FontWeight.w400),
                        color: context.color.title.withValues(alpha: 0.8),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
