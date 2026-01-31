import 'package:flutter/material.dart';
import '../../../cubits/paywall/paywall_cubit.dart';
import '../../../widgets/paywall_carusel.dart';
import 'personal_photo.dart';

class PaywallUsualContent extends StatelessWidget {
  const PaywallUsualContent({super.key, required this.state});

  final PaywallUsual state;

  @override
  Widget build(BuildContext context) {
    if (state case PaywallPersonalSwitchState persState) {
      return Expanded(child: PersonalPhoto(photo: persState.photo));
    }
    if (state case PaywallPersonalTotalState persState) {
      return Expanded(child: PersonalPhoto(photo: persState.photo));
    }
    return Expanded(child: PaywallCarusel());
  }
}
