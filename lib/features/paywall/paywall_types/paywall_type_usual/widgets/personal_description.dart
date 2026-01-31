import 'package:erasica/core/theme/app_theme.dart';
import 'package:erasica/features/paywall/cubits/paywall/paywall_cubit.dart';
import 'package:erasica/features/widgets/text/text_row.dart';
import 'package:flutter/material.dart';

class PersonalDescription extends StatelessWidget {
  const PersonalDescription({super.key, required this.state});
  final PaywallUsual state;
  @override
  Widget build(BuildContext context) {
    if (state is PaywallPersonalTotalState ||
        state is PaywallPersonalSwitchState) {
      return TextRow(
        style: context.text.subtitle,
        text: 'paywall_personal_subtitle',
      );
    }
    return const SizedBox();
  }
}
