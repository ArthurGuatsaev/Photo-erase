import 'package:erasica/features/widgets/wrapper/photo_box.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../widgets/shapes/shadow_opacity_box.dart';

class CaruselAnimation extends StatelessWidget {
  const CaruselAnimation({
    super.key,
    required this.index,
    this.withoutPadding = false,
  });
  final int index;
  final bool withoutPadding;

  @override
  Widget build(BuildContext context) {
    if (withoutPadding) {
      return Padding(
        padding: const EdgeInsets.only(top: 19),
        child: Stack(
          children: [
            Lottie.asset('assets/animations/paywallanim_$index.json'),
            ShadowOpacityBox(),
          ],
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.all(19),
      child: AspectRatio(
        aspectRatio: 293 / 206,
        child: PhotoBoxWrapper(
          child: Lottie.asset('assets/animations/paywallanim_$index.json'),
        ),
      ),
    );
  }
}
