import 'package:auto_route/auto_route.dart';
import 'package:erasica/features/widgets/wrapper/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/di/di.dart';
import '../../services/payments/models/placement_type.dart';
import 'cubits/paying/paying_cubit.dart';
import 'cubits/paywall/paywall_cubit.dart';
import 'paywall_types/paywall_type_special_offer/paywall_type_special_offer.dart';
import 'paywall_types/paywall_type_tunnel/paywall_type_timeline.dart';
import 'paywall_types/paywall_type_tunnel/paywall_type_tunnel.dart';
import 'paywall_types/paywall_type_usual/paywall_usual.dart';
import 'widgets/pay_loading.dart';

@RoutePage()
class PaywallPage extends StatelessWidget {
  const PaywallPage({super.key, required this.placementType});

  final PlacementType placementType;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<PayingCubit>()),
        BlocProvider(
          create: (context) => getIt<PaywallCubit>(param1: placementType),
        ),
      ],
      child: BackgroundWrapper(
        isDefault: true,
        loading: PayLoading(),
        child: Scaffold(
          body: BlocBuilder<PaywallCubit, PaywallState>(
            builder: (context, state) {
              if (state is PaywallUsualSwitchState) {
                return PaywallTypeUsual(paywallState: state);
              }
              if (state is PaywallUsualTotalState) {
                return PaywallTypeUsual(paywallState: state);
              }
              if (state is PaywallPersonalSwitchState) {
                return PaywallTypeUsual(paywallState: state);
              }
              if (state is PaywallPersonalTotalState) {
                return PaywallTypeUsual(paywallState: state);
              }
              if (state is PaywallSpecialState) {
                return PaywallTypeSpecialOffer(paywallState: state);
              }
              if (state is PaywallTunnelState) {
                return PaywallTypeTunnel(paywallState: state);
              }
              if (state is PaywallTimelineState) {
                return PaywallTypeTimeline(paywallState: state);
              }
              return Center(child: CircularProgressIndicator.adaptive());
            },
          ),
        ),
      ),
    );
  }
}
