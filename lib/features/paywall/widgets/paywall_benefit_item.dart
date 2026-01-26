import 'package:erasica/features/widgets/text/text_row.dart';
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
  });

  final String imageAsset;
  final String iconAsset;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8.h,
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 35.w).copyWith(top: 23.h),
            decoration: BoxDecoration(
              border: Border.all(
                color: Color.fromRGBO(255, 255, 255, 0.1),
                width: 6,
              ),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Image.asset(imageAsset),
          ),
        ),
        Padding(
          padding: context.pagePadding.data.pagePadding,
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
