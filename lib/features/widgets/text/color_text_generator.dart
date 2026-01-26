import 'package:erasica/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class TextColorGenerator extends StatelessWidget {
  const TextColorGenerator({
    super.key,
    required this.source,
    required this.style,
    required this.colorStyle,
    this.align,
  });
  final String source;
  final TextStyle colorStyle;
  final TextStyle style;
  final TextAlign? align;

  List<InlineSpan> _colorSpans(BuildContext context) {
    int lastEnd = 0;
    final spans = <InlineSpan>[];
    final regex = RegExp(r'<color>(.*?)<\/color>', dotAll: true);
    for (final match in regex.allMatches(source)) {
      if (match.start > lastEnd) {
        spans.add(
          TextSpan(text: source.substring(lastEnd, match.start), style: style),
        );
      }
      spans.add(TextSpan(text: match.group(1), style: colorStyle));
      lastEnd = match.end;
    }

    if (lastEnd < source.length) {
      spans.add(TextSpan(text: source.substring(lastEnd), style: style));
    }

    return spans;
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: align ?? TextAlign.center,
      text: TextSpan(children: _colorSpans(context)),
    );
  }
}
