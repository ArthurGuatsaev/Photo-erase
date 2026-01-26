import 'package:easy_localization/easy_localization.dart';
import 'package:erasica/features/widgets/buttons/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../services/payments/extensions.dart';
import '../../paywall_cubit.dart';
import '../../widgets/close_button.dart';
import '../../widgets/formatted_text.dart';
import '../../widgets/offer_line.dart';
import '../../../widgets/sliders/carusel/carusel.dart';
import '../../widgets/paywall_bottom_module.dart';
import '../../widgets/paywall_scroll_wrapper.dart';

class PaywallTypeSpecialOffer extends StatelessWidget {
  const PaywallTypeSpecialOffer({super.key});

  @override
  Widget build(BuildContext context) {
    final paywallCubit = context.read<PaywallCubit>();
    return BlocBuilder<PaywallCubit, PaywallState>(
      builder: (context, state) {
        return Stack(
          children: [
            // Positioned.fill(
            //   child: Image.asset(AppImages.paywallBg, fit: BoxFit.cover),
            // ),
            PaywallScrollWrapper(
              bottomChild: PaywallBottomModule(),
              widgets: [
                SizedBox(height: 40.h),
                OfferLine(),
                SizedBox(height: 20.h),
                Expanded(child: AppCarusel(items: [])),
                SizedBox(height: 20.h),
                Padding(
                  padding: context.pagePadding.data.pagePadding,
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
                          args: [
                            paywallCubit
                                    .state
                                    .placement
                                    ?.halfyearProduct
                                    ?.perDayLocalized ??
                                "",
                          ],
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
                            paywallCubit
                                    .state
                                    .placement
                                    ?.halfyearProduct
                                    ?.originalPriceLocalized ??
                                "",
                            paywallCubit
                                    .state
                                    .placement
                                    ?.halfyearProduct
                                    ?.priceLocalized ??
                                "",
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
                  padding: context.pagePadding.data.pagePadding,
                  child: MainButton(
                    onTap: () => paywallCubit.purchaseProduct(
                      paywallCubit.state.placement?.halfyearProduct,
                      context,
                    ),
                    title: "claim_button".tr(),
                  ),
                ),
              ],
            ),
            CloseButtonWidget(onClose: paywallCubit.closePaywall),
          ],
        );
      },
    );
  }
}
