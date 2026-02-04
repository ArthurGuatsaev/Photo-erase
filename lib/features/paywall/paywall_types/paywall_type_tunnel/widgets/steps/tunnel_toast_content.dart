import 'package:easy_localization/easy_localization.dart';
import 'package:erasica/core/theme/app_theme.dart';
import 'package:erasica/features/widgets/text/color_text_generator.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/theme/text/texts.dart';

class TunnelToastContent extends StatelessWidget {
  const TunnelToastContent({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      fontSize: 15,
      fontFamily: font(FontWeight.w600),
      height: 1.50,
    );
    return TextColorGenerator(
      source: text.tr(),
      style: style,
      colorStyle: style.copyWith(color: context.color.paywallPrimary),
    );
  }
}
