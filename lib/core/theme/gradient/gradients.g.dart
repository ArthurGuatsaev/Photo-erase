// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gradients.dart';

// **************************************************************************
// ThemeGradientGenerator
// **************************************************************************

class AppGradientsThemeGradients
    extends ThemeExtension<AppGradientsThemeGradients> {
  final Gradient background;
  final Gradient box;
  final Gradient continueBtn;
  final Gradient opacityBg;
  final Gradient thickness;

  const AppGradientsThemeGradients({
    required this.background,
    required this.box,
    required this.continueBtn,
    required this.opacityBg,
    required this.thickness,
  });

  @override
  AppGradientsThemeGradients copyWith({
    Gradient? background,
    Gradient? box,
    Gradient? continueBtn,
    Gradient? opacityBg,
    Gradient? thickness,
  }) {
    return AppGradientsThemeGradients(
      background: background ?? this.background,
      box: box ?? this.box,
      continueBtn: continueBtn ?? this.continueBtn,
      opacityBg: opacityBg ?? this.opacityBg,
      thickness: thickness ?? this.thickness,
    );
  }

  @override
  AppGradientsThemeGradients lerp(
    ThemeExtension<AppGradientsThemeGradients>? other,
    double t,
  ) {
    if (other is! AppGradientsThemeGradients) return this;
    return AppGradientsThemeGradients(
      background: Gradient.lerp(background, other.background, t) ?? background,
      box: Gradient.lerp(box, other.box, t) ?? box,
      continueBtn:
          Gradient.lerp(continueBtn, other.continueBtn, t) ?? continueBtn,
      opacityBg: Gradient.lerp(opacityBg, other.opacityBg, t) ?? opacityBg,
      thickness: Gradient.lerp(thickness, other.thickness, t) ?? thickness,
    );
  }

  static AppGradientsThemeGradients get light => AppGradientsThemeGradients(
    background: AppGradients.backgroundLight,
    box: AppGradients.boxLight,
    continueBtn: AppGradients.continueBtnLight,
    opacityBg: AppGradients.opacityBgLight,
    thickness: AppGradients.thicknessLight,
  );

  static AppGradientsThemeGradients get dark => AppGradientsThemeGradients(
    background: AppGradients.backgroundDark,
    box: AppGradients.boxDark,
    continueBtn: AppGradients.continueBtnDark,
    opacityBg: AppGradients.opacityBgDark,
    thickness: AppGradients.thicknessDark,
  );
}
