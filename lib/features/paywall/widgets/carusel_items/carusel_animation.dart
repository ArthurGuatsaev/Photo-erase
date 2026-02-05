import 'package:erasica/features/widgets/wrapper/photo_box.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CaruselAnimation extends StatelessWidget {
  const CaruselAnimation({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
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
