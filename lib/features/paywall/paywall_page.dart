import 'package:auto_route/auto_route.dart';
import 'package:erasica/features/widgets/wrapper/background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/di/di.dart';
import '../../services/payments/models/paywall_type.dart';
import '../../services/payments/models/placement_type.dart';
import 'paywall_cubit.dart';
import 'paywall_types/paywall_type_special_offer/paywall_type_special_offer.dart';
import 'paywall_types/paywall_type_tunnel/paywall_type_tunnel.dart';
import 'paywall_types/paywall_type_usual/paywall_type_usual.dart';
import 'widgets/pay_loading.dart';

@RoutePage()
class PaywallPage extends StatelessWidget {
  const PaywallPage({super.key, required this.placementType});

  final PlacementType placementType;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<PaywallCubit>(param1: placementType),
      child: BackgroundWrapper(
        isDefault: true,
        loading: PayLoading(),
        child: Scaffold(
          body: BlocBuilder<PaywallCubit, PaywallState>(
            buildWhen: (prev, next) =>
                prev.placement?.paywallType != next.placement?.paywallType ||
                prev.isLoading != next.isLoading,
            builder: (context, state) {
              final paywallType = state.placement?.paywallType;
              if (paywallType == null) {
                return const Center(
                  child: CupertinoActivityIndicator(color: Colors.white),
                );
              }
              switch (paywallType) {
                case PaywallType.usualSwitch:
                case PaywallType.personalSwitch:
                case PaywallType.personalTotal:
                case PaywallType.usualTotal:
                  return const PaywallTypeUsual();
                case PaywallType.tunnel:
                  return const PaywallTypeTunnel();
                case PaywallType.timeline:
                  return const PaywallTypeTunnel(onlyTimeline: true);
                case PaywallType.specialOffer:
                  return const PaywallTypeSpecialOffer();
              }
            },
          ),
        ),
      ),
    );
  }
}
