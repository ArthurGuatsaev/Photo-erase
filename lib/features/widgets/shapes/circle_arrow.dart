import 'package:erasica/core/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircleArrowBox extends StatelessWidget {
  const CircleArrowBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: context.gradient.mainBtn,
      ),
      clipBehavior: Clip.antiAlias,
      child: const Icon(
        CupertinoIcons.arrow_up_right,
        size: 18,
        color: Colors.white,
      ),
    );
  }
}
