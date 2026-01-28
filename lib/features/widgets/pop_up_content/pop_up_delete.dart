import 'package:easy_localization/easy_localization.dart';
import 'package:erasica/core/const/assets_path.dart';
import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';
import '../../../main.dart';
import '../buttons/main_button.dart';
import '../text/text_row.dart';
import '../wrapper/grass.dart';
import '../wrapper/pop_up.dart';

class PopupDelete extends StatelessWidget {
  const PopupDelete({
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
    return PopUpWrapper(
      children: [
        Image.asset(AssetsPath.error),
        TextRow(
          text: title.tr(),
          style: context.text.popupTitle.copyWith(
            color: context.color.textBase,
          ),
        ),
        TextRow(
          text: subtitle.tr(),
          style: context.text.popupSubtitle.copyWith(
            color: context.color.subtitleDark,
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
    );
  }

  static showDeletePhoto(BuildContext context, VoidCallback tap) => showDialog(
    context: context,
    builder: (context) => PopupDelete(
      title: 'deleting_popup_title',
      subtitle: 'deleting_popup_subtitle',
      onPressed: tap,
    ),
  );
}
