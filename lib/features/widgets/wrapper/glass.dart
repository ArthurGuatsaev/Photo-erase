import 'dart:math';

import 'package:erasica/core/theme/widget_styles/glass_data.dart';
import 'package:flutter/material.dart';
import 'package:liquid_glass_renderer/liquid_glass_renderer.dart';

class GlassWrapper extends StatelessWidget {
  const GlassWrapper({
    super.key,
    required this.child,
    this.borderRadius,
    required this.data,
  });
  final Widget child;
  final double? borderRadius;
  final GlassData data;
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        if (data.isCircle == true) {
          return LiquidGlassLayer(
            settings: LiquidGlassSettings(
              glassColor: Color.fromRGBO(255, 255, 255, data.bcgOpacity),
              blur: 10,
              visibility: 0.9,
              thickness: 24,
              lightAngle: data.lightAngle ?? 1.07,
              saturation: 1.4,
              lightIntensity: data.lightIntensity,
            ),
            child: LiquidGlass(shape: LiquidOval(), child: child),
          );
        }
        return LiquidGlassLayer(
          // На Android выключаем, тк могут слабые устройства
          // fake: Platform.isAndroid ? true : fake,
          settings: LiquidGlassSettings(
            glassColor: Color.fromRGBO(255, 255, 255, data.bcgOpacity),
            thickness: 20,
            blur: 5,
            chromaticAberration: 0.1,
            lightAngle: data.lightAngle ?? 0.5 * pi,
            lightIntensity: data.lightIntensity,
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
