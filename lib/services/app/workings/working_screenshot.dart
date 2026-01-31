import 'package:no_screenshot/no_screenshot.dart';

import '../../../core/router/router.gr.dart';
import '../../../main.dart';

mixin WorkingScreenshot {
  final screenshot = NoScreenshot.instance;

  Future<void> disableScreenshot() async {
    await screenshot.startScreenshotListening();
    // await screenshot.screenshotOff();
    screenshot.screenshotStream.listen((value) {
      if (value.wasScreenshotTaken) {
        appRouter.push(ScreenshotRoute());
      }
    });
  }

  Future<void> enableScreenshot() async {
    await screenshot.screenshotOn();
  }
}
