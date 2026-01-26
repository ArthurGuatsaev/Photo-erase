import 'package:easy_localization/easy_localization.dart';
import 'package:erasica/core/const/assets_path.dart';
import 'package:erasica/core/theme/app_theme.dart';
import 'package:erasica/features/widgets/text/text_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppNameBox extends StatelessWidget {
  const AppNameBox({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: context.appWidget.data.pagePadding.copyWith(
          top: 30.h,
          bottom: 27.h,
        ),
        child: Column(
          spacing: 4.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              spacing: 10.w,
              children: [
                Image.asset(AssetsPath.logo, width: 24.w, height: 24.h),
                TextRow(
                  style: context.text.logoAppName.copyWith(
                    color: context.color.appName,
                  ),
                  text: 'appName'.tr(),
                ),
              ],
            ),
            TextRow(
              style: context.text.logoAppSlogan.copyWith(
                color: context.color.appSlogan,
              ),
              text: 'appSlogan'.tr(),
            ),
          ],
        ),
      ),
    );
  }
}
