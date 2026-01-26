import 'package:erasica/features/widgets/text/text_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/text/texts.dart';
import '../../../widgets/shapes/glass_container.dart';
import '../../../widgets/shapes/selected_icon.dart';
import '../../../widgets/shapes/unselected_icon.dart';

class QuestionItem extends StatelessWidget {
  const QuestionItem({
    super.key,
    required this.option,

    required this.isSelected,
    required this.onTap,
  });

  final String option;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: GlassContainer(
        borderRadius: 20,
        gradient: context.gradient.thickness,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.5.h),

        child: Row(
          spacing: 12.w,
          children: [
            Expanded(
              child: TextRow(
                text: option,
                align: TextAlign.start,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontFamily: font(FontWeight.w500),
                  height: 1.33,
                ),
              ),
            ),
            isSelected
                ? SelectedIcon()
                : UnselectedIcon(
                    needShadow: false,
                    color: context.color.selectedIcon.withValues(alpha: 0.3),
                  ),
          ],
        ),
      ),
    );
  }
}
