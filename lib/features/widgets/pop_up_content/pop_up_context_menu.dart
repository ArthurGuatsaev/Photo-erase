import 'package:erasica/core/theme/app_theme.dart';
import 'package:erasica/features/settings/widgets/divider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/text/texts.dart';
import '../text/text_row.dart';

class ContextMenuBox extends StatelessWidget {
  final List<IOSContextMenuAction> actions;
  final ValueChanged<IOSContextMenuAction> onActionTap;

  const ContextMenuBox({
    super.key,
    required this.actions,
    required this.onActionTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.color.box.withValues(alpha: 0.5),
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 5),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: actions.length,
        itemBuilder: (context, index) {
          final item = actions[index];
          return Column(
            mainAxisSize: MainAxisSize.min,

            children: [
              if (item.withDivider)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: AppDivider(),
                ),
              CupertinoButton(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                onPressed: () => onActionTap(item),
                child: item,
              ),
            ],
          );
        },
      ),
    );
  }
}

class IOSContextMenuAction extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPressed;
  final bool withDivider;
  final Color textColor;
  const IOSContextMenuAction({
    super.key,
    required this.title,
    required this.icon,
    required this.onPressed,
    this.withDivider = false,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        Icon(icon, color: textColor),
        Flexible(
          child: TextRow(
            text: title,
            style: TextStyle(
              fontSize: 17.sp,
              fontFamily: font(FontWeight.w400),
              color: textColor,
            ),
          ),
        ),
      ],
    );
  }
}
