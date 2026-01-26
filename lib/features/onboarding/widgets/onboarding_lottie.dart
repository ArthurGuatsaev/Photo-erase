import 'package:flutter/material.dart';

class OnboardingLottie extends StatelessWidget {
  const OnboardingLottie(this.lottieAnimation, {super.key});

  final String lottieAnimation;

  @override
  Widget build(BuildContext context) {
    // final styleData = context.pagePadding.data;

    return Stack(
      fit: StackFit.expand,
      clipBehavior: Clip.none,
      children: [
        // Positioned.fill(child: Image.asset(AssetsPath.iconBack)),
        // Align(
        //   alignment: Alignment.center,
        //   child: LottieView.fromAsset(filePath: lottieAnimation, loop: false),
        // ),
        // Positioned(
        //   left: 0,
        //   right: 0,
        //   bottom: 0,
        //   child: Container(
        //     height: 94.h,
        //     clipBehavior: Clip.antiAlias,
        //     decoration: BoxDecoration(
        //       gradient: LinearGradient(
        //         begin: const Alignment(0, -1.00),
        //         end: const Alignment(0, 1.00),
        //         colors: [Colors.white.withValues(alpha: 0), Colors.white],
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
