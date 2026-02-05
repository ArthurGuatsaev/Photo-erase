import 'package:flutter/cupertino.dart';
import '../../widgets/sliders/carusel/carusel.dart';
import 'carusel_items/carusel_animation.dart';
import 'carusel_items/paywall_benefit_item.dart';

class PaywallCarusel extends StatelessWidget {
  const PaywallCarusel({super.key});
  @override
  Widget build(BuildContext context) {
    return const AppCarusel(
      items: [
        PaywallBenefitItem(
          title: 'paywall_benefit_0_title',
          subtitle: 'paywall_benefit_0_description',
          child: CaruselAnimation(index: 1),
          // child: PaywallUsualCaruselPhoto(
          //   imagePath: AssetsPath.paywallRemoveObj,
          // ),
        ),
        PaywallBenefitItem(
          title: 'paywall_benefit_1_title',
          subtitle: 'paywall_benefit_1_description',
          child: CaruselAnimation(index: 2),
          // child: CaruselErasePhotoBox(),
        ),
        PaywallBenefitItem(
          title: 'paywall_benefit_2_title',
          subtitle: 'paywall_benefit_2_description',
          child: CaruselAnimation(index: 3),

          // child: QualityPhotoBox(imagePath: AssetsPath.paywallQuality),
        ),
        PaywallBenefitItem(
          title: 'paywall_benefit_2_title',
          subtitle: 'paywall_benefit_2_description',
          child: CaruselAnimation(index: 4),

          // child: MultyPhotoBox(),
        ),
      ],
    );
  }
}
