import 'package:erasica/core/theme/app_theme.dart';
import 'package:erasica/features/widgets/text/text_row.dart';
import 'package:flutter/material.dart';

class BgWebEmpty extends StatelessWidget {
  const BgWebEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 10,
        children: [
          TextRow(
            style: context.text.popupTitle.copyWith(color: context.color.title),
            text: 'background_search_empty_title',
          ),
          TextRow(
            lines: 2,
            style: context.text.popupSubtitle.copyWith(
              color: Color.fromRGBO(255, 255, 255, 0.5),
            ),
            text: 'background_search_empty_subtitle',
          ),
          SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
        ],
      ),
    );
  }
}
