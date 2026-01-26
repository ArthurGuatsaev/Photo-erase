import 'package:flutter/material.dart';
import 'package:liquid_glass_renderer/liquid_glass_renderer.dart';

class GlassWrapper extends StatelessWidget {
  const GlassWrapper({
    super.key,
    required this.child,
    this.isCircle,
    this.borderRadius,
    this.lightIntensity,
    this.lightAngle,
  });
  final Widget child;
  final bool? isCircle;
  final double? borderRadius;
  final double? lightIntensity;
  final double? lightAngle;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Builder(
          builder: (context) {
            if (isCircle == true) {
              return LiquidGlassLayer(
                settings: LiquidGlassSettings(
                  blur: 10,
                  visibility: 0.9,
                  thickness: 24,
                  lightAngle: lightAngle ?? 1.07,
                  saturation: 1.4,
                  lightIntensity: lightIntensity ?? 0.5,
                ),
                child: LiquidGlass(
                  shape: LiquidOval(),
                  child: Opacity(opacity: 0, child: child),
                ),
              );
            }
            return LiquidGlassLayer(
              settings: LiquidGlassSettings(
                blur: 10,
                visibility: 0.9,
                lightIntensity: lightIntensity ?? 0.5,
                saturation: 1,
                lightAngle: lightAngle ?? 1.07,
                thickness: 20,
              ),
              child: LiquidGlass(
                shape: LiquidRoundedSuperellipse(
                  borderRadius: borderRadius ?? 0,
                ),
                child: Opacity(opacity: 0, child: child),
              ),
            );
          },
        ),
        child,
      ],
    );
  }
}
