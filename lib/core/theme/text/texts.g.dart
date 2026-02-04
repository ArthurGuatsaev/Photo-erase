// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'texts.dart';

// **************************************************************************
// ThemeTextGenerator
// **************************************************************************

class AppTextStyleThemeText extends ThemeExtension<AppTextStyleThemeText> {
  final TextStyle appbarTitle;
  final TextStyle boxTitle;
  final TextStyle btnTitle;
  final TextStyle popupSubtitle;
  final TextStyle popupTitle;
  final TextStyle subtitle;
  final TextStyle title;

  const AppTextStyleThemeText({
    required this.appbarTitle,
    required this.boxTitle,
    required this.btnTitle,
    required this.popupSubtitle,
    required this.popupTitle,
    required this.subtitle,
    required this.title,
  });

  @override
  AppTextStyleThemeText copyWith({
    TextStyle? appbarTitle,
    TextStyle? boxTitle,
    TextStyle? btnTitle,
    TextStyle? popupSubtitle,
    TextStyle? popupTitle,
    TextStyle? subtitle,
    TextStyle? title,
  }) {
    return AppTextStyleThemeText(
      appbarTitle: appbarTitle ?? this.appbarTitle,
      boxTitle: boxTitle ?? this.boxTitle,
      btnTitle: btnTitle ?? this.btnTitle,
      popupSubtitle: popupSubtitle ?? this.popupSubtitle,
      popupTitle: popupTitle ?? this.popupTitle,
      subtitle: subtitle ?? this.subtitle,
      title: title ?? this.title,
    );
  }

  @override
  AppTextStyleThemeText lerp(
    ThemeExtension<AppTextStyleThemeText>? other,
    double t,
  ) {
    if (other is! AppTextStyleThemeText) return this;
    return AppTextStyleThemeText(
      appbarTitle:
          TextStyle.lerp(appbarTitle, other.appbarTitle, t) ?? appbarTitle,
      boxTitle: TextStyle.lerp(boxTitle, other.boxTitle, t) ?? boxTitle,
      btnTitle: TextStyle.lerp(btnTitle, other.btnTitle, t) ?? btnTitle,
      popupSubtitle:
          TextStyle.lerp(popupSubtitle, other.popupSubtitle, t) ??
          popupSubtitle,
      popupTitle: TextStyle.lerp(popupTitle, other.popupTitle, t) ?? popupTitle,
      subtitle: TextStyle.lerp(subtitle, other.subtitle, t) ?? subtitle,
      title: TextStyle.lerp(title, other.title, t) ?? title,
    );
  }

  static AppTextStyleThemeText get light => AppTextStyleThemeText(
    appbarTitle: AppTextStyle.appbarTitle,
    boxTitle: AppTextStyle.boxTitle,
    btnTitle: AppTextStyle.btnTitle,
    popupSubtitle: AppTextStyle.popupSubtitle,
    popupTitle: AppTextStyle.popupTitle,
    subtitle: AppTextStyle.subtitle,
    title: AppTextStyle.title,
  );

  static AppTextStyleThemeText get dark => AppTextStyleThemeText(
    appbarTitle: AppTextStyle.appbarTitle,
    boxTitle: AppTextStyle.boxTitle,
    btnTitle: AppTextStyle.btnTitle,
    popupSubtitle: AppTextStyle.popupSubtitle,
    popupTitle: AppTextStyle.popupTitle,
    subtitle: AppTextStyle.subtitle,
    title: AppTextStyle.title,
  );
}
