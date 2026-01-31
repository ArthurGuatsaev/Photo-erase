import 'package:erasica/features/widgets/wrapper/primary_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../widgets/text/text_row.dart';
import '../../../widgets/wrapper/grass.dart';
import '../../model/review.dart';
import 'onboarding_review_stars.dart';

class OnboardingReviewItem extends StatelessWidget {
  const OnboardingReviewItem({super.key, required this.review});

  final Review review;

  @override
  Widget build(BuildContext context) {
    final borderR = 18.0.r;
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 40),
          child: GlassWrapper(
            borderRadius: borderR,
            bcgOpacity: 0.1,
            child: PrimaryBoxWrapper(
              borderRadius: borderR,
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 13),
              child: Column(
                spacing: 14,
                mainAxisSize: MainAxisSize.min,
                children: [
                  _NameWithRating(review: review),
                  TextRow(
                    text: review.text,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Colors.white.withValues(alpha: 0.8),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Align(
                child: SizedBox(
                  width: 87.sp,
                  height: 87.sp,
                  child: ClipOval(
                    child: Image.asset(review.avatarPath, fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
            Expanded(child: SizedBox()),
          ],
        ),
      ],
    );
  }
}

class _NameWithRating extends StatelessWidget {
  const _NameWithRating({required this.review});

  final Review review;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: SizedBox.shrink()),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextRow(
                text: review.name,
                align: TextAlign.start,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: GoogleFonts.inter(
                    fontWeight: FontWeight.w700,
                  ).fontFamily,
                  height: 1.20,
                ),
              ),

              Row(
                children: [
                  TextRow(
                    text: review.rating.toStringAsFixed(1),
                    align: TextAlign.start,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: GoogleFonts.inter(
                        fontWeight: FontWeight.w700,
                      ).fontFamily,
                      height: 1.20,
                    ),
                  ),

                  SizedBox(width: 2.w),
                  OnboardingReviewRatingStars(),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
