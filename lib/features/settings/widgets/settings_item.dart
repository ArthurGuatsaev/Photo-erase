import 'package:erasica/core/const/assets_path.dart';
import 'package:erasica/core/theme/app_theme.dart';
import 'package:erasica/features/widgets/text/text_row.dart';
import 'package:erasica/features/widgets/wrapper/glass.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/widget_styles/custom_button_style.dart';
import 'divider.dart';

class SettingsItem extends StatelessWidget {
  const SettingsItem({super.key, required this.contents});
  final List<CustomBtnIconStyle> contents;
  @override
  Widget build(BuildContext context) {
    const borderRadiusValue = 26.0;
    return SliverPadding(
      padding: const EdgeInsets.only(bottom: 20),
      sliver: SliverToBoxAdapter(
        child: GlassWrapper(
          data: context.glass.box,
          borderRadius: borderRadiusValue,
          child: Material(
            color: Colors.transparent,
            child: ListView.separated(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: contents.length,
              separatorBuilder: (context, index) => AppDivider(),
              itemBuilder: (context, index) {
                final content = contents[index];
                return InkWell(
                  borderRadius: BorderRadius.circular(borderRadiusValue),
                  onTap: content.onTap,
                  child: Ink(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 15.h,
                    ),
                    decoration: BoxDecoration(
                      // gradient: context.gradient.box.withOpacity(0.05),
                      color: Colors.white.withValues(alpha: 0.02),
                    ),
                    child: Row(
                      spacing: 8.w,
                      children: [
                        Icon(content.icon, color: context.color.primary),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextRow(
                                align: TextAlign.start,
                                style: context.text.settingsItemsTitle.copyWith(
                                  color: context.color.textBase,
                                ),
                                text: content.title,
                              ),
                              if (content.subtitle.isNotEmpty)
                                TextRow(
                                  lines: 3,
                                  align: TextAlign.start,
                                  style: context.text.settingsItemsSubtitle
                                      .copyWith(
                                        color: context.color.settBtnSubtitle,
                                      ),
                                  text: content.subtitle,
                                ),
                            ],
                          ),
                        ),
                        Image.asset(
                          AssetsPath.iconNext,
                          width: 24.w,
                          height: 24.h,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
