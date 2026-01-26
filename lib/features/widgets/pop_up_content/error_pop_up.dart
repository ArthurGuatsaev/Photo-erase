import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:erasica/core/const/assets_path.dart';
import 'package:erasica/core/theme/app_theme.dart';
import 'package:erasica/features/widgets/text/text_row.dart';
import 'package:erasica/features/widgets/wrapper/grass.dart';
import 'package:flutter/material.dart';

import '../../../main.dart';
import '../buttons/main_button.dart';

class ErrorPopup extends StatelessWidget {
  const ErrorPopup({
    super.key,
    this.onPressed,
    required this.subtitle,
    required this.title,
  });
  final String title;
  final String subtitle;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: appRouter.pop,
      child: Stack(
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(color: Colors.black.withValues(alpha: 0.15)),
          ),
          Material(
            color: Colors.transparent,
            child: Center(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: context.color.errorPopupBg,
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 21,
                  horizontal: 16,
                ),
                child: Column(
                  spacing: 20,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(AssetsPath.error),
                    TextRow(
                      text: title.tr(),
                      style: context.text.allowingBtnSubtitle.copyWith(
                        color: context.color.textBase,
                      ),
                    ),
                    TextRow(
                      text: subtitle.tr(),
                      style: context.text.allowingBtnSubtitle.copyWith(
                        color: context.color.textBase.withValues(alpha: 0.4),
                      ),
                    ),
                    if (onPressed != null)
                      MainButton(onTap: onPressed, title: 'open_settings'),
                    GlassWrapper(
                      borderRadius: 60,
                      child: MainButton(
                        onTap: appRouter.maybePop,
                        title: 'pop_up_done',
                        color: Colors.transparent,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Future<void> show({required BuildContext context}) async {
    await showDialog(
      context: context,
      builder: (context) => ErrorPopup(title: '', subtitle: ''),
    );
  }
}
