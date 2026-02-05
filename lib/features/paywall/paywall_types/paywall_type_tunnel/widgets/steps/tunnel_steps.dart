import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/theme/app_theme.dart';
import '../../../../../widgets/text/color_text_generator.dart';
import '../../../../../widgets/text/text_row.dart';
import 'tunnel_step_0.dart';
import 'tunnel_step_1.dart';
import 'tunnel_step_2.dart';

class TunnelSteps extends StatelessWidget {
  const TunnelSteps({
    super.key,
    required PageController stepsPageController,
    required this.pageIndex,
  }) : _stepsPageController = stepsPageController;

  final PageController _stepsPageController;
  final int pageIndex;
  @override
  Widget build(BuildContext context) {
    final styleData = context.appWidget.data;
    return Column(
      children: [
        Expanded(
          child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _stepsPageController,
            children: const [TunnelStep0(), TunnelStep1(), TunnelStep2()],
          ),
        ),
        const SizedBox(height: 20),
        Container(
          constraints: const BoxConstraints(minHeight: 116),
          padding: styleData.pagePadding,
          child: Column(
            children: [
              TextRow(
                text: "paywall_tunnel_${pageIndex}_title".tr(),
                style: context.text.title.copyWith(color: context.color.title),
              ),
              const SizedBox(height: 8),
              TextColorGenerator(
                source: "paywall_tunnel_${pageIndex}_text".tr(),
                style: context.text.subtitle.copyWith(
                  color: context.color.subtitle,
                ),

                colorStyle: context.text.subtitle.copyWith(
                  color: context.color.paywallPrimary,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
