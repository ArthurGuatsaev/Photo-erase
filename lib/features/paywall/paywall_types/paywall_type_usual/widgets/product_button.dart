import 'package:erasica/features/widgets/shapes/selected_icon.dart';
import 'package:erasica/features/widgets/shapes/unselected_icon.dart';
import 'package:erasica/features/widgets/text/text_row.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import '../../../../../core/theme/app_theme.dart';
import '../../../../../core/theme/text/texts.dart';

class ProductButton extends StatelessWidget {
  const ProductButton({
    super.key,
    required this.title,
    required this.subtitle,
    required this.isSelected,
    this.price,
    this.originalPrice,
    this.onTap,
    this.label,
  });

  final String title;
  final String subtitle;
  final String? price;
  final String? originalPrice;
  final bool isSelected;
  final VoidCallback? onTap;
  final String? label;

  @override
  Widget build(BuildContext context) {
    final styleData = context.pagePadding.data;
    final textColor = isSelected
        ? context.color.title
        : context.color.subtitleDark;
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        width: double.infinity,
        constraints: BoxConstraints(minHeight: 60.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40.r),
          border: GradientBoxBorder(gradient: context.gradient.continueBtn),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        duration: styleData.animationDuration,
        curve: styleData.curve,
        child: Row(
          spacing: 10.w,
          children: [
            isSelected ? SelectedIcon() : UnselectedIcon(needShadow: false),
            Expanded(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: 60.h),
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.centerLeft,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextRow(
                            text: title,
                            align: TextAlign.start,
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontFamily: font(FontWeight.w600),
                            ),
                          ),
                          TextRow(
                            text: subtitle,
                            align: TextAlign.start,
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontFamily: font(FontWeight.w400),
                              color: textColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // if (label != null) _ProductButtonLabel(text: label ?? ""),
                  ],
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              spacing: 3.h,
              children: [
                if (originalPrice != null)
                  Text(
                    originalPrice!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontFamily: font(FontWeight.w500),
                      decoration: TextDecoration.lineThrough,
                      color: textColor,
                    ),
                  ),
                Text(
                  price ?? "",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontFamily: font(FontWeight.w600),
                    height: 1,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// Адаптивно меняет размеры под локализации
class _ProductButtonLabel extends StatelessWidget {
  const _ProductButtonLabel({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -11,
      right: 15,
      child: Stack(
        fit: StackFit.loose,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: -7,
            right: -7,
            top: 0,
            child: Container(
              height: 11,
              width: 20,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(255, 184, 116, 1),
                    Color.fromRGBO(239, 63, 11, 1),
                  ],
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
            ),
          ),
          Container(
            height: 21,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFFF9F40), Color(0xFFFF5A2B)],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              boxShadow: [
                BoxShadow(
                  color: Color(0x0F000000),
                  blurRadius: 2.20,
                  offset: Offset(0, 3.30),
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 13),
              child: Text(
                text,
                style: TextStyle(
                  fontFamily: font(FontWeight.w600),
                  fontSize: 13,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
