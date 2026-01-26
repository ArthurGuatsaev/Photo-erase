import 'package:erasica/core/const/assets_path.dart';
import 'package:erasica/core/theme/app_theme.dart';
import 'package:erasica/features/widgets/text/text_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/shapes/circle_arrow.dart';

class PremiumButton extends StatelessWidget {
  const PremiumButton({super.key});

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(24);
    return SliverPadding(
      padding: EdgeInsets.only(bottom: 20.h, top: 10.h),
      sliver: SliverToBoxAdapter(
        child: InkWell(
          borderRadius: borderRadius,
          onTap: () {}, //TODO
          child: Ink(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: Image.asset(AssetsPath.settingsBtnBg).image,
                fit: BoxFit.cover,
              ),
              gradient: context.gradient.continueBtn,
              borderRadius: borderRadius,
            ),
            padding: EdgeInsets.only(
              left: 18.w,
              right: 10.w,
              top: 10.h,
              bottom: 18.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 6.h,
              children: [
                Row(
                  spacing: 8.w,
                  children: [
                    Image.asset(AssetsPath.iconCrown, width: 24.w),
                    Expanded(
                      child: TextRow(
                        align: TextAlign.start,
                        style: context.text.settingsBtnTitle.copyWith(
                          color: context.color.textBase,
                        ),
                        text: 'settings_premium_title',
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(8),
                      child: CircleArrowBox(),
                    ),
                  ],
                ),
                TextRow(
                  text: 'settings_premium_subtitle',
                  lines: 5,
                  align: TextAlign.start,
                  style: context.text.settingsBtnSubtitle.copyWith(
                    color: context.color.settBtnSubtitle,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
