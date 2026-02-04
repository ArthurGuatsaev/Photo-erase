import 'package:erasica/core/const/assets_path.dart';
import 'package:erasica/features/paywall/cubits/paywall/paywall_cubit.dart';
import 'package:erasica/features/paywall/paywall_types/paywall_type_tunnel/widgets/timeline/timeline_main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/di.dart';
import '../../../../core/theme/app_theme.dart';
import '../../cubits/paying/paying_cubit.dart';
import '../../widgets/paywall_shape.dart';
import 'widgets/steps/tunnel_cubit/paywall_type_tunnel_cubit.dart';
import 'widgets/steps/tunnel_steps.dart';
import 'widgets/timeline/tunnel_timeline.dart';
import 'widgets/steps/tunnel_main_button.dart';

class PaywallTypeTunnel extends StatefulWidget {
  const PaywallTypeTunnel({
    super.key,
    this.onlyTimeline = false,
    required this.paywallState,
  });

  final bool onlyTimeline;
  final PaywallTunnelState paywallState;
  @override
  State<PaywallTypeTunnel> createState() => _PaywallTypeTunnelState();
}

class _PaywallTypeTunnelState extends State<PaywallTypeTunnel> {
  late PageController _stepsPageController;
  late PageController _mainPageController;

  @override
  void initState() {
    super.initState();
    context.read<PayingCubit>().selectProduct(
      widget.paywallState.productYearOption.product,
    );
    _stepsPageController = PageController();
    _mainPageController = PageController();
  }

  @override
  void dispose() {
    _stepsPageController.dispose();
    _mainPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final styleData = context.appWidget.data;
    final tunnelCubit = getIt<PaywallTypeTunnelCubit>(
      param1: widget.onlyTimeline,
    );
    return BlocProvider(
      create: (context) => tunnelCubit,
      child: BlocConsumer<PaywallTypeTunnelCubit, PaywallTypeTunnelState>(
        listenWhen: (prev, next) =>
            prev.currentPageIndex != next.currentPageIndex,
        listener: (context, state) {
          if (_stepsPageController.hasClients) {
            _stepsPageController.nextPage(
              duration: styleData.animationDuration,
              curve: styleData.curve,
            );
          }
          if (state.currentPageIndex == PaywallTypeTunnelCubit.lastStepIndex &&
              _mainPageController.hasClients) {
            _mainPageController.nextPage(
              duration: styleData.animationDuration,
              curve: styleData.curve,
            );
          }
        },
        builder: (context, state) {
          final isLastStep =
              state.currentPageIndex == PaywallTypeTunnelCubit.lastStepIndex;
          return Stack(
            fit: StackFit.expand,
            children: [
              if (!isLastStep)
                Positioned(
                  top: 10 + styleData.statusBarHeight,
                  left: 0,
                  right: 0,
                  child: Image.asset(AssetsPath.starsBg, fit: BoxFit.contain),
                ),
              PaywallShape(
                withoutClose: true,
                needNotNow: isLastStep,

                withoutBottom: !isLastStep,
                children: [
                  Expanded(
                    child: PageView(
                      physics: NeverScrollableScrollPhysics(),
                      controller: _mainPageController,
                      children: [
                        if (!state.onlyTimeline)
                          TunnelSteps(
                            stepsPageController: _stepsPageController,
                            pageIndex: state.currentPageIndex,
                          ),
                        TunnelTimeline(
                          year: widget.paywallState.productYearTimelineOption,
                        ),
                      ],
                    ),
                  ),

                  state.isLast
                      ? TimelineMainButton(
                          product: widget.paywallState.productYearOption,
                        )
                      : TunnelMainButton(
                          product: widget.paywallState.productYearOption,
                          state: state,
                        ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
