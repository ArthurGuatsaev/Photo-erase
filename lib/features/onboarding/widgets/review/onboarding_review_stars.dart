import 'package:flutter/material.dart';

class OnboardingReviewRatingStars extends StatelessWidget {
  const OnboardingReviewRatingStars({super.key, this.size});
  final double? size;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var i = 0; i < 5; i++)
          Icon(Icons.star, size: size ?? 20, color: const Color(0xffFF7C35)),
      ],
    );
  }
}
