import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/const/assets_path.dart';
import '../../../../core/theme/widget_styles/padding_data.dart';
import '../../../widgets/text/text_row.dart';
import 'onboarding_review_stars.dart';

class OnboardingRatingBox extends StatelessWidget {
  const OnboardingRatingBox({super.key, required this.styleData});

  final PaddingData styleData;
  String _formatNumber(BuildContext context) {
    final locale = context.locale.toString().replaceAll('_', '-');
    final formatter = NumberFormat.decimalPattern(locale);
    return '${formatter.format(4.8)}+';
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 5.w,
        children: [
          Image.asset(AssetsPath.branchLeft, width: 27.w, height: 52.h),
          Flexible(
            child: Column(
              spacing: 2.h,
              children: [
                TextRow(
                  text: _formatNumber(context),
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w800),
                ),

                TextRow(
                  text: 'review_rating',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Colors.white.withValues(alpha: 0.58),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                OnboardingReviewRatingStars(),
              ],
            ),
          ),
          Image.asset(AssetsPath.branchRight, width: 27.w, height: 52.h),
        ],
      ),
    );
  }
}
