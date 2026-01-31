import 'package:flutter/cupertino.dart';
import '../../../../../core/const/assets_path.dart';
import '../../../../widgets/sliders/carusel/carusel.dart';
import '../../../widgets/carusel_items/carusel_erase.dart';
import '../../../widgets/carusel_items/carusel_multy_photo.dart';
import '../../../widgets/carusel_items/carusel_photo.dart';
import '../../../widgets/carusel_items/carusel_quality.dart';
import '../../../widgets/carusel_items/paywall_benefit_item.dart';

class SpecialCarusel extends StatelessWidget {
  const SpecialCarusel({super.key});
  @override
  Widget build(BuildContext context) {
    return AppCarusel(
      items: [
        PaywallBenefitItem(
          title: 'paywall_benefit_0_title',
          subtitle: 'paywall_benefit_0_description',
          child: PaywallUsualCaruselPhoto(
            imagePath: AssetsPath.paywallRemoveObj,
          ),
        ),
        PaywallBenefitItem(
          title: 'paywall_benefit_1_title',
          subtitle: 'paywall_benefit_1_description',
          child: CaruselErasePhotoBox(),
        ),
        PaywallBenefitItem(
          title: 'paywall_benefit_2_title',
          subtitle: 'paywall_benefit_2_description',
          child: QualityPhotoBox(imagePath: AssetsPath.paywallQuality),
        ),
        PaywallBenefitItem(
          title: 'paywall_benefit_2_title',
          subtitle: 'paywall_benefit_2_description',
          child: MultyPhotoBox(),
        ),
      ],
    );
  }
}
