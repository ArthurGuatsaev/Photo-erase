import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/app_theme.dart';
import '../../../main.dart';
import '../buttons/main_button.dart';
import '../text/text_row.dart';
import '../wrapper/grass.dart';
import '../wrapper/pop_up.dart';

class PopupATT extends StatelessWidget {
  const PopupATT({super.key, required this.onTap});

  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return PopUpWrapper(
      children: [
        _AttImageBox(),
        Column(
          spacing: 10,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextRow(
              text: 'att_title',
              style: context.text.popupTitle.copyWith(
                color: context.color.textBase,
              ),
            ),
            TextRow(
              lines: 3,
              text: 'att_subtitle',
              style: context.text.subtitle.copyWith(
                color: context.color.subtitleDark.withValues(alpha: 0.5),
              ),
            ),
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 16.h,
          children: [
            MainButton(onTap: onTap, title: 'att_btn_yes'),
            GlassWrapper(
              bcgOpacity: 0.08,
              lightIntensity: 0.3,
              borderRadius: 60.r,
              child: MainButton(
                onTap: appRouter.maybePop,
                title: 'att_btn_no',
                color: Colors.transparent,
              ),
            ),
          ],
        ),
      ],
    );
  }

  static show(BuildContext context, VoidCallback onTap) => showDialog(
    context: context,
    builder: (context) => PopupATT(onTap: onTap),
  );
}

class _AttImageBox extends StatelessWidget {
  const _AttImageBox();

  @override
  Widget build(BuildContext context) {
    final double width = 100;
    final color1 = Color.fromRGBO(146, 168, 239, 1);
    final color2 = Color.fromRGBO(93, 131, 249, 1);
    return Stack(
      children: [
        ShaderMask(
          blendMode: BlendMode.modulate,
          shaderCallback: (bounds) => LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0, 0.4, 0.7, 1],
            colors: [Colors.white, color2, color1, Colors.white],
          ).createShader(bounds),
          child: Image.asset(
            'assets/images/light.png',
            width: width * 3,
            color: color1,
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.8),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
