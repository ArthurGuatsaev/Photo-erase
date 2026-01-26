import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/app_theme.dart';
import '../../widgets/buttons/text_btn.dart';
import '../cubits/paying/paying_cubit.dart';
import 'close_button.dart';
import 'paywall_bottom_module.dart';

class PaywallShape extends StatelessWidget {
  const PaywallShape({
    super.key,
    required this.children,
    this.needNotNow,
    this.withoutBottom,
    this.withoutClose,
  });
  final List<Widget> children;
  final bool? needNotNow;
  final bool? withoutBottom;
  final bool? withoutClose;
  @override
  Widget build(BuildContext context) {
    final styleData = context.appWidget.data;
    final cubit = context.read<PayingCubit>();
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    final pageHeight =
        MediaQuery.sizeOf(context).height -
        MediaQuery.of(context).padding.bottom -
        styleData.bottomOffset;
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: pageHeight,
                child: SafeArea(
                  bottom: false,
                  child: Column(children: children),
                ),
              ),
              if (withoutBottom != true)
                Padding(
                  padding: styleData.pagePadding.copyWith(
                    bottom: 11.h + bottomPadding,
                    top: 20,
                  ),
                  child: Column(
                    spacing: 10.h,
                    children: [
                      if (needNotNow == true)
                        CustomTextButton(
                          color: context.color.subtitleDark,
                          text: "not_now",
                          onTap: context.read<PayingCubit>().closePaywall,
                        ),
                      PaywallBottomModule(),
                    ],
                  ),
                ),
            ],
          ),
        ),
        if (withoutClose != true)
          CloseButtonWidget(onClose: cubit.closePaywall),
      ],
    );
  }
}
