import 'dart:io';

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:injectable/injectable.dart';
import 'app_service.dart';
import 'file_system.dart';
import 'working_preferences.dart';

@LazySingleton(as: AppService)
class AppServiceImpl with WorkingPreferences, FileSystem implements AppService {
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
