import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/const/const.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/theme/text/texts.dart';
import '../../widgets/text/text_row.dart';
import '../cubits/paying/paying_cubit.dart';
import 'restore_row.dart';

class PaywallBottomModule extends StatelessWidget {
  const PaywallBottomModule({super.key});

  @override
  Widget build(BuildContext context) {
    final paywallCubit = context.read<PayingCubit>();
    return Column(
      children: [
        TextRow(
          text: "paywall_info",
          lines: 7,
          style: TextStyle(
            fontFamily: font(FontWeight.w400),
            color: context.color.subtitleDark,
            fontSize: 11,
          ),
        ),
        const SizedBox(height: 20),
        RestoreRow(
          onTerms: () => paywallCubit.launchUrl(AppConst.termsUrl),
          onPrivacy: () => paywallCubit.launchUrl(AppConst.privacyUrl),
          onRestore: () => paywallCubit.restorePurchases(),
        ),
      ],
    );
  }
}
