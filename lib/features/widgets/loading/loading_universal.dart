import 'package:erasica/core/theme/app_theme.dart';
import 'package:erasica/features/widgets/shapes/orbita_box.dart';
import 'package:erasica/features/widgets/text/text_row.dart';
import 'package:erasica/features/widgets/wrapper/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../wrapper/primary_box.dart';

class LoadingUniversal extends StatelessWidget {
  const LoadingUniversal({super.key});

  @override
  Widget build(BuildContext context) {
    return LoadingWrapper(
      child: Padding(
        padding: context.appWidget.data.pagePadding,
        child: Align(
          alignment: Alignment.center,
          child: PrimaryBoxWrapper(
            child: Column(
              spacing: 10,
              mainAxisSize: MainAxisSize.min,
              children: [
                OrbitaBox(
                  child: Container(
                    width: 74.w,
                    height: 74.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: context.color.primary,
                    ),
                  ),
                ),
                const SizedBox(width: double.infinity),
                TextRow(
                  style: context.text.popupTitle.copyWith(
                    color: context.color.title,
                  ),
                  text: 'loading_universal_title',
                ),
                TextRow(
                  style: context.text.popupSubtitle.copyWith(
                    color: context.color.subtitle,
                  ),
                  text: 'loading_universal_subtitle',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
