import 'dart:ui';
import 'package:flutter/material.dart';

import '../../../core/theme/app_theme.dart';
import '../../../main.dart';

class PopUpWrapper extends StatelessWidget {
  const PopUpWrapper({super.key, required this.children, this.bgColor});
  final List<Widget> children;
  final Color? bgColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: appRouter.pop,
      child: Stack(
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(color: Colors.white.withValues(alpha: 0.02)),
          ),
          Material(
            color: Colors.transparent,
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: context.appWidget.data.buttonMaxWidth,
                ),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      color: bgColor ?? context.color.box,
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 21,
                      horizontal: 16,
                    ),
                    child: Column(
                      spacing: 20,
                      mainAxisSize: MainAxisSize.min,
                      children: children,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
