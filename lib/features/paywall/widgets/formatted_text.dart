import 'package:flutter/cupertino.dart';

class FormattedText extends StatelessWidget {
  const FormattedText(
    this.text, {
    super.key,
    required this.style,
    required this.color,
    this.textAlign,
  });

  final String text;
  final TextStyle? style;
  final Color color;
  final TextAlign? textAlign;

  List<InlineSpan> _buildSpans(String source) {
    final spans = <InlineSpan>[];

    final tagRe = RegExp(r'<\s*(/?)\s*(color|s)\s*>', caseSensitive: false);
    final matches = tagRe.allMatches(source).toList();

    final stack = <String>[];

    TextStyle? currentStyle() {
      final hasColor = stack.contains('color');
      final hasStrike = stack.contains('s');

      final base = style;

      return base?.copyWith(
            color: hasColor ? color : base.color,
            decoration: hasStrike
                ? TextDecoration.lineThrough
                : base.decoration,
            decorationColor: hasColor ? color : base.color,
          ) ??
          TextStyle(
            color: hasColor ? color : null,
            decoration: hasStrike ? TextDecoration.lineThrough : null,
          );
    }

    void openTag(String tag) {
      stack.add(tag);
    }

    void closeTag(String tag) {
      for (int i = stack.length - 1; i >= 0; i--) {
        if (stack[i] == tag) {
          stack.removeAt(i);
          break;
        }
      }
    }

    var last = 0;
    for (final m in matches) {
      if (m.start > last) {
        spans.add(
          TextSpan(
            text: source.substring(last, m.start),
            style: currentStyle(),
          ),
        );
      }

      final isClosing = (m.group(1) ?? '') == '/';
      final tag = (m.group(2) ?? '').toLowerCase();

      if (isClosing) {
        closeTag(tag);
      } else {
        openTag(tag);
      }

      last = m.end;
    }

    if (last < source.length) {
      spans.add(TextSpan(text: source.substring(last), style: currentStyle()));
    }

    return spans;
  }

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(children: _buildSpans(text)),
      textAlign: textAlign,
    );
  }
}
