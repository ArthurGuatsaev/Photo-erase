// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'colors.dart';

// **************************************************************************
// ThemeColorGenerator
// **************************************************************************

class AppColorsThemeColors extends ThemeExtension<AppColorsThemeColors> {
  final Color background;
  final Color box;
  final Color btnTitle;
  final Color mask;
  final Color paywallPrimary;
  final Color primary;
  final Color subtitle;
  final Color subtitleDark;
  final Color subtitleLight;
  final Color textBase;
  final Color title;

  const AppColorsThemeColors({
    required this.background,
    required this.box,
    required this.btnTitle,
    required this.mask,
    required this.paywallPrimary,
    required this.primary,
    required this.subtitle,
    required this.subtitleDark,
    required this.subtitleLight,
    required this.textBase,
    required this.title,
  });

  @override
  AppColorsThemeColors copyWith({
    Color? background,
    Color? box,
    Color? btnTitle,
    Color? mask,
    Color? paywallPrimary,
    Color? primary,
    Color? subtitle,
    Color? subtitleDark,
    Color? subtitleLight,
    Color? textBase,
    Color? title,
  }) {
    return AppColorsThemeColors(
      background: background ?? this.background,
      box: box ?? this.box,
      btnTitle: btnTitle ?? this.btnTitle,
      mask: mask ?? this.mask,
      paywallPrimary: paywallPrimary ?? this.paywallPrimary,
      primary: primary ?? this.primary,
      subtitle: subtitle ?? this.subtitle,
      subtitleDark: subtitleDark ?? this.subtitleDark,
      subtitleLight: subtitleLight ?? this.subtitleLight,
      textBase: textBase ?? this.textBase,
      title: title ?? this.title,
    );
  }

  @override
  AppColorsThemeColors lerp(
    ThemeExtension<AppColorsThemeColors>? other,
    double t,
  ) {
    if (other is! AppColorsThemeColors) return this;
    return AppColorsThemeColors(
      background: Color.lerp(background, other.background, t) ?? background,
      box: Color.lerp(box, other.box, t) ?? box,
      btnTitle: Color.lerp(btnTitle, other.btnTitle, t) ?? btnTitle,
      mask: Color.lerp(mask, other.mask, t) ?? mask,
      paywallPrimary:
          Color.lerp(paywallPrimary, other.paywallPrimary, t) ?? paywallPrimary,
      primary: Color.lerp(primary, other.primary, t) ?? primary,
      subtitle: Color.lerp(subtitle, other.subtitle, t) ?? subtitle,
      subtitleDark:
          Color.lerp(subtitleDark, other.subtitleDark, t) ?? subtitleDark,
      subtitleLight:
          Color.lerp(subtitleLight, other.subtitleLight, t) ?? subtitleLight,
      textBase: Color.lerp(textBase, other.textBase, t) ?? textBase,
      title: Color.lerp(title, other.title, t) ?? title,
    );
  }

  static AppColorsThemeColors get light => const AppColorsThemeColors(
    background: AppColors.backgroundLight,
    box: AppColors.boxLight,
    btnTitle: AppColors.btnTitleLight,
    mask: AppColors.maskLight,
    paywallPrimary: AppColors.paywallPrimaryLight,
    primary: AppColors.primaryLight,
    subtitle: AppColors.subtitleLight,
    subtitleDark: AppColors.subtitleDarkLight,
    subtitleLight: AppColors.subtitleLightLight,
    textBase: AppColors.textBaseLight,
    title: AppColors.titleLight,
  );

  static AppColorsThemeColors get dark => const AppColorsThemeColors(
    background: AppColors.backgroundDark,
    box: AppColors.boxDark,
    btnTitle: AppColors.btnTitleDark,
    mask: AppColors.maskDark,
    paywallPrimary: AppColors.paywallPrimaryDark,
    primary: AppColors.primaryDark,
    subtitle: AppColors.subtitleDark,
    subtitleDark: AppColors.subtitleDarkDark,
    subtitleLight: AppColors.subtitleLightDark,
    textBase: AppColors.textBaseDark,
    title: AppColors.titleDark,
  );
}
