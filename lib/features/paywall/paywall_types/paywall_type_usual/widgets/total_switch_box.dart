import 'package:erasica/core/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/const/const.dart';
import '../../../cubits/paying/paying_cubit.dart';
import '../../../cubits/paywall/paywall_cubit.dart';
import '../../../model/product_option.dart';
import '../../../widgets/total_row.dart';
import 'switch_row.dart';

class TotalSwitchBox extends StatelessWidget {
  const TotalSwitchBox({
    super.key,
    required this.week,
    required this.year,
    required this.paywallState,
  });
  final PaywallState paywallState;
  final ProductOption week;
  final ProductOption year;
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PayingCubit>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: context.appWidget.data.buttonMaxWidth,
        ),
        child: BlocBuilder<PayingCubit, PayingState>(
          builder: (context, state) {
            final selectedProduct = state.selectedProduct;
            if (paywallState is PaywallUsualSwitchState ||
                paywallState is PaywallPersonalSwitchState) {
              return SwitchRow(
                value: week.product == selectedProduct,
                onChanged: (bool value) {
                  AppConst.triggerHaptic();
                  cubit.selectProduct(value ? week.product : year.product);
                },
              );
            }
            if (paywallState is PaywallUsualTotalState ||
                paywallState is PaywallPersonalTotalState) {
              return TotalRow(
                localizedPrice: week.product == selectedProduct
                    ? week.price ?? ''
                    : year.price ?? '',
              );
            }
            return SwitchRow(
              value: week.product == selectedProduct,
              onChanged: (bool value) {
                AppConst.triggerHaptic();
                cubit.selectProduct(value ? week.product : year.product);
              },
            );
          },
        ),
      ),
    );
  }
}
