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
}
