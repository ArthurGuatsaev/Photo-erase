import 'package:flutter/services.dart';

class AppConst {
  static const String adaptyKey = "public_live_bzuBN8nl.UnMn2F5fgJTyRhzBREXu";
  static const String privacyUrl = "https://erasica.com/privacy";
  static const String termsUrl = "https://erasica.com/terms";
  static const String contactUrl = "https://erasica.com";
  static const String shareUrl = "https://apps.apple.com/app/id"; //TODO
  static const String apiEndpoint = 'https://api.erasica.com';

  static void triggerHaptic() {
    HapticFeedback.heavyImpact();
  }

  static const double designWidth = 375;
  static const double maxWidth = 400;
}
