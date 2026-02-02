// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class GlassData {
  final bool? isCircle;
  final double lightIntensity;
  final double? lightAngle;
  final bool fake;
  final double bcgOpacity;
  final double ambientStrength;
  GlassData({
    this.isCircle,
    this.lightIntensity = 0.5,
    this.lightAngle,
    this.fake = false,
    this.bcgOpacity = 0.1,
    this.ambientStrength = 0.5,
  });

  GlassData copyWith({
    bool? isCircle,
    double? lightIntensity,
    double? lightAngle,
    bool? fake,
    double? bcgOpacity,
    double? ambientStrength,
  }) {
    return GlassData(
      isCircle: isCircle ?? this.isCircle,
      lightIntensity: lightIntensity ?? this.lightIntensity,
      lightAngle: lightAngle ?? this.lightAngle,
      fake: fake ?? this.fake,
      bcgOpacity: bcgOpacity ?? this.bcgOpacity,
      ambientStrength: ambientStrength ?? this.ambientStrength,
    );
  }
}

class GlassDataExtension extends ThemeExtension<GlassDataExtension> {
  final GlassData mainButton;
  final GlassData box;
  final GlassData circle;

  const GlassDataExtension({
    required this.mainButton,
    required this.box,
    required this.circle,
  });

  @override
  ThemeExtension<GlassDataExtension> copyWith() {
    return this;
  }

  @override
  ThemeExtension<GlassDataExtension> lerp(
    covariant ThemeExtension<GlassDataExtension>? other,
    double t,
  ) {
    return GlassDataExtension(mainButton: mainButton, box: box, circle: circle);
  }
}
