import 'package:easy_localization/easy_localization.dart';
import 'package:erasica/features/paywall/cubits/paywall/paywall_cubit.dart';
import 'package:erasica/features/paywall/widgets/paywall_shape.dart';
import 'package:erasica/features/widgets/buttons/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../services/payments/extensions.dart';
import '../../cubits/paying/paying_cubit.dart';
import '../../widgets/formatted_text.dart';
import '../../widgets/offer_line.dart';
import '../../../widgets/sliders/carusel/carusel.dart';

//TODO
class PaywallTypeSpecialOffer extends StatelessWidget {
  const PaywallTypeSpecialOffer({super.key, required this.paywallState});
  final PaywallSpecialState paywallState;
  @override
  Widget build(BuildContext context) {
    final halfYear = paywallState.productHalfYear;
    final paywallCubit = context.read<PayingCubit>();
    return BlocBuilder<PayingCubit, PayingState>(
      builder: (context, state) {
        return Stack(
          children: [
            // Positioned.fill(
            //   child: Image.asset(AppImages.paywallBg, fit: BoxFit.cover),
            // ),
            PaywallShape(
              children: [
                SizedBox(height: 40.h),
                OfferLine(),
                SizedBox(height: 20.h),
                Expanded(child: AppCarusel(items: [])),
                SizedBox(height: 20.h),
                Padding(
                  padding: context.appWidget.data.pagePadding,
                  child: Column(
                    children: [
                      FormattedText(
                        "paywall_special_title".tr(),
                        style: TextStyle(
                          fontSize: 19.sp,
                          // fontFamily: font(FontWeight.w700),
                          // height: 1.30,
                          // color: AppColors.titleColor,
                        ),
                        color: Colors.red,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 12.h),
                      FormattedText(
                        color: Colors.red,
                        "paywall_special_price_per_day".tr(
                          args: [halfYear.product.perDayLocalized ?? ""],
                        ),
                        style: TextStyle(
                          // fontFamily: font(.w500),
                          fontSize: 14,
                          // color: AppColors.titleColor,
                        ),
                        // color: AppColors.orangeSecond,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 6.h),
                      FormattedText(
                        color: Colors.red,

                        "paywall_special_price".tr(
                          args: [
                            halfYear.originPrice ?? "",
                            halfYear.price ?? "",
                          ],
                        ),
                        style: TextStyle(
                          // fontFamily: font(.w400),
                          fontSize: 14,
                          // color: AppColors.textColor,
                        ),
                        // color: AppColors.labelColor,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25.h),
                Padding(
                  padding: context.appWidget.data.pagePadding,
                  child: MainButton(
                    onTap: () => paywallCubit.purchaseProduct(halfYear.product),
                    title: "claim_button".tr(),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
