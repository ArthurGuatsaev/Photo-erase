import 'package:erasica/features/paywall/cubits/paywall/paywall_cubit.dart';
import 'package:erasica/features/paywall/paywall_types/paywall_type_tunnel/widgets/timeline/timeline_main_button.dart';
import 'package:flutter/material.dart';
import '../../widgets/paywall_shape.dart';
import 'widgets/timeline/tunnel_timeline.dart';

class PaywallTypeTimeline extends StatelessWidget {
  const PaywallTypeTimeline({super.key, required this.paywallState});

  final PaywallTimelineState paywallState;
  @override
  Widget build(BuildContext context) {
    return PaywallShape(
      needNotNow: true,
      withoutClose: true,
      children: [
        TunnelTimeline(year: paywallState.year),
        TimelineMainButton(product: paywallState.year),
      ],
    );
  }
}
