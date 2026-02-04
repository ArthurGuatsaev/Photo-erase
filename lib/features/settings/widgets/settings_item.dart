import 'package:erasica/core/const/assets_path.dart';
import 'package:erasica/core/theme/app_theme.dart';
import 'package:erasica/features/widgets/shapes/glass_container.dart';
import 'package:erasica/features/widgets/text/text_row.dart';
import 'package:flutter/material.dart';

import '../../../core/theme/text/texts.dart';
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
        child: GlassContainer(
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
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
                    decoration: BoxDecoration(
                      gradient: context.gradient.box.withOpacity(0.03),
                      // color: Colors.white.withValues(alpha: 0.02),
                    ),
                    child: Row(
                      spacing: 8,
                      children: [
                        Icon(content.icon, color: context.color.primary),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextRow(
                                align: TextAlign.start,
                                style: context.text.subtitle.copyWith(
                                  color: context.color.textBase,
                                ),
                                text: content.title,
                              ),
                              if (content.subtitle.isNotEmpty)
                                TextRow(
                                  lines: 3,
                                  align: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: font(FontWeight.w400),
                                    height: 1.20,
                                  ).copyWith(color: context.color.subtitle),
                                  text: content.subtitle,
                                ),
                            ],
                          ),
                        ),
                        Image.asset(AssetsPath.iconNext, width: 24, height: 24),
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
