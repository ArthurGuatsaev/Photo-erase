import 'package:erasica/core/const/assets_path.dart';
import 'package:erasica/core/theme/app_theme.dart';
import 'package:erasica/features/main/widgets/gallery_photos/gallery_cubit.dart';
import 'package:erasica/features/widgets/wrapper/grass.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../widgets/shapes/circle_arrow.dart';
import '../../../../widgets/text/text_row.dart';

class AllowingButton extends StatelessWidget {
  const AllowingButton({super.key});

  @override
  Widget build(BuildContext context) {
    final borderRadius = 24.0;
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsetsGeometry.symmetric(horizontal: 32),
        child: AspectRatio(
          aspectRatio: 311 / 200,
          child: GlassWrapper(
            borderRadius: borderRadius,
            bcgOpacity: 0.02,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(borderRadius),
                onTap: () {
                  context.read<GalleryCubit>().onPressAllow(
                    // onEnd: () => showAppSheet(context, ShowingRemovingButtons()),
                  );
                },
                child: Ink(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 20,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(borderRadius),
                    image: DecorationImage(
                      image: Image.asset(AssetsPath.allowingBtnBg).image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    spacing: 20.h,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: LayoutBuilder(
                          builder: (context, constraites) {
                            return Image.asset(
                              AssetsPath.allowingBtnCenter,
                              width: constraites.maxWidth / 3.3,
                            );
                          },
                        ),
                      ),
                      Column(
                        spacing: 6.h,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            spacing: 6.w,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextRow(
                                style: context.text.allowingBtnTitle.copyWith(
                                  color: context.color.textBase,
                                ),
                                text: 'allowing_btn_title',
                              ),
                              CircleArrowBox(),
                            ],
                          ),
                          TextRow(
                            style: context.text.popupSubtitle.copyWith(
                              color: context.color.subtitleDark,
                            ),
                            text: 'allowing_btn_subtitle',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
