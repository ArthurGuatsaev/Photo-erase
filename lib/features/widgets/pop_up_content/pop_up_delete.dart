import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/theme/app_theme.dart';
import '../../../main.dart';
import '../buttons/main_button.dart';
import '../text/text_row.dart';
import '../wrapper/glass.dart';
import '../wrapper/pop_up.dart';

class PopupDelete extends StatelessWidget {
  const PopupDelete({
    super.key,
    required this.onPressed,
    required this.subtitle,
    required this.title,
  });
  final String title;
  final String subtitle;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return PopUpWrapper(
      bgColor: context.color.box,
      children: [
        TextRow(
          text: title.tr(),
          style: context.text.popupTitle.copyWith(
            color: context.color.textBase,
          ),
        ),
        TextRow(
          text: subtitle.tr(),
          lines: 3,
          style: context.text.popupSubtitle.copyWith(
            color: context.color.subtitleDark,
          ),
        ),

        Row(
          spacing: 16,
          children: [
            Expanded(
              child: GlassWrapper(
                data: context.glass.mainButton,
                borderRadius: 60,
                child: MainButton(
                  onTap: appRouter.maybePop,
                  title: 'cancel_btn',
                  color: Colors.transparent,
                ),
              ),
            ),
            Expanded(
              child: GlassWrapper(
                data: context.glass.mainButton,
                borderRadius: 60,
                child: MainButton(
                  icon: CupertinoIcons.delete,
                  onTap: onPressed,
                  textColor: const Color.fromRGBO(226, 17, 17, 1),
                  title: 'context_menu_delete',
                  color: const Color.fromRGBO(226, 17, 17, 0.12),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  static PopupDelete show(VoidCallback tap, int count) => PopupDelete(
    title: 'deleting_popup_title'.plural(count),
    subtitle: 'deleting_popup_subtitle',
    onPressed: tap,
  );
}
