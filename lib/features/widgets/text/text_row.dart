import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TextRow extends StatelessWidget {
  const TextRow({
    super.key,
    required this.style,
    this.lines,
    this.align,
    required this.text,
  });
  final TextStyle style;
  final int? lines;
  final TextAlign? align;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text.tr(),
      textAlign: align ?? TextAlign.center,
      maxLines: lines ?? 1,
      overflow: TextOverflow.ellipsis,
      style: style,
    );
  }
}
