import 'package:flutter/material.dart';
import 'paywall_benefit_item.dart';

class PaywallUsualCaruselPhoto extends StatelessWidget {
  const PaywallUsualCaruselPhoto({super.key, required this.imagePath});
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return CaruselPhotoSize(child: Image.asset(imagePath, fit: BoxFit.cover));
  }
}
