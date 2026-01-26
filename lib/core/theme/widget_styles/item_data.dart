import 'package:flutter/material.dart';

class ItemData {
  final double borderRadius;

  ItemData({required this.borderRadius});
}

class ItemDataExtension extends ThemeExtension<ItemDataExtension> {
  final ItemData historyPhotoItemData;
  final ItemData mainPhotoItemData;
  final ItemData galleryPhotoItemData;

  const ItemDataExtension({
    required this.historyPhotoItemData,
    required this.galleryPhotoItemData,
    required this.mainPhotoItemData,
  });

  @override
  ThemeExtension<ItemDataExtension> copyWith() {
    return this;
  }

  @override
  ThemeExtension<ItemDataExtension> lerp(
    covariant ThemeExtension<ItemDataExtension>? other,
    double t,
  ) {
    return ItemDataExtension(
      historyPhotoItemData: historyPhotoItemData,
      galleryPhotoItemData: galleryPhotoItemData,
      mainPhotoItemData: mainPhotoItemData,
    );
  }
}
