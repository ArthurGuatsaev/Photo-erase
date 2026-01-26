import 'package:easy_localization/easy_localization.dart';
import 'package:erasica/features/widgets/text/text_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/app_theme.dart';
import '../../../core/theme/text/texts.dart';
import '../../paywall/paywall_cubit.dart';
import '../paywall_types/paywall_type_usual/widgets/restore_row.dart';

class PaywallBottomModule extends StatelessWidget {
  const PaywallBottomModule({super.key});

  @override
  Widget build(BuildContext context) {
    final paywallCubit = context.read<PaywallCubit>();
    return Column(
      children: [
        Padding(
          padding: context.pagePadding.data.pagePadding,
          child: TextRow(
            text: "paywall_info",
            lines: 7,
            style: TextStyle(
              fontFamily: font(FontWeight.w400),
              color: context.color.subtitleDark,
              fontSize: 11.sp,
            ),
          ),
        ),
        SizedBox(height: 20.h),
        RestoreRow(
          onTerms: () => paywallCubit.launchUrl('AppConst.termsUrl'),
          onPrivacy: () => paywallCubit.launchUrl('AppConst.privacyUrl'),
          onRestore: () => paywallCubit.restorePurchases(context),
        ),
      ],
    );
  }
}
