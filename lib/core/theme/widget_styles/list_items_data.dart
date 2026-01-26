import 'package:flutter/material.dart';

class ListItemsData {
  final int crossAxisCount;
  final double childAspectRatio;
  final double crossAxisSpacing;
  final double mainAxisSpacing;
  final Axis scrollDirrection;
  final double? horizontalBoxAspect;
  ListItemsData({
    required this.crossAxisCount,
    required this.childAspectRatio,
    required this.crossAxisSpacing,
    required this.mainAxisSpacing,
    this.scrollDirrection = Axis.vertical,
    this.horizontalBoxAspect,
  });

  bool get isHorizontal => scrollDirrection == Axis.horizontal;
}

class ListItemsExtension extends ThemeExtension<ListItemsExtension> {
  final ListItemsData historyPhotoItemsData;
  final ListItemsData galleryPhotoItemsData;
  final ListItemsData mainPhotoItemsData;

  const ListItemsExtension({
    required this.historyPhotoItemsData,
    required this.galleryPhotoItemsData,
    required this.mainPhotoItemsData,
  });

  @override
  ThemeExtension<ListItemsExtension> copyWith() {
    return this;
  }

  @override
  ThemeExtension<ListItemsExtension> lerp(
    covariant ThemeExtension<ListItemsExtension>? other,
    double t,
  ) {
    return ListItemsExtension(
      historyPhotoItemsData: historyPhotoItemsData,
      galleryPhotoItemsData: galleryPhotoItemsData,
      mainPhotoItemsData: mainPhotoItemsData,
    );
  }
}
