import 'package:flutter/cupertino.dart';

import '../../../core/theme/text/texts.dart';
import '../../widgets/text/text_row.dart';

class NoPaymantBox extends StatelessWidget {
  const NoPaymantBox({
    super.key,
    required this.title,
    this.iconSize,
    this.subtitle,
    this.alignment,
  });
  final String title;
  final double? iconSize;
  final Widget? subtitle;
  final MainAxisAlignment? alignment;
  @override
  Widget build(BuildContext context) {
    final noPaymantColor = Color.fromRGBO(106, 213, 40, 1);

    return Row(
      mainAxisAlignment: alignment ?? MainAxisAlignment.center,
      spacing: 6,
      children: [
        Icon(
          CupertinoIcons.checkmark_shield_fill,
          color: noPaymantColor,
          size: iconSize ?? 22,
        ),
        Flexible(
          child: Column(
            spacing: 4,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: TextRow(
                  text: title,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: font(FontWeight.w600),
                    color: noPaymantColor,
                  ),
                ),
              ),
              if (subtitle != null) subtitle!,
            ],
          ),
        ),
      ],
    );
  }
}
