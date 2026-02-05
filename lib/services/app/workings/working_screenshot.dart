import 'package:screen_protector/screen_protector.dart';

mixin WorkingScreenshot {
  Future<void> disableScreenshot() async {
    try {
      await ScreenProtector.preventScreenshotOn();
      await ScreenProtector.protectDataLeakageWithBlur();
    } catch (_) {}
  }

  Future<void> enableScreenshot() async {
    try {
      await ScreenProtector.preventScreenshotOff();
    } catch (_) {}
  }
}
