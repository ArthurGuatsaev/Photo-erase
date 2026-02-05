import 'package:erasica/features/widgets/text/text_row.dart';
import 'package:flutter/material.dart';

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
    final borderR = 20.0;
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: context.appWidget.data.buttonMaxWidth,
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(borderR),
          onTap: onTap,
          child: GlassContainer(
            borderRadius: borderR,
            gradient: context.gradient.box.withOpacity(0.05),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12.5),

            child: Row(
              spacing: 12,
              children: [
                Expanded(
                  child: TextRow(
                    text: option,
                    align: TextAlign.start,
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: font(FontWeight.w500),
                      height: 1.33,
                    ),
                  ),
                ),
                isSelected
                    ? const SelectedIcon()
                    : const UnselectedIcon(
                        needShadow: false,
                        color: Color.fromRGBO(255, 255, 255, 0.13),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
