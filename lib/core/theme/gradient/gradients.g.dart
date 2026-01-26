// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gradients.dart';

// **************************************************************************
// ThemeGradientGenerator
// **************************************************************************

class AppGradientsThemeGradients
    extends ThemeExtension<AppGradientsThemeGradients> {
  final Gradient background;
  final Gradient continueBtn;
  final Gradient thickness;

  const AppGradientsThemeGradients({
    required this.background,
    required this.continueBtn,
    required this.thickness,
  });

  @override
  AppGradientsThemeGradients copyWith({
    Gradient? background,
    Gradient? continueBtn,
    Gradient? thickness,
  }) {
    return AppGradientsThemeGradients(
      background: background ?? this.background,
      continueBtn: continueBtn ?? this.continueBtn,
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
      continueBtn:
          Gradient.lerp(continueBtn, other.continueBtn, t) ?? continueBtn,
      thickness: Gradient.lerp(thickness, other.thickness, t) ?? thickness,
    );
  }

  static AppGradientsThemeGradients get light => AppGradientsThemeGradients(
    background: AppGradients.backgroundLight,
    continueBtn: AppGradients.continueBtnLight,
    thickness: AppGradients.thicknessLight,
  );

  static AppGradientsThemeGradients get dark => AppGradientsThemeGradients(
    background: AppGradients.backgroundDark,
    continueBtn: AppGradients.continueBtnDark,
    thickness: AppGradients.thicknessDark,
  );
}
