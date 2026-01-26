import 'package:easy_localization/easy_localization.dart';
import 'package:erasica/features/paywall/widgets/paywall_carusel.dart';
import 'package:erasica/features/widgets/buttons/main_button.dart';
import 'package:erasica/features/widgets/text/text_row.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/const/const.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/text/texts.dart';
import '../../../../services/payments/extensions.dart';
import '../../paywall_cubit.dart';
import '../../widgets/close_button.dart';
import '../../widgets/no_paymant_box.dart';
import '../../widgets/total_row.dart';
import 'widgets/product_button.dart';
import 'widgets/restore_row.dart';
import 'widgets/switch_row.dart';

class PaywallTypeUsual extends StatelessWidget {
  const PaywallTypeUsual({super.key});

  @override
  Widget build(BuildContext context) {
    final styleData = context.pagePadding.data;
    final pageHeight =
        MediaQuery.sizeOf(context).height -
        MediaQuery.of(context).padding.bottom -
        styleData.bottomOffset;
    return BlocBuilder<PaywallCubit, PaywallState>(
      builder: (context, state) {
        final cubit = context.read<PaywallCubit>();
        return Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: pageHeight,
                    child: SafeArea(
                      bottom: false,
                      child: Column(
                        children: [
                          SizedBox(height: 30.h),
                          Padding(
                            padding: styleData.pagePadding,
                            child: Column(
                              spacing: 8.h,
                              children: [
                                TextRow(
                                  text: state.document != null
                                      ? 'ready_to_share'.tr()
                                      : 'paywall_usual_title'.tr(),
                                  style: context.text.title.copyWith(
                                    color: context.color.title,
                                  ),
                                ),
                                if (state.document != null) ...[
                                  TextRow(
                                    text: 'limits_description'.tr(),
                                    style: context.text.subtitle.copyWith(
                                      color: context.color.subtitle,
                                    ),
                                  ),
                                ],
                                NoPaymantBox(
                                  title: state.isSelectedProductWithTrial
                                      ? 'no_payment_today'
                                      : 'secure_payment',
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Expanded(child: PaywallCarusel()),
                          SizedBox(height: 15.h),
                          Padding(
                            padding: styleData.pagePadding,
                            child: Column(
                              spacing: 15.h,
                              children: [
                                ProductButton(
                                  title:
                                      state.isTotalType &&
                                          state
                                                  .placement
                                                  ?.weekProduct
                                                  ?.withTrial ==
                                              true
                                      ? "three_day_free_trial".tr()
                                      : 'week'.tr(),
                                  subtitle:
                                      state.isTotalType &&
                                          state
                                                  .placement
                                                  ?.weekProduct
                                                  ?.withTrial ==
                                              true
                                      ? "then_week_price".tr(
                                          args: [
                                            state
                                                    .placement
                                                    ?.weekProduct
                                                    ?.priceLocalized ??
                                                "",
                                          ],
                                        )
                                      : 'cancel_anytime'.tr(),
                                  price: state.isTotalType
                                      ? state
                                                .placement
                                                ?.weekProduct
                                                ?.zeroPriceLocalized ??
                                            ""
                                      : state
                                            .placement
                                            ?.weekProduct
                                            ?.priceLocalized,
                                  isSelected: state.isWeekSelected,
                                  onTap: () => cubit.purchaseProduct(
                                    state.placement?.weekProduct,
                                    context,
                                  ),
                                  label:
                                      state.isTotalType ||
                                          state
                                                  .placement
                                                  ?.weekProduct
                                                  ?.withTrial ==
                                              false
                                      ? "popular_label".tr()
                                      : "three_days_free_label".tr(),
                                ),
                                ProductButton(
                                  title: 'year'.tr(),
                                  subtitle: 'best_value'.tr(),
                                  price: state
                                      .placement
                                      ?.yearProduct
                                      ?.priceLocalized,
                                  originalPrice:
                                      state
                                          .placement
                                          ?.yearProduct
                                          ?.originalPriceLocalized ??
                                      "",
                                  isSelected: state.isYearSelected,
                                  onTap: () => cubit.purchaseProduct(
                                    state.placement?.yearProduct,
                                    context,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 15.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30.w),
                            child:
                                state.isTotalType &&
                                    state.placement?.weekProduct?.withTrial ==
                                        true
                                ? TotalRow(
                                    localizedPrice:
                                        state.selectedProduct ==
                                            state.placement?.weekProduct
                                        ? state
                                                  .placement
                                                  ?.weekProduct
                                                  ?.zeroPriceLocalized ??
                                              ""
                                        : state
                                                  .placement
                                                  ?.yearProduct
                                                  ?.priceLocalized ??
                                              '',
                                  )
                                : SwitchRow(
                                    value:
                                        state.placement?.weekProduct ==
                                        state.selectedProduct,
                                    onChanged: (bool value) {
                                      // AppConst.triggerHaptic();//TODO
                                      cubit.selectProduct(
                                        value
                                            ? state.placement?.weekProduct
                                            : state.placement?.yearProduct,
                                      );
                                    },
                                  ),
                          ),
                          SizedBox(height: 15.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: MainButton(
                              onTap: () => cubit.purchaseProduct(
                                state.selectedProduct,
                                context,
                              ),
                              title: state.isSelectedProductWithTrial
                                  ? 'start_free_trial'.tr()
                                  : 'continue'.tr(),
                            ),
                          ),
                          // Padding(
                          //   padding: EdgeInsets.symmetric(horizontal: 16.w),
                          //   child: FooterLinks(
                          //     onTerms: () => cubit.launchUrl(AppConst.termsUrl),
                          //     onPrivacy: () => cubit.launchUrl(AppConst.privacyUrl),
                          //     onRestore: () => cubit.restorePurchases(context),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Padding(
                    padding: styleData.pagePadding,
                    child: Text(
                      "paywall_info".tr(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: font(FontWeight.w400),

                        fontSize: 11,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  RestoreRow(
                    onTerms: () => cubit.launchUrl(AppConst.termsUrl),
                    onPrivacy: () => cubit.launchUrl(AppConst.privacyUrl),
                    onRestore: () => cubit.restorePurchases(context),
                  ),
                  SizedBox(
                    height: 11.h + MediaQuery.of(context).padding.bottom,
                  ),
                ],
              ),
            ),
            CloseButtonWidget(onClose: cubit.closePaywall),
          ],
        );
      },
    );
  }
}
