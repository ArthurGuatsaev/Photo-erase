import 'package:flutter/material.dart';

import '../../../core/theme/app_theme.dart';

class ShadowOpacityBox extends StatelessWidget {
  const ShadowOpacityBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(gradient: context.gradient.opacityBg),
      ),
    );
  }
}
