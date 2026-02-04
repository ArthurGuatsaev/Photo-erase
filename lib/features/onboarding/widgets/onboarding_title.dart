import 'package:erasica/features/widgets/text/text_row.dart';
import 'package:flutter/material.dart';

import '../../../core/theme/app_theme.dart';
import '../model/onboarding_step.dart';

class OnboardingTitleBox extends StatelessWidget {
  const OnboardingTitleBox({super.key, required this.step});
  final OnboardingStep step;
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: 92),
      child: Column(
        spacing: 8,
        children: [
          TextRow(
            text: step.title,
            style: context.text.title.copyWith(color: context.color.title),
            lines: 2,
          ),

          TextRow(
            text: step.subtitle,
            style: context.text.subtitle.copyWith(
              color: context.color.subtitle,
            ),
          ),
        ],
      ),
    );
  }
}
