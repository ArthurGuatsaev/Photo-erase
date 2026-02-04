import 'package:flutter/services.dart';

class AppConst {
  static const String adaptyKey = "public_live_gzeBkRBR.cTYSnl9bteT2vu41qwZa";
  static const String privacyUrl = "https://removeit.click/privacy";
  static const String termsUrl = "https://removeit.click/terms";
  static const String contactUrl = "https://removeit.click";
  static const String shareUrl = "erasica";
  static const String apiEndpoint =
      'https://api.erasica.com'; //"https://api.removeit.click";//TODO удалить после проверки

  static void triggerHaptic() {
    HapticFeedback.heavyImpact();
  }

  static const double designWidth = 375;
  static const double maxWidth = 400;
}
