// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'colors.dart';

// **************************************************************************
// ThemeColorGenerator
// **************************************************************************

class AppColorsThemeColors extends ThemeExtension<AppColorsThemeColors> {
  final Color appName;
  final Color appSlogan;
  final Color background;
  final Color btnTitle;
  final Color errorPopupBg;
  final Color paywallPrimary;
  final Color primary;
  final Color removBtnSubtitle;
  final Color removingBtnTitle;
  final Color selectedIcon;
  final Color settBtnSubtitle;
  final Color subtitle;
  final Color subtitleDark;
  final Color textBase;
  final Color thickInactive;
  final Color title;

  const AppColorsThemeColors({
    required this.appName,
    required this.appSlogan,
    required this.background,
    required this.btnTitle,
    required this.errorPopupBg,
    required this.paywallPrimary,
    required this.primary,
    required this.removBtnSubtitle,
    required this.removingBtnTitle,
    required this.selectedIcon,
    required this.settBtnSubtitle,
    required this.subtitle,
    required this.subtitleDark,
    required this.textBase,
    required this.thickInactive,
    required this.title,
  });

  @override
  AppColorsThemeColors copyWith({
    Color? appName,
    Color? appSlogan,
    Color? background,
    Color? btnTitle,
    Color? errorPopupBg,
    Color? paywallPrimary,
    Color? primary,
    Color? removBtnSubtitle,
    Color? removingBtnTitle,
    Color? selectedIcon,
    Color? settBtnSubtitle,
    Color? subtitle,
    Color? subtitleDark,
    Color? textBase,
    Color? thickInactive,
    Color? title,
  }) {
    return AppColorsThemeColors(
      appName: appName ?? this.appName,
      appSlogan: appSlogan ?? this.appSlogan,
      background: background ?? this.background,
      btnTitle: btnTitle ?? this.btnTitle,
      errorPopupBg: errorPopupBg ?? this.errorPopupBg,
      paywallPrimary: paywallPrimary ?? this.paywallPrimary,
      primary: primary ?? this.primary,
      removBtnSubtitle: removBtnSubtitle ?? this.removBtnSubtitle,
      removingBtnTitle: removingBtnTitle ?? this.removingBtnTitle,
      selectedIcon: selectedIcon ?? this.selectedIcon,
      settBtnSubtitle: settBtnSubtitle ?? this.settBtnSubtitle,
      subtitle: subtitle ?? this.subtitle,
      subtitleDark: subtitleDark ?? this.subtitleDark,
      textBase: textBase ?? this.textBase,
      thickInactive: thickInactive ?? this.thickInactive,
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
      appName: Color.lerp(appName, other.appName, t) ?? appName,
      appSlogan: Color.lerp(appSlogan, other.appSlogan, t) ?? appSlogan,
      background: Color.lerp(background, other.background, t) ?? background,
      btnTitle: Color.lerp(btnTitle, other.btnTitle, t) ?? btnTitle,
      errorPopupBg:
          Color.lerp(errorPopupBg, other.errorPopupBg, t) ?? errorPopupBg,
      paywallPrimary:
          Color.lerp(paywallPrimary, other.paywallPrimary, t) ?? paywallPrimary,
      primary: Color.lerp(primary, other.primary, t) ?? primary,
      removBtnSubtitle:
          Color.lerp(removBtnSubtitle, other.removBtnSubtitle, t) ??
          removBtnSubtitle,
      removingBtnTitle:
          Color.lerp(removingBtnTitle, other.removingBtnTitle, t) ??
          removingBtnTitle,
      selectedIcon:
          Color.lerp(selectedIcon, other.selectedIcon, t) ?? selectedIcon,
      settBtnSubtitle:
          Color.lerp(settBtnSubtitle, other.settBtnSubtitle, t) ??
          settBtnSubtitle,
      subtitle: Color.lerp(subtitle, other.subtitle, t) ?? subtitle,
      subtitleDark:
          Color.lerp(subtitleDark, other.subtitleDark, t) ?? subtitleDark,
      textBase: Color.lerp(textBase, other.textBase, t) ?? textBase,
      thickInactive:
          Color.lerp(thickInactive, other.thickInactive, t) ?? thickInactive,
      title: Color.lerp(title, other.title, t) ?? title,
    );
  }

  static AppColorsThemeColors get light => AppColorsThemeColors(
    appName: AppColors.appNameLight,
    appSlogan: AppColors.appSloganLight,
    background: AppColors.backgroundLight,
    btnTitle: AppColors.btnTitleLight,
    errorPopupBg: AppColors.errorPopupBgLight,
    paywallPrimary: AppColors.paywallPrimaryLight,
    primary: AppColors.primaryLight,
    removBtnSubtitle: AppColors.removBtnSubtitleLight,
    removingBtnTitle: AppColors.removingBtnTitleLight,
    selectedIcon: AppColors.selectedIconLight,
    settBtnSubtitle: AppColors.settBtnSubtitleLight,
    subtitle: AppColors.subtitleLight,
    subtitleDark: AppColors.subtitleDarkLight,
    textBase: AppColors.textBaseLight,
    thickInactive: AppColors.thickInactiveLight,
    title: AppColors.titleLight,
  );

  static AppColorsThemeColors get dark => AppColorsThemeColors(
    appName: AppColors.appNameDark,
    appSlogan: AppColors.appSloganDark,
    background: AppColors.backgroundDark,
    btnTitle: AppColors.btnTitleDark,
    errorPopupBg: AppColors.errorPopupBgDark,
    paywallPrimary: AppColors.paywallPrimaryDark,
    primary: AppColors.primaryDark,
    removBtnSubtitle: AppColors.removBtnSubtitleDark,
    removingBtnTitle: AppColors.removingBtnTitleDark,
    selectedIcon: AppColors.selectedIconDark,
    settBtnSubtitle: AppColors.settBtnSubtitleDark,
    subtitle: AppColors.subtitleDark,
    subtitleDark: AppColors.subtitleDarkDark,
    textBase: AppColors.textBaseDark,
    thickInactive: AppColors.thickInactiveDark,
    title: AppColors.titleDark,
  );
}
