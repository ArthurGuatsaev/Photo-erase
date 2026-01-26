// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:adapty_flutter/adapty_flutter.dart';

class ProductOption {
  final String title;
  final String subtitle;
  final String? originPrice;
  final String? price;
  final String? label;
  final AdaptyPaywallProduct product;
  const ProductOption({
    required this.title,
    required this.subtitle,
    this.originPrice,
    this.price,
    this.label,
    required this.product,
  });
}
