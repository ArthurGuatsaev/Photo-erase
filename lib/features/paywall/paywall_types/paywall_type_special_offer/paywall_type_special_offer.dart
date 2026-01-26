import 'package:easy_localization/easy_localization.dart';
import 'package:erasica/core/theme/text/texts.dart';
import 'package:erasica/features/paywall/cubits/paywall/paywall_cubit.dart';
import 'package:erasica/features/paywall/widgets/paywall_shape.dart';
import 'package:erasica/features/widgets/buttons/main_button.dart';
import 'package:erasica/features/widgets/text/color_text_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../services/payments/extensions.dart';
import '../../cubits/paying/paying_cubit.dart';
import '../../widgets/offer_line.dart';
import 'widgets/special_carusel.dart';

class PaywallTypeSpecialOffer extends StatelessWidget {
  const PaywallTypeSpecialOffer({super.key, required this.paywallState});
  final PaywallSpecialState paywallState;
  @override
  Widget build(BuildContext context) {
    final halfYear = paywallState.productHalfYear;
    final paywallCubit = context.read<PayingCubit>();
    return BlocBuilder<PayingCubit, PayingState>(
      builder: (context, state) {
        return PaywallShape(
          children: [
            SizedBox(height: 40.h),
            OfferLine(),
            SizedBox(height: 20.h),
            Expanded(child: SpecialCarusel()),
            SizedBox(height: 20.h),
            Padding(
              padding: context.appWidget.data.pagePadding,
              child: Column(
                children: [
                  TextColorGenerator(
                    source: "paywall_special_title".tr(),
                    style: context.text.title,
                    colorStyle: context.text.title.copyWith(
                      color: context.color.paywallPrimary,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  TextColorGenerator(
                    source: "paywall_special_price_per_day".tr(
                      args: [halfYear.product.perDayLocalized ?? ""],
                    ),
                    style: TextStyle(
                      fontFamily: font(FontWeight.w500),
                      fontSize: 15,
                      color: context.color.title,
                    ),
                    colorStyle: TextStyle(
                      fontFamily: font(FontWeight.w500),
                      fontSize: 15,
                      color: context.color.paywallPrimary,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  TextColorGenerator(
                    source: "paywall_special_price".tr(
                      args: [halfYear.originPrice ?? "", halfYear.price ?? ""],
                    ),
                    style: context.text.subtitle.copyWith(
                      color: context.color.subtitle,
                    ),
                    colorStyle: context.text.subtitle.copyWith(
                      color: context.color.subtitleDark,
                    ),
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
        );
      },
    );
  }
}
