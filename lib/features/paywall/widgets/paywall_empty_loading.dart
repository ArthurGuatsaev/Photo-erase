import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/buttons/leading_button.dart';
import '../../widgets/loading/loading_adaptive.dart';
import '../cubits/paying/paying_cubit.dart';

class PaywallEmptyLoading extends StatefulWidget {
  const PaywallEmptyLoading({super.key});

  @override
  State<PaywallEmptyLoading> createState() => _PaywallEmptyLoadingState();
}

class _PaywallEmptyLoadingState extends State<PaywallEmptyLoading> {
  bool showedBack = false;
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) setState(() => showedBack = true);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (showedBack)
          SafeArea(
            child: LeadingBtn(
              icon: CupertinoIcons.chevron_back,
              onTap: context.read<PayingCubit>().closePaywall,
            ),
          ),
        const AdaptiveLoading(),
      ],
    );
  }
}
