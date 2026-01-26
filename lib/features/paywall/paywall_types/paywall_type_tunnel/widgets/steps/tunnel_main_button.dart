import 'package:erasica/core/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../widgets/buttons/main_button.dart';
import '../../../../model/product_option.dart';
import 'tunnel_cubit/paywall_type_tunnel_cubit.dart';

class TunnelMainButton extends StatelessWidget {
  const TunnelMainButton({
    super.key,
    required this.state,
    required this.product,
  });

  final PaywallTypeTunnelState state;
  final ProductOption product;
  @override
  Widget build(BuildContext context) {
    final styleData = context.appWidget.data;
    final cubit = context.read<PaywallTypeTunnelCubit>();
    return Padding(
      padding: styleData.pagePadding,
      child: MainButton(
        onTap: cubit.next,
        title: state.currentPageIndex == 0 ? "claim_button" : "continue",
      ),
    );
  }
}
