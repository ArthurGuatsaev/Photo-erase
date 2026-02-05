import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../widgets/text/text_row.dart';
import '../../cubits/paying/paying_cubit.dart';
import '../../cubits/paywall/paywall_cubit.dart';
import 'widgets/paywall_main_button.dart';
import '../../widgets/paywall_shape.dart';
import 'widgets/paywall_usual_no_paymant.dart';
import 'widgets/personal_description.dart';
import 'widgets/product_button.dart';
import 'widgets/total_switch_box.dart';
import 'widgets/usual_content.dart';

class PaywallTypeUsual extends StatefulWidget {
  const PaywallTypeUsual({super.key, required this.paywallState});
  final PaywallUsual paywallState;

  @override
  State<PaywallTypeUsual> createState() => _PaywallTypeUsualState();
}

class _PaywallTypeUsualState extends State<PaywallTypeUsual> {
  @override
  void initState() {
    context.read<PayingCubit>().selectProduct(
      widget.paywallState.productWeakOption.product,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final styleData = context.appWidget.data;
    final week = widget.paywallState.productWeakOption;
    final year = widget.paywallState.productYearOption;
    final cubit = context.read<PayingCubit>();
    return PaywallShape(
      children: [
        const SizedBox(height: 30),
        Padding(
          padding: styleData.pagePadding,
          child: Column(
            spacing: 8,
            children: [
              TextRow(
                text: 'paywall_usual_title'.tr(),
                style: context.text.title.copyWith(color: context.color.title),
              ),
              PersonalDescription(state: widget.paywallState),
              const NoPaymantUsual(),
            ],
          ),
        ),
        const SizedBox(height: 8),
        PaywallUsualContent(state: widget.paywallState),
        Padding(
          padding: styleData.pagePadding,
          child: Column(
            spacing: 5,
            children: [
              ProductButton(
                title: week.title,
                subtitle: week.subtitle,
                price: week.price,
                product: week.product,
                label: week.label,
              ),
              ProductButton(
                title: year.title,
                subtitle: year.subtitle,
                price: year.price,
                product: year.product,
                label: year.label,
                originalPrice: year.originPrice,
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        TotalSwitchBox(
          paywallState: widget.paywallState,
          week: week,
          year: year,
        ),
        const SizedBox(height: 15),
        PaywallMainButton(cubit: cubit),
      ],
    );
  }
}
