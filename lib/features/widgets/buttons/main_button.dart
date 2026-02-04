import 'package:erasica/core/theme/app_theme.dart';
import 'package:erasica/features/widgets/text/text_row.dart';
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    this.onTap,
    required this.title,
    this.icon,
    this.color,
    this.textColor,
  });
  final VoidCallback? onTap;
  final String title;
  final IconData? icon;
  final Color? color;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    final data = context.appWidget.data;
    final borderRadius = BorderRadius.circular(60);
    return Opacity(
      opacity: onTap == null ? 0.5 : 1,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: borderRadius,
          onTap: onTap,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: 56,
              maxWidth: data.buttonMaxWidth,
            ),
            child: Ink(
              decoration: BoxDecoration(
                borderRadius: borderRadius,
                gradient: color != null ? null : context.gradient.mainBtn,
                color: color,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                spacing: 8,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null)
                    Icon(
                      icon!,
                      size: 19,
                      color: textColor ?? context.color.title,
                    ),
                  TextRow(
                    style: context.text.boxTitle.copyWith(
                      color: textColor ?? context.color.textBase,
                    ),
                    text: title,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
