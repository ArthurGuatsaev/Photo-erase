import 'package:flutter/material.dart';

import '../../../core/theme/app_theme.dart';
import '../../../core/theme/text/texts.dart';
import '../wrapper/glass.dart';

class CustomToast extends StatelessWidget {
  final Widget content;
  final VoidCallback? onTap;
  final Widget? icon;
  final IconData? iconData;

  const CustomToast({
    super.key,
    required this.content,
    this.onTap,
    this.icon,
    this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return GlassWrapper(
      borderRadius: 16,
      data: context.glass.darkBox.copyWith(fake: true),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 55,
          padding: context.appWidget.data.pagePadding,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 8,
            children: [
              if (icon != null) ...[
                icon!,
              ] else if (iconData != null) ...[
                Icon(iconData, size: 24),
              ],
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: DefaultTextStyle.merge(
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: font(FontWeight.w600),
                      height: 1.50,
                      color: context.color.title,
                    ),
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    child: content,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
