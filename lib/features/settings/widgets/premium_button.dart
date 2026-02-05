import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/const/assets_path.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/theme/text/texts.dart';
import '../../widgets/shapes/circle_arrow.dart';
import '../../widgets/text/text_row.dart';
import '../settings_cubit.dart';

class PremiumButton extends StatelessWidget {
  const PremiumButton({super.key});

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(24);
    return SliverPadding(
      padding: const EdgeInsets.only(bottom: 10, top: 10),
      sliver: SliverToBoxAdapter(
        child: InkWell(
          borderRadius: borderRadius,
          onTap: context.read<SettingsCubit>().pressBunner,
          child: Ink(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: Image.asset(AssetsPath.settingsBtnBg).image,
                fit: BoxFit.cover,
              ),
              gradient: context.gradient.mainBtn,
              borderRadius: borderRadius,
            ),
            padding: const EdgeInsets.only(
              left: 18,
              right: 10,
              top: 10,
              bottom: 18,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 6,
              children: [
                Row(
                  spacing: 8,
                  children: [
                    Image.asset(AssetsPath.iconCrown, width: 24),
                    Expanded(
                      child: TextRow(
                        align: TextAlign.start,
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: font(FontWeight.w700),
                          height: 1.20,
                          color: context.color.textBase,
                        ),
                        text: 'settings_premium_title',
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(8),
                      child: const CircleArrowBox(),
                    ),
                  ],
                ),
                TextRow(
                  text: 'settings_premium_subtitle',
                  lines: 5,
                  align: TextAlign.start,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: font(FontWeight.w400),
                    height: 1.40,
                  ).copyWith(color: context.color.subtitle),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
