import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/theme/app_theme.dart';
import '../../../../../core/theme/text/texts.dart';
import '../../../../widgets/buttons/switch.dart';
import '../../../../widgets/text/color_text_generator.dart';

class SwitchRow extends StatelessWidget {
  const SwitchRow({super.key, required this.value, required this.onChanged});

  final bool value;
  final Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      fontSize: 15,
      fontFamily: font(FontWeight.w500),
      color: context.color.subtitle,
    );
    return Row(
      spacing: 6,
      children: [
        Expanded(
          child: TextColorGenerator(
            align: TextAlign.left,
            source: 'paywall_switch_title'.tr(),
            style: style,
            colorStyle: style.copyWith(color: context.color.paywallPrimary),
          ),
        ),
        CustomSwitch(value: value, onChanged: onChanged),
      ],
    );
  }
}
