import 'dart:io';

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:erasica/services/app/workings/working_screenshot.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:injectable/injectable.dart';
import 'app_service.dart';
import 'workings/working_file_system.dart';
import 'workings/working_preferences.dart';

@LazySingleton(as: AppService)
class AppServiceImpl
    with WorkingPreferences, FileSystem, WorkingScreenshot
    implements AppService {
  @override
  Future<void> requestReview() async {
    final inAppReview = InAppReview.instance;
    if (await inAppReview.isAvailable()) {
      await inAppReview.requestReview();
    }
  }

  @override
  Future<void> requestATT() async {
    if (Platform.isIOS) {
      try {
        final trackingStatus =
            await AppTrackingTransparency.trackingAuthorizationStatus;
        if (trackingStatus == TrackingStatus.notDetermined) {
          await AppTrackingTransparency.requestTrackingAuthorization();
        }
      } catch (_) {}
    }
  }
}
