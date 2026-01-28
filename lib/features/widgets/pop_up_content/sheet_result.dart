import 'package:erasica/core/const/assets_path.dart';
import 'package:erasica/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/app_theme.dart';
import '../../../entities/photo/photo.dart';
import '../buttons/glass_icon_btn.dart';
import '../buttons/leading_button.dart';
import '../buttons/main_button.dart';
import '../wrapper/background.dart';
import 'package:flutter/material.dart';

class SheetResult extends StatelessWidget {
  const SheetResult({super.key, required this.photo});
  final Photo photo;
  @override
  Widget build(BuildContext context) {
    return BackgroundWrapper(
      isModalSheet: true,
      isDefault: true,
      child: SafeArea(
        top: false,
        child: Column(
          spacing: 20,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBar(
              leading: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: LeadingBtn(
                  icon: AssetsPath.iconClose,
                  onTap: appRouter.maybePop,
                ),
              ),
              actionsPadding: EdgeInsets.only(right: 24),
              actions: [
                GlassIconBtn(
                  data: context.glassButtonData.appbarData,
                  icon: AssetsPath.iconErase,
                  onTap: appRouter.maybePop,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Image.asset(photo.photoPath, fit: BoxFit.contain),
            ),
            SizedBox(height: 16.h),
            Row(
              spacing: 12.w,
              children: [
                GlassIconBtn(
                  data: context.glassButtonData.data,
                  icon: AssetsPath.iconErase,
                  onTap: appRouter.maybePop,
                ),
                Expanded(
                  child: MainButton(
                    title: 'share',
                    onTap: () {
                      //TODO показать если нужно review
                      //TODO переносить на paywall
                      //TODO поделиться
                    },
                    icon: CupertinoIcons.share,
                  ),
                ),
              ],
            ),
            SizedBox(height: 6.h),
          ],
        ),
      ),
    );
  }
}
