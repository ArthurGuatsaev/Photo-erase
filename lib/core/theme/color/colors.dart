import 'package:flutter/material.dart';
import 'package:theme_code_gen_annotations/theme_code_gen_annotations.dart';

part 'colors.g.dart';

@colorAnnotation
class AppColors {
  static const Color backgroundLight = Color(0xFF04020F);
  static const Color backgroundDark = Color(0xFF04020F);
  static const Color textBaseLight = Color(0xFFFFFFFF);
  static const Color textBaseDark = Color(0xFFFFFFFF);
  static const Color paywallPrimaryLight = Color.fromRGBO(255, 124, 53, 1);
  static const Color paywallPrimaryDark = Color.fromRGBO(255, 124, 53, 1);

  static const Color thickInactiveLight = Color.fromRGBO(120, 120, 120, 0.2);
  static const Color thickInactiveDark = Color.fromRGBO(120, 120, 120, 0.2);
  static const Color errorPopupBgLight = Color.fromRGBO(4, 2, 15, 1);
  static const Color errorPopupBgDark = Color.fromRGBO(4, 2, 15, 1);

  //text
  static const Color titleLight = Color.fromRGBO(255, 255, 255, 1);
  static const Color titleDark = Color.fromRGBO(255, 255, 255, 1);
  static const Color btnTitleLight = Color(0xFF04020F);
  static const Color btnTitleDark = Color(0xFF04020F);
  static const Color subtitleLight = Color.fromRGBO(255, 255, 255, 0.6);
  static const Color subtitleDark = Color.fromRGBO(255, 255, 255, 0.6);
  static const Color subtitleDarkLight = Color.fromRGBO(255, 255, 255, 0.4);
  static const Color subtitleDarkDark = Color.fromRGBO(255, 255, 255, 0.4);
  //TODO
  static const Color removBtnSubtitleLight = Color.fromARGB(255, 255, 255, 255);
  static const Color removBtnSubtitleDark = Color.fromARGB(255, 255, 255, 255);
  static const Color removingBtnTitleLight = Color.fromARGB(191, 255, 255, 255);
  static const Color removingBtnTitleDark = Color.fromARGB(191, 255, 255, 255);
  static const Color appNameLight = Color.fromARGB(255, 255, 255, 255);
  static const Color appNameDark = Color.fromARGB(255, 255, 255, 255);
  static const Color appSloganLight = Color.fromARGB(200, 255, 255, 255);
  static const Color appSloganDark = Color.fromARGB(200, 255, 255, 255);
  static const Color settBtnSubtitleLight = Color.fromARGB(200, 255, 255, 255);
  static const Color settBtnSubtitleDark = Color.fromARGB(200, 255, 255, 255);
  static const Color selectedIconLight = Color.fromARGB(255, 255, 255, 255);
  static const Color selectedIconDark = Color.fromARGB(255, 255, 255, 255);
}
