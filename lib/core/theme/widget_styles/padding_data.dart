import 'package:flutter/material.dart';

class PaddingData {
  final EdgeInsets pagePadding;
  final Duration animationDuration;
  final Curve curve;
  final double statusBarHeight;
  final double bottomOffset;
  PaddingData({
    required this.pagePadding,
    required this.animationDuration,
    required this.curve,
    this.statusBarHeight = 40,
    required this.bottomOffset,
  });
}

class PaddingDataExtension extends ThemeExtension<PaddingDataExtension> {
  final PaddingData data;

  const PaddingDataExtension({required this.data});

  @override
  ThemeExtension<PaddingDataExtension> copyWith() {
    return this;
  }

  @override
  ThemeExtension<PaddingDataExtension> lerp(
    covariant ThemeExtension<PaddingDataExtension>? other,
    double t,
  ) {
    return PaddingDataExtension(data: data);
  }
}
