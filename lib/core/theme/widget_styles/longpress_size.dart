import 'package:flutter/material.dart';

class LongpressSize {
  final double width;
  final double height;
  LongpressSize({required this.width, required this.height});
}

class LongPressExtension extends ThemeExtension<LongPressExtension> {
  final LongpressSize historyPhotoData;

  const LongPressExtension({required this.historyPhotoData});

  @override
  ThemeExtension<LongPressExtension> copyWith() {
    return this;
  }

  @override
  ThemeExtension<LongPressExtension> lerp(
    covariant ThemeExtension<LongPressExtension>? other,
    double t,
  ) {
    return LongPressExtension(historyPhotoData: historyPhotoData);
  }
}
