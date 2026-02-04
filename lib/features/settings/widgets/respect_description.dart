import 'package:easy_localization/easy_localization.dart';
import 'package:erasica/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

import '../../../core/theme/text/texts.dart';
import '../../widgets/text/color_text_generator.dart';

class RespectDescription extends StatelessWidget {
  const RespectDescription({super.key});

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      fontSize: 13,
      fontFamily: font(FontWeight.w700),
      height: 1.50,
      color: Colors.white,
    );
    return SliverToBoxAdapter(
      child: TextColorGenerator(
        align: TextAlign.start,
        colorStyle: style,
        style: style.copyWith(
          color: context.color.textBase.withValues(alpha: 0.5),
          fontFamily: font(FontWeight.w500),
        ),
        source: 'settings_respect'.tr(),
      ),
    );
  }
}
