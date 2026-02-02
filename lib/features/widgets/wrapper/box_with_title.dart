import 'package:erasica/core/router/router.gr.dart';
import 'package:erasica/core/theme/app_theme.dart';
import 'package:erasica/features/widgets/buttons/text_button.dart';
import 'package:erasica/features/widgets/text/text_row.dart';
import 'package:erasica/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BoxWithTitleWrapper extends StatelessWidget {
  const BoxWithTitleWrapper({
    super.key,
    required this.title,
    this.showMore,
    required this.child,
  });
  final String title;
  final String? showMore;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(
      slivers: [
        SliverToBoxAdapter(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppTextButton(
                onTap: null,
                child: TextRow(
                  align: TextAlign.start,
                  style: context.text.boxTitle.copyWith(
                    color: context.color.textBase,
                  ),
                  text: title,
                ),
              ),

              if (showMore != null)
                AppTextButton(
                  onTap: () {
                    appRouter.push(HistoryRoute());
                  },
                  child: TextRow(
                    align: TextAlign.start,
                    style: context.text.galleryBoxTitle.copyWith(
                      color: Color.fromRGBO(31, 80, 208, 1),
                    ),
                    text: showMore!,
                  ),
                ),
            ],
          ),
        ),
        child,
      ],
    );
  }
}
