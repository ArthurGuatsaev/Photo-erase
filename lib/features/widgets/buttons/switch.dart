import 'package:erasica/core/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSwitch extends StatelessWidget {
  const CustomSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.isNative = false,
  });
  final bool isNative;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    final borderR = BorderRadius.circular(100);
    final nativeBoxD = BoxDecoration(
      color: value
          ? const Color.fromRGBO(106, 213, 40, 1)
          : const Color.fromRGBO(60, 60, 67, 0.3),
      borderRadius: borderR,
    );
    return SizedBox(
      width: 64,
      height: 28,
      child: Stack(
        children: [
          Container(
            width: 64,
            height: 28,
            padding: const EdgeInsets.all(2),
            clipBehavior: Clip.antiAlias,
            decoration: isNative
                ? nativeBoxD
                : BoxDecoration(
                    gradient: value ? context.gradient.mainBtn : null,
                    color: value ? null : const Color.fromRGBO(60, 60, 67, 0.3),
                    borderRadius: borderR,
                  ),
            alignment: Alignment.centerLeft,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  right: 5.5,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: const ShapeDecoration(
                      shape: OvalBorder(
                        side: BorderSide(
                          width: 1,
                          color: const Color.fromRGBO(179, 179, 179, 1),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 10,
                  child: Container(
                    width: 1,
                    height: 10,
                    decoration: const BoxDecoration(color: Colors.white),
                  ),
                ),
                Align(
                  alignment: value
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    width: 39,
                    height: 24,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: borderR),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Opacity(
            opacity: 0,
            child: CupertinoSwitch(value: value, onChanged: onChanged),
          ),
        ],
      ),
    );
  }
}
