import 'package:erasica/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

import '../text/text_row.dart';

class CustomTextButton extends StatefulWidget {
  const CustomTextButton({
    super.key,
    required this.text,
    required this.onTap,
    this.fontSize,
    this.color,
    this.padding,
  });

  final String text;
  final VoidCallback onTap;
  final double? fontSize;
  final Color? color;
  final EdgeInsets? padding;

  @override
  State<CustomTextButton> createState() => _CustomTextButtonState();
}

class _CustomTextButtonState extends State<CustomTextButton> {
  bool _pressed = false;

  void _setPressed(bool v) {
    if (_pressed == v) return;
    setState(() => _pressed = v);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: widget.onTap,
      onTapDown: (_) => _setPressed(true),
      onTapUp: (_) => _setPressed(false),
      onTapCancel: () => _setPressed(false),
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 90),
        curve: Curves.easeOut,
        opacity: _pressed ? 0.35 : 1.0,
        child: Container(
          padding: widget.padding ?? EdgeInsets.symmetric(horizontal: 5),
          child: TextRow(
            text: widget.text,
            style: context.text.subtitle.copyWith(
              color: widget.color,
              fontSize: widget.fontSize,
            ),
          ),
        ),
      ),
    );
  }
}
