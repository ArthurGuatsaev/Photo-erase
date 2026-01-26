import 'dart:io';
import 'package:erasica/entities/photo/photo.dart';
import 'package:flutter/cupertino.dart';
import '../../../core/const/assets_path.dart';
import '../../widgets/sliders/carusel/carusel.dart';
import 'paywall_benefit_item.dart';

class PaywallCarusel extends StatelessWidget {
  const PaywallCarusel({super.key, this.photo});
  final Photo? photo;
  @override
  Widget build(BuildContext context) {
    if (photo != null) {
      return Image.file(File(photo!.photoPath), fit: BoxFit.cover);
    }
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
