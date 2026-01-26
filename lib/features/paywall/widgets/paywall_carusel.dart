import 'package:erasica/features/widgets/sliders/carusel/carusel.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/const/assets_path.dart';
import 'paywall_benefit_item.dart';

class PaywallCarusel extends StatelessWidget {
  const PaywallCarusel({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCarusel(
      items: [
        for (var i = 0; i < 4; i++)
          PaywallBenefitItem(
            imageAsset: AssetsPath.error,
            iconAsset: AssetsPath.error,
            title: 'paywall_benefit_${i}_title',
            subtitle: 'paywall_benefit_${i}_description',
          ),
      ],
    );
  }
}
