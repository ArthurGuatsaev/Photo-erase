import 'dart:async';
import 'package:erasica/core/const/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_theme.dart';
import '../../model/onboarding_step.dart';
import '../../model/review.dart';
import 'onboarding_review_item.dart';
import 'onboarding_review_rating.dart';

class OnboardingReview extends StatefulWidget {
  const OnboardingReview({super.key});

  @override
  State<OnboardingReview> createState() => _OnboardingReviewState();
}

class _OnboardingReviewState extends State<OnboardingReview> {
  @override
  void initState() {
    super.initState();
    reviews = [...OnboardingStep.step3.reviews];
    Future.delayed(const Duration(milliseconds: 250), () {
      if (!mounted) return;
      reviews[1].isVisible = true;
      reviews[2].isVisible = true;
      setState(() {});
    });
  }

  late final List<Review> reviews;
  @override
  Widget build(BuildContext context) {
    final styleData = context.appWidget.data;
    return Column(
      spacing: 20,
      children: [
        OnboardingRatingBox(styleData: styleData),
        Expanded(
          child: Stack(
            fit: StackFit.expand,
            clipBehavior: Clip.none,
            children: [
              AnimatedPositioned(
                duration: styleData.animationDuration,
                curve: styleData.curve,
                top: reviews[2].isVisible ? 238.h : 84.h,
                left: 0,
                right: 0,
                child: Transform.scale(
                  scale: 0.72,
                  child: OnboardingReviewItem(review: reviews[2]),
                ),
              ),
              AnimatedPositioned(
                duration: styleData.animationDuration,
                curve: styleData.curve,
                top: reviews[1].isVisible ? 128.h : 64.h,
                left: 0,
                right: 0,
                child: Transform.scale(
                  scale: 0.86,
                  child: OnboardingReviewItem(review: reviews[1]),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: OnboardingReviewItem(review: reviews[0]),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Image.asset(
                  AssetsPath.reviewBgRects,
                  width: double.infinity,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
