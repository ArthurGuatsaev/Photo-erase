import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/app_theme.dart';

class OfferLine extends StatelessWidget {
  const OfferLine({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h,
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.loose,
        children: [
          SvgPicture.asset(
            fit: BoxFit.fitWidth,
            width: double.infinity,
            alignment: Alignment.center,
            "assets/images/paywall/offer_line.svg",
          ),
          Positioned(
            top: 40.h,
            left: 0,
            right: 0,
            child: Padding(
              padding: context.pagePadding.data.pagePadding,
              child: Row(
                children: [
                  Expanded(
                    child: AutoSizeText(
                      "limited_offer".tr(),
                      style: TextStyle(
                        // color: AppColors.titleColorReverse,
                        fontFamily: GoogleFonts.inter(
                          fontWeight: FontWeight.w900,
                        ).fontFamily,
                        fontSize: 24.sp,
                      ),
                      maxLines: 1,
                    ),
                  ),
                  SizedBox(width: 16),
                  Text(
                    "-50%",
                    style: TextStyle(
                      // color: AppColors.titleColorReverse,
                      fontFamily: GoogleFonts.inter(
                        fontWeight: FontWeight.w900,
                      ).fontFamily,
                      fontSize: 46.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
