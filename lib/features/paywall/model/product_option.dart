// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductOption {
  final String title;
  final String subtitle;
  final String? originPrice;
  final String price;
  const ProductOption({
    required this.title,
    required this.subtitle,
    this.originPrice,
    required this.price,
  });
}
