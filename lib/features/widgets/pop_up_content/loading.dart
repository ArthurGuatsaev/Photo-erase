import 'package:erasica/core/theme/app_theme.dart';
import 'package:erasica/features/widgets/text/text_row.dart';
import 'package:flutter/material.dart';

import '../wrapper/background.dart';

class LoadingSheet extends StatelessWidget {
  const LoadingSheet({super.key, required this.subtitle, required this.title});
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return BackgroundWrapper(
      isModalSheet: true,
      isDefault: true,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: SafeArea(
          top: false,
          child: Column(
            spacing: 10,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextRow(
                style: context.text.popupTitle.copyWith(
                  color: context.color.textBase,
                ),
                text: title,
              ),
              TextRow(
                style: context.text.allowingBtnSubtitle.copyWith(
                  color: context.color.textBase.withValues(alpha: 0.4),
                ),
                text: subtitle,
              ),
              const SizedBox(),
              AspectRatio(
                aspectRatio: 327 / 379,
                child: SizedBox(),
              ), // TODO: past animation
            ],
          ),
        ),
      ),
    );
  }
}
