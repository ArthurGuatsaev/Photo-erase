import 'package:easy_localization/easy_localization.dart';
import 'package:erasica/core/theme/app_theme.dart';
import 'package:erasica/core/theme/text/texts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/const/const.dart';
import '../../settings/widgets/divider.dart';

class PhotoMenu extends StatelessWidget {
  final VoidCallback close;
  final VoidCallback? onEdit;
  final VoidCallback? onShare;
  final VoidCallback? onDelete;

  const PhotoMenu({
    super.key,
    required this.close,
    this.onEdit,
    this.onShare,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.color.box.withValues(alpha: 0.7),
      child: Padding(
        padding: EdgeInsets.only(top: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _MenuActionRow(
              title: 'context_menu_share'.tr(),
              onTap: () {
                AppConst.triggerHaptic();
                close();
                onShare?.call();
              },
              icon: CupertinoIcons.share,
            ),
            _MenuActionRow(
              title: 'context_menu_edit'.tr(),
              onTap: () {
                AppConst.triggerHaptic();
                close();
                onEdit?.call();
              },
              icon: CupertinoIcons.create,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 3),
              child: AppDivider(),
            ),
            _MenuActionRow(
              title: 'context_menu_delete'.tr(),
              onTap: () {
                AppConst.triggerHaptic();
                close();
                onDelete?.call();
              },
              icon: CupertinoIcons.delete,
              isDelete: true,
            ),
            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}

class _MenuActionCell extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _MenuActionCell({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 22, color: context.color.title),
            SizedBox(height: 5),
            Text(
              title,
              style: TextStyle(
                fontSize: 12,
                fontFamily: font(FontWeight.w500),
                color: context.color.title,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _MenuActionRow extends StatelessWidget {
  const _MenuActionRow({
    required this.title,
    required this.onTap,
    this.icon,
    this.isDelete = false,
  });

  final String title;
  final VoidCallback onTap;
  final IconData? icon;
  final bool isDelete;

  @override
  Widget build(BuildContext context) {
    final color = Color.fromRGBO(226, 17, 17, 1);
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 16).copyWith(right: 8),
        height: 40,
        padding: EdgeInsets.symmetric(horizontal: 10).copyWith(right: 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 0),
            Icon(icon, size: 21, color: isDelete ? color : context.color.title),
            SizedBox(width: 13),
            Expanded(
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: font(FontWeight.w500),
                  color: isDelete ? color : context.color.title,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
