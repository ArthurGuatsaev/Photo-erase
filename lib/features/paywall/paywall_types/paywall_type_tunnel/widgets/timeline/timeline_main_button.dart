import 'package:erasica/core/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../widgets/buttons/main_button.dart';
import '../../../../cubits/paying/paying_cubit.dart';
import '../../../../model/product_option.dart';

class TimelineMainButton extends StatelessWidget {
  const TimelineMainButton({super.key, required this.product});

  final ProductOption product;
  @override
  Widget build(BuildContext context) {
    final styleData = context.appWidget.data;
    return Padding(
      padding: styleData.pagePadding,
      child: MainButton(
        onTap: () {
          context.read<PayingCubit>().purchaseProduct(product.product);
        },
        title: "start_free_trial",
      ),
    );
  }
}
