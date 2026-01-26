import 'package:easy_localization/easy_localization.dart';
import 'package:erasica/core/const/assets_path.dart';
import 'package:erasica/features/widgets/wrapper/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/di/di.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../widgets/buttons/main_button.dart';
import '../../../widgets/buttons/text_btn.dart';
import '../../paywall_cubit.dart';
import '../../widgets/paywall_bottom_module.dart';
import '../../widgets/paywall_scroll_wrapper.dart';
import 'paywall_type_tunnel_cubit.dart';
import 'widgets/steps/tunnel_steps.dart';
import 'widgets/timeline/tunnel_timeline.dart';

class PaywallTypeTunnel extends StatefulWidget {
  const PaywallTypeTunnel({super.key, this.onlyTimeline = false});

  final bool onlyTimeline;

  @override
  State<PaywallTypeTunnel> createState() => _PaywallTypeTunnelState();
}

class _PaywallTypeTunnelState extends State<PaywallTypeTunnel> {
  /// Переключение шагов
  late PageController _stepsPageController;

  /// Переключение между шагами и timeLine
  late PageController _mainPageController;

  @override
  void initState() {
    super.initState();
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
    final styleData = context.pagePadding.data;
    final paywallCubit = context.read<PaywallCubit>();
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
          final cubit = context.read<PaywallTypeTunnelCubit>();
          return BackgroundWrapper(
            isDefault: true,
            child: Stack(
              fit: StackFit.expand,
              children: [
                if (!isLastStep)
                  Positioned(
                    top: 10.h + styleData.statusBarHeight,
                    left: 0,
                    right: 0,
                    child: Image.asset(AssetsPath.starsBg, fit: BoxFit.contain),
                  ),
                PaywallScrollWrapper(
                  widgets: [
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
                          TunnelTimeline(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: styleData.pagePadding,
                      child: MainButton(
                        onTap: () => cubit.next(context),
                        title: state.currentPageIndex == 0
                            ? "claim_button".tr()
                            : state.currentPageIndex ==
                                  PaywallTypeTunnelCubit.lastStepIndex
                            ? "start_free_trial".tr()
                            : "continue".tr(),
                      ),
                    ),
                  ],

                  bottomChild: isLastStep
                      ? Column(
                          children: [
                            CustomTextButton(
                              color: context.color.subtitleDark,
                              text: "not_now",
                              onTap: paywallCubit.closePaywall,
                            ),
                            SizedBox(height: 12.h),
                            PaywallBottomModule(),
                          ],
                        )
                      : null,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
