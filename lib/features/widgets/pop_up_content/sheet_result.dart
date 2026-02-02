import 'dart:io';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:erasica/main.dart';
import 'package:flutter/cupertino.dart';
import '../../../core/const/assets_path.dart';
import '../../../core/theme/app_theme.dart';
import '../../../entities/photo/photo.dart';
import '../../main/bloc/photo_bloc.dart';
import '../buttons/glass_icon_btn.dart';
import '../buttons/leading_button.dart';
import '../buttons/main_button.dart';
import '../pop/sheet.dart';
import '../wrapper/background.dart';
import 'package:flutter/material.dart';

class SheetResult extends StatelessWidget {
  const SheetResult({super.key, required this.photo, required this.photoBloc});
  final Photo photo;
  final PhotoBloc photoBloc;
  @override
  Widget build(BuildContext context) {
    return BackgroundWrapper(
      isModalSheet: true,
      isDefault: true,
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            AppBar(
              leadingWidth: 70.w,
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
                  icon: AssetsPath.iconDelete,
                  onTap: () {
                    photoBloc.add(
                      PressDeletePhotos(
                        ids: [photo.id],
                        backCallback: () {
                          appRouter.maybePop();
                          appRouter.popUntil(
                            (route) => route.settings.name == 'MainRoute',
                          );
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 10.h),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.file(File(photo.photoPath), fit: BoxFit.contain),
              ),
            ),
            SizedBox(height: 16.h),

            Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 24.w),
              child: Row(
                spacing: 12.w,
                children: [
                  GlassIconBtn(
                    data: context.glassButtonData.data,
                    icon: AssetsPath.iconEdit,
                    onTap: () {
                      appRouter.maybePop();
                      photoBloc.add(PressEditPhoto(photo: photo));
                    },
                  ),
                  Expanded(
                    child: MainButton(
                      title: 'share_btn',
                      onTap: () {
                        final render = context.findRenderObject() as RenderBox;
                        //TODO показать если нужно review
                        appRouter.maybePop();
                        photoBloc.add(
                          PressSharePhotos(photos: [photo], render: render),
                        );
                      },
                      icon: CupertinoIcons.share,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 6.h),
          ],
        ),
      ),
    );
  }

  static show(Photo photo, PhotoBloc photoBloc) => showAppSheet(
    appRouter.navigatorKey.currentContext!,
    SheetResult(photo: photo, photoBloc: photoBloc),
  );
}
