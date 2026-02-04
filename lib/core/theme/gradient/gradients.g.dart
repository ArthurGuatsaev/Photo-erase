// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gradients.dart';

// **************************************************************************
// ThemeGradientGenerator
// **************************************************************************

class AppGradientsThemeGradients
    extends ThemeExtension<AppGradientsThemeGradients> {
  final Gradient box;
  final Gradient mainBtn;
  final Gradient opacityBg;

  const AppGradientsThemeGradients({
    required this.box,
    required this.mainBtn,
    required this.opacityBg,
  });

  @override
  AppGradientsThemeGradients copyWith({
    Gradient? box,
    Gradient? mainBtn,
    Gradient? opacityBg,
  }) {
    return AppGradientsThemeGradients(
      box: box ?? this.box,
      mainBtn: mainBtn ?? this.mainBtn,
      opacityBg: opacityBg ?? this.opacityBg,
    );
  }

  @override
  AppGradientsThemeGradients lerp(
    ThemeExtension<AppGradientsThemeGradients>? other,
    double t,
  ) {
    if (other is! AppGradientsThemeGradients) return this;
    return AppGradientsThemeGradients(
      box: Gradient.lerp(box, other.box, t) ?? box,
      mainBtn: Gradient.lerp(mainBtn, other.mainBtn, t) ?? mainBtn,
      opacityBg: Gradient.lerp(opacityBg, other.opacityBg, t) ?? opacityBg,
    );
  }

  static AppGradientsThemeGradients get light => AppGradientsThemeGradients(
    box: AppGradients.boxLight,
    mainBtn: AppGradients.mainBtnLight,
    opacityBg: AppGradients.opacityBgLight,
  );

  static AppGradientsThemeGradients get dark => AppGradientsThemeGradients(
    box: AppGradients.boxDark,
    mainBtn: AppGradients.mainBtnDark,
    opacityBg: AppGradients.opacityBgDark,
  );
}
