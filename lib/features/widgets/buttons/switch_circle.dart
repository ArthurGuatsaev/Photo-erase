import 'package:erasica/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CustomCircleSwitch extends StatefulWidget {
  const CustomCircleSwitch({super.key, required this.value});
  final ValueNotifier<bool> value;

  @override
  State<CustomCircleSwitch> createState() => _CustomCircleSwitchState();
}

class _CustomCircleSwitchState extends State<CustomCircleSwitch> {
  @override
  Widget build(BuildContext context) {
    final boxHeight = 22.0;
    final boxWidth = 36.0;
    final padding = 1.5;
    final thumbSize = boxHeight - padding * 2;
    return GestureDetector(
      onTap: () {
        widget.value.value = !widget.value.value;
      },
      child: Container(
        width: boxWidth,
        height: boxHeight,
        decoration: BoxDecoration(
          color: widget.value.value ? Color.fromRGBO(4, 2, 15, 0.15) : null,
          gradient: widget.value.value ? null : context.gradient.mainBtn,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(1.5),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 200),
          alignment: widget.value.value
              ? Alignment.centerLeft
              : Alignment.centerRight,
          child: ClipOval(
            child: Container(
              width: thumbSize,
              height: thumbSize,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
