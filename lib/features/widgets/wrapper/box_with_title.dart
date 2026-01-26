import 'package:erasica/core/theme/app_theme.dart';
import 'package:erasica/features/widgets/text/text_row.dart';
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
          child: Padding(
            padding: const EdgeInsets.only(left: 24, bottom: 16),
            child: TextRow(
              align: TextAlign.start,
              style: context.text.galleryBoxTitle.copyWith(
                color: context.color.textBase,
              ),
              text: title,
            ),
          ),
        ),
        child,
      ],
    );
  }
}
