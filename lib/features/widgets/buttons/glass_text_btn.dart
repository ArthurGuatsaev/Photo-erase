import 'package:erasica/core/theme/app_theme.dart';
import 'package:erasica/core/theme/text/texts.dart';
import 'package:erasica/features/widgets/text/text_row.dart';
import 'package:erasica/features/widgets/wrapper/glass.dart';
import 'package:flutter/material.dart';

class GlassTextBtn extends StatelessWidget {
  const GlassTextBtn({super.key, required this.onTap, required this.title});
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(30);
    return GlassWrapper(
      data: context.glass.box.copyWith(bcgOpacity: 0.1, fake: true),
      borderRadius: 30,
      child: SizedBox(
        height: 40,
        child: Material(
          color: Colors.transparent,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(borderRadius: borderRadius),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
            ),
            onPressed: onTap,
            child: TextRow(
              style: context.text.btnTitle.copyWith(
                color: context.color.title,
                fontFamily: font(FontWeight.w400),
              ),
              text: title,
            ),
          ),
        ),
      ),
    );
  }
}
