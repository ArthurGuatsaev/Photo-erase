import 'package:flutter/material.dart';
import 'package:theme_code_gen_annotations/theme_code_gen_annotations.dart';

part 'colors.g.dart';

@colorAnnotation
class AppColors {
  static const Color primaryLight = Color.fromRGBO(2, 78, 255, 1);
  static const Color primaryDark = Color.fromRGBO(2, 78, 255, 1);

  static const Color backgroundLight = Color(0xFF04020F);
  static const Color backgroundDark = Color(0xFF04020F);

  static const Color textBaseLight = Color(0xFFFFFFFF);
  static const Color textBaseDark = Color(0xFFFFFFFF);

  static const Color paywallPrimaryLight = Color.fromRGBO(255, 124, 53, 1);
  static const Color paywallPrimaryDark = Color.fromRGBO(255, 124, 53, 1);

  static const Color maskLight = Color.fromRGBO(207, 60, 200, 1);
  static const Color maskDark = Color.fromRGBO(207, 60, 200, 1);

  static const Color boxLight = Color.fromRGBO(12, 14, 33, 1);
  static const Color boxDark = Color.fromRGBO(12, 14, 33, 1);

  //text
  static const Color titleLight = Color.fromRGBO(255, 255, 255, 1);
  static const Color titleDark = Color.fromRGBO(255, 255, 255, 1);

  static const Color btnTitleLight = Color(0xFF04020F);
  static const Color btnTitleDark = Color(0xFF04020F);

  static const Color subtitleLight = Color.fromRGBO(255, 255, 255, 0.6);
  static const Color subtitleDark = Color.fromRGBO(255, 255, 255, 0.6);

  static const Color subtitleLightLight = Color.fromRGBO(255, 255, 255, 0.75);
  static const Color subtitleLightDark = Color.fromRGBO(255, 255, 255, 0.75);

  static const Color subtitleDarkLight = Color.fromRGBO(255, 255, 255, 0.4);
  static const Color subtitleDarkDark = Color.fromRGBO(255, 255, 255, 0.4);
}
