import 'package:erasica/features/paywall/cubits/paying/paying_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/no_paymant_box.dart';

class NoPaymantUsual extends StatelessWidget {
  const NoPaymantUsual({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: BlocBuilder<PayingCubit, PayingState>(
        buildWhen: (prev, cur) => prev.selectedProduct != cur.selectedProduct,
        builder: (context, state) {
          final withTrial = state.isSelectedProductWithTrial;
          return NoPaymantBox(
            title: withTrial ? 'no_payment_trial' : 'no_payment_no_trial',
          );
        },
      ),
    );
  }
}
