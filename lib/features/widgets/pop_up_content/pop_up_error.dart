import 'package:easy_localization/easy_localization.dart';
import 'package:erasica/core/const/assets_path.dart';
import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';
import '../../../main.dart';
import '../buttons/main_button.dart';
import '../text/text_row.dart';
import '../wrapper/glass.dart';
import '../wrapper/pop_up.dart';

class PopupError extends StatelessWidget {
  const PopupError({
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
    final glass = context.glass.mainButton;
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
          lines: 4,
          style: context.text.popupSubtitle.copyWith(
            color: context.color.subtitleDark,
          ),
        ),
        if (onPressed != null)
          MainButton(onTap: onPressed, title: 'open_settings'),
        GlassWrapper(
          data: glass,
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

  static PopupError showNetworkError() {
    return const PopupError(
      subtitle: 'error_network_subtitle',
      title: 'error_title',
    );
  }

  static PopupError showMomentError() {
    return const PopupError(subtitle: 'error_subtitle', title: 'error_title');
  }

  static PopupError showSubscriptionError() {
    return const PopupError(subtitle: 'error_no_restore', title: 'error_title');
  }

  static PopupError showPermissionError(Function()? sendToSettings) {
    return PopupError(
      subtitle: 'no_permission_gallery_subtitle',
      title: 'no_permission_title',
      onPressed: sendToSettings,
    );
  }
}
