import 'package:erasica/core/theme/app_theme.dart';
import 'package:erasica/features/widgets/text/text_row.dart';
import 'package:erasica/features/widgets/wrapper/loading.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
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
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: context.appWidget.data.buttonMaxWidth,
            ),
            child: PrimaryBoxWrapper(
              padding: const EdgeInsets.symmetric(
                vertical: 18,
                horizontal: 16,
              ).copyWith(bottom: 8),
              child: Column(
                spacing: 10,
                mainAxisSize: MainAxisSize.min,
                children: [
                  //TODO по дизайну не сходится анимация :()
                  //ниже отрисовал как по дизайну
                  // OrbitaBox(
                  //   child: GlassWrapper(
                  //     isCircle: true,
                  //     bcgOpacity: 0.1,
                  //     child: Container(
                  //       width: 74 ,
                  //       height: 74 ,
                  //       decoration: BoxDecoration(
                  //         shape: BoxShape.circle,
                  //         // color: context.color.primary.withValues(alpha: 0.1),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Lottie.asset('assets/animations/loading.json'),
                  TextRow(
                    style: context.text.popupTitle.copyWith(
                      color: context.color.title,
                    ),
                    text: 'loading_universal_title',
                  ),
                  TextRow(
                    style: context.text.popupSubtitle.copyWith(
                      color: context.color.subtitleDark,
                    ),
                    text: 'loading_universal_subtitle',
                  ),
                  const SizedBox(width: double.infinity),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
