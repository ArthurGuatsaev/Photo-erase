import 'package:easy_localization/easy_localization.dart';
import 'package:erasica/core/const/assets_path.dart';
import 'package:erasica/core/theme/app_theme.dart';
import 'package:erasica/features/widgets/text/text_row.dart';
import 'package:flutter/material.dart';

import '../../../core/theme/text/texts.dart';

class AppNameBox extends StatelessWidget {
  const AppNameBox({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: context.appWidget.data.pagePadding.copyWith(
          top: 30,
          bottom: 27,
        ),
        child: Column(
          spacing: 4,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              spacing: 10,
              children: [
                Image.asset(AssetsPath.logo, width: 24, height: 24),
                TextRow(
                  style: TextStyle(
                    fontSize: 28,
                    fontFamily: font(FontWeight.w800),
                    height: 1.20,
                    color: context.color.title,
                  ),
                  text: 'appName'.tr(),
                ),
              ],
            ),
            TextRow(
              lines: 2,
              align: TextAlign.left,
              style: TextStyle(
                fontSize: 14,
                fontFamily: font(FontWeight.w400),
                height: 1.30,
                color: context.color.textBase,
              ),
              text: 'appSlogan'.tr(),
            ),
          ],
        ),
      ),
    );
  }
}
