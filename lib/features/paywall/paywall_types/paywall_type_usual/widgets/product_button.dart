import 'package:adapty_flutter/adapty_flutter.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:erasica/features/paywall/cubits/paying/paying_cubit.dart';
import 'package:erasica/features/widgets/shapes/selected_icon.dart';
import 'package:erasica/features/widgets/shapes/unselected_icon.dart';
import 'package:erasica/features/widgets/text/text_row.dart';
import 'package:erasica/features/widgets/wrapper/glass.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import '../../../../../core/theme/app_theme.dart';
import '../../../../../core/theme/text/texts.dart';

class ProductButton extends StatelessWidget {
  const ProductButton({
    super.key,
    required this.title,
    required this.subtitle,
    required this.product,
    this.price,
    this.originalPrice,
    this.label,
  });

  final String title;
  final String subtitle;
  final String? price;
  final String? originalPrice;
  final AdaptyPaywallProduct product;
  final String? label;

  @override
  Widget build(BuildContext context) {
    final borderR = 40.r;
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 10.h),
          child: BlocBuilder<PayingCubit, PayingState>(
            buildWhen: (prev, curr) =>
                prev.selectedProduct != curr.selectedProduct,
            builder: (context, state) {
              final isSelected = state.selectedProduct == product;
              final textColor = isSelected
                  ? context.color.title
                  : context.color.subtitleDark;
              return GestureDetector(
                onTap: () =>
                    context.read<PayingCubit>().purchaseProduct(product),
                child: GlassWrapper(
                  borderRadius: borderR,
                  data: context.glass.mainButton.copyWith(
                    lightIntensity: isSelected ? 0 : 0.5,
                  ),
                  child: Container(
                    width: double.infinity,
                    constraints: BoxConstraints(minHeight: 60.h),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.04),
                      borderRadius: BorderRadius.circular(borderR),
                      border: isSelected
                          ? GradientBoxBorder(
                              gradient: context.gradient.continueBtn,
                              width: 2,
                            )
                          : Border.all(color: Colors.transparent, width: 2),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Row(
                      spacing: 10.w,
                      children: [
                        isSelected
                            ? SelectedIcon()
                            : UnselectedIcon(
                                color: Color.fromRGBO(255, 255, 255, 0.15),
                              ),
                        Expanded(
                          child: Stack(
                            clipBehavior: Clip.none,
                            alignment: Alignment.centerLeft,
                            children: [
                              Column(
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
                            ],
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
                                  color: context.color.subtitleDark,
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
                ),
              );
            },
          ),
        ),
        if (label != null) _ProductButtonLabel(text: label ?? ""),
      ],
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
      top: 0,
      right: 40.w,
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
            margin: const EdgeInsets.only(top: 1),
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
                text.tr(),
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
