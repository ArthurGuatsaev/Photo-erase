import 'dart:io';

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:erasica/services/app/workings/working_screenshot.dart';
import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:injectable/injectable.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../core/const/system_untils.dart';
import 'app_service.dart';
import 'workings/working_file_system.dart';
import 'workings/working_preferences.dart';

@LazySingleton(as: AppService)
class AppServiceImpl
    with WorkingPreferences, FileSystem, WorkingScreenshot
    implements AppService {
  @override
  Future<void> init() async {
    await getApplicationOpenCount();
    await disableScreenshot();
    await getNeedAttRequest();
    await getNeedRating();
  }

  @override
  Future<void> requestReview() async {
    if (!needRating) return;
    final inAppReview = InAppReview.instance;
    if (await inAppReview.isAvailable()) {
      await inAppReview.requestReview();
    }
    getNeedRating();
  }

  @override
  Future<void> requestATT() async {
    if (Platform.isIOS) {
      if (!needAtt) return;
      try {
        final trackingStatus =
            await AppTrackingTransparency.trackingAuthorizationStatus;
        if (trackingStatus == TrackingStatus.notDetermined) {
          await AppTrackingTransparency.requestTrackingAuthorization();
        }
      } catch (_) {}
      getNeedAttRequest();
    }
  }

  @override
  Future<void> launch(String path) async {
    try {
      await launchUrlString(path);
    } catch (e) {
      dprint('launchUrl error: $e');
    }
  }

  @override
  Future<void> shareApp(String path, RenderBox render) async {
    try {
      SharePlus.instance.share(
        ShareParams(
          uri: Uri.parse(path),
          sharePositionOrigin:
              render.localToGlobal(Offset.zero) & const Size(100, 100),
        ),
      );
    } catch (e) {
      dprint('launchUrl error: $e');
    }
  }
}
