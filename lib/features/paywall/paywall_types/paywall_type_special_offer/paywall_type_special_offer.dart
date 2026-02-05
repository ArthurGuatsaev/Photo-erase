import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/text/texts.dart';
import '../../../../services/payments/extensions.dart';
import '../../../widgets/buttons/main_button.dart';
import '../../../widgets/text/color_text_generator.dart';
import '../../cubits/paying/paying_cubit.dart';
import '../../cubits/paywall/paywall_cubit.dart';
import '../../widgets/offer_line.dart';
import '../../widgets/paywall_carusel.dart';
import '../../widgets/paywall_shape.dart';

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
            const SizedBox(height: 40),
            const OfferLine(),
            const SizedBox(height: 20),
            const Expanded(child: PaywallCarusel()),
            const SizedBox(height: 20),
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
                  const SizedBox(height: 12),
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
                  const SizedBox(height: 6),
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
            const SizedBox(height: 25),
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
