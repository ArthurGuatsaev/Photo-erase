import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../widgets/buttons/main_button.dart';
import '../../../cubits/paying/paying_cubit.dart';

class PaywallMainButton extends StatelessWidget {
  const PaywallMainButton({super.key, required this.cubit});

  final PayingCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: BlocBuilder<PayingCubit, PayingState>(
        buildWhen: (prev, cur) => prev.selectedProduct != cur.selectedProduct,
        builder: (context, state) {
          return MainButton(
            onTap: () => cubit.purchaseProduct(),
            title: state.isSelectedProductWithTrial
                ? 'start_free_trial'.tr()
                : 'continue'.tr(),
          );
        },
      ),
    );
  }
}
