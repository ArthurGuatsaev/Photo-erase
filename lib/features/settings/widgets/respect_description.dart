import 'package:easy_localization/easy_localization.dart';
import 'package:erasica/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

import '../../widgets/text/color_text_generator.dart';

class RespectDescription extends StatelessWidget {
  const RespectDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: TextColorGenerator(
        align: TextAlign.start,
        colorStyle: context.text.settingsRespectBold.copyWith(
          color: context.color.textBase,
        ),
        style: context.text.settingsRespectEasy.copyWith(
          color: context.color.textBase.withValues(alpha: 0.5),
        ),
        source: 'settings_respect'.tr(),
      ),
    );
  }
}
