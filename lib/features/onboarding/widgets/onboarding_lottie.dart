import 'package:flutter/material.dart';
import 'package:lottie_native/lottie_native.dart';

class OnboardingLottie extends StatelessWidget {
  const OnboardingLottie(this.lottieAnimation, {super.key});

  final String lottieAnimation;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      clipBehavior: Clip.none,
      children: [
        Align(
          alignment: Alignment.center,
          child: LottieView.fromAsset(filePath: lottieAnimation, loop: false),
        ),
      ],
    );
  }
}
