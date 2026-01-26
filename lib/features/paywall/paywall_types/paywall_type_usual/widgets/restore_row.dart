import 'package:easy_localization/easy_localization.dart';
import 'package:erasica/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../widgets/buttons/text_btn.dart';

class RestoreRow extends StatelessWidget {
  const RestoreRow({
    super.key,
    required this.onTerms,
    required this.onPrivacy,
    required this.onRestore,
  });

  final VoidCallback onTerms;
  final VoidCallback onPrivacy;
  final VoidCallback onRestore;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 6.w,
      children: [
        _RestoreRowItem(title: 'terms'.tr(), onTap: onTerms),
        _RestoreRowItem(title: 'restore'.tr(), onTap: onRestore),
        _RestoreRowItem(title: 'privacy'.tr(), onTap: onPrivacy),
      ],
    );
  }
}

class _RestoreRowItem extends StatelessWidget {
  const _RestoreRowItem({required this.title, required this.onTap});

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomTextButton(
        text: title,
        onTap: onTap,
        fontSize: 13,
        color: context.color.subtitleDark,
      ),
    );
  }
}
