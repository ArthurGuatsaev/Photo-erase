// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class GlassButtonData {
  final Size size;
  final double lightIntensity;
  final double paddingValue;
  GlassButtonData({
    required this.size,
    required this.lightIntensity,
    required this.paddingValue,
  });
}

class GlassButtonExtension extends ThemeExtension<GlassButtonExtension> {
  final GlassButtonData data;
  final GlassButtonData appbarData;

  const GlassButtonExtension({required this.data, required this.appbarData});

  @override
  ThemeExtension<GlassButtonExtension> copyWith() {
    return this;
  }

  @override
  ThemeExtension<GlassButtonExtension> lerp(
    covariant ThemeExtension<GlassButtonExtension>? other,
    double t,
  ) {
    return GlassButtonExtension(appbarData: appbarData, data: data);
  }
}
