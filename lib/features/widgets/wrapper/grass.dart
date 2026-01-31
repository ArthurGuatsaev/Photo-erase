import 'dart:math';

import 'package:flutter/material.dart';
import 'package:liquid_glass_renderer/liquid_glass_renderer.dart';

class GlassWrapper extends StatelessWidget {
  const GlassWrapper({
    super.key,
    required this.child,
    this.isCircle,
    this.borderRadius,
    this.lightIntensity = 0.5,
    this.lightAngle,
    this.fake = false,
    this.bcgOpacity = 0.1,
    this.ambientStrength = 0.5,
  });
  final Widget child;
  final bool? isCircle;
  final double? borderRadius;
  final double lightIntensity;
  final double? lightAngle;

  final bool fake;
  final double bcgOpacity;
  final double ambientStrength;
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        if (isCircle == true) {
          return LiquidGlassLayer(
            settings: LiquidGlassSettings(
              blur: 10,
              visibility: 0.9,
              thickness: 24,
              lightAngle: lightAngle ?? 1.07,
              saturation: 1.4,
              lightIntensity: lightIntensity,
            ),
            child: LiquidGlass(shape: LiquidOval(), child: child),
          );
        }
        return LiquidGlassLayer(
          // На Android выключаем, тк могут слабые устройства
          // fake: Platform.isAndroid ? true : fake,
          settings: LiquidGlassSettings(
            glassColor: Color.fromRGBO(255, 255, 255, bcgOpacity),
            thickness: 20,
            blur: 5,
            chromaticAberration: 0.1,
            lightAngle: 0.5 * pi,
            lightIntensity: lightIntensity,
            ambientStrength: 0.7,
            refractiveIndex: 1.2,
            saturation: 1.5,
          ),
          child: LiquidGlass(
            shape: LiquidRoundedSuperellipse(borderRadius: borderRadius ?? 0),
            child: child,
          ),
        );
      },
    );
  }
}
