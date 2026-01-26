import 'package:flutter/cupertino.dart';
import '../../../../../core/const/assets_path.dart';
import '../../../../widgets/sliders/carusel/carusel.dart';
import '../../../widgets/paywall_benefit_item.dart';

class SpecialCarusel extends StatelessWidget {
  const SpecialCarusel({super.key});
  @override
  Widget build(BuildContext context) {
    return AppCarusel(
      items: [
        PaywallBenefitItem(
          imageAsset: AssetsPath.error,
          iconAsset: AssetsPath.error,
          padding: const EdgeInsets.symmetric(horizontal: 35),
          title: 'paywall_benefit_0_title',
          subtitle: 'paywall_benefit_0_description',
        ),
        PaywallBenefitItem(
          imageAsset: AssetsPath.error,
          iconAsset: AssetsPath.error,
          padding: const EdgeInsets.symmetric(horizontal: 35),

          title: 'paywall_benefit_1_title',
          subtitle: 'paywall_benefit_1_description',
        ),
        PaywallBenefitItem(
          imageAsset: AssetsPath.error,
          iconAsset: AssetsPath.error,
          padding: const EdgeInsets.symmetric(horizontal: 35),

          title: 'paywall_benefit_2_title',
          subtitle: 'paywall_benefit_2_description',
        ),
        PaywallBenefitItem(
          imageAsset: AssetsPath.error,
          iconAsset: AssetsPath.error,
          title: 'paywall_benefit_3_title',
          subtitle: 'paywall_benefit_3_description',
        ),
      ],
    );
  }
}
