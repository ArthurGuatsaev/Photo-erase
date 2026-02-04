import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/text/texts.dart';
import '../../../widgets/text/text_row.dart';
import '../../../widgets/wrapper/photo_box.dart';

class PaywallBenefitItem extends StatelessWidget {
  const PaywallBenefitItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.child,
  });

  final String title;
  final String subtitle;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      children: [
        Expanded(child: child),
        Padding(
          padding: context.appWidget.data.pagePadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 12,
            children: [
              Flexible(
                child: Column(
                  spacing: 4,
                  children: [
                    TextRow(
                      text: title,
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: font(FontWeight.w700),
                        color: context.color.title,
                      ),
                    ),
                    TextRow(
                      text: subtitle,
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: font(FontWeight.w400),
                        color: context.color.title.withValues(alpha: 0.8),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CaruselPhotoSize extends StatelessWidget {
  const CaruselPhotoSize({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(19),
      child: AspectRatio(
        aspectRatio: 293 / 206,
        child: PhotoBoxWrapper(child: child),
      ),
    );
  }
}
