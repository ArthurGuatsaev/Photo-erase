import 'package:easy_localization/easy_localization.dart';
import 'package:erasica/features/widgets/text/color_text_generator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/theme/app_theme.dart';
import '../../../../../../core/theme/text/texts.dart';
import '../../../../../../services/payments/extensions.dart';
import '../../../../paywall_cubit.dart';
import 'day_stepper.dart';
import 'tunnel_no_paymant_box.dart';

class TunnelTimeline extends StatelessWidget {
  const TunnelTimeline({super.key});

  @override
  Widget build(BuildContext context) {
    final styleData = context.pagePadding.data;
    return BlocBuilder<PaywallCubit, PaywallState>(
      buildWhen: (prev, next) => prev.placement != next.placement,
      builder: (context, state) {
        return Padding(
          padding: styleData.pagePadding,
          child: Column(
            children: [
              SizedBox(height: 30.h),
              TextColorGenerator(
                source: "paywall_tunnel_title".tr(),
                style: context.text.title.copyWith(color: context.color.title),
                colorStyle: context.text.title.copyWith(
                  color: context.color.paywallPrimary,
                ),
              ),
              SizedBox(height: 20.h),
              Expanded(
                child: DayStepper(
                  price: state.placement?.yearProduct?.priceLocalized ?? "",
                ),
              ),
              SizedBox(height: 20.h),
              TunnelNoPaymantBox(state: state),
              SizedBox(height: 30.h),
              TextColorGenerator(
                source: "paywall_tunnel_free".tr(),
                style: TextStyle(
                  fontFamily: font(FontWeight.w500),
                  fontSize: 15.sp,
                ),
                colorStyle: TextStyle(
                  fontFamily: font(FontWeight.w500),
                  fontSize: 15.sp,
                  color: context.color.paywallPrimary,
                ),
              ),
              SizedBox(height: 8.h),
              TextColorGenerator(
                source: "paywall_tunnel_then".tr(
                  args: [
                    state.placement?.yearProduct?.originalPrice.toString() ??
                        "",
                    state.placement?.yearProduct?.priceLocalized ?? "",
                  ],
                ),
                style: context.text.subtitle.copyWith(
                  color: context.color.subtitle,
                ),
                colorStyle: context.text.subtitle.copyWith(
                  color: context.color.subtitle.withValues(alpha: 0.4),
                  decoration: TextDecoration.lineThrough,
                  decorationColor: context.color.subtitle.withValues(
                    alpha: 0.4,
                  ),
                ),
              ),
              SizedBox(height: 23.h),
            ],
          ),
        );
      },
    );
  }
}
