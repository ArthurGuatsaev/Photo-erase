import 'package:easy_localization/easy_localization.dart';

enum ErrorDialogType {
  connection,
  general,
  noPermission,
  accNotFound,
  restoreFailed;

  String get title {
    switch (this) {
      case ErrorDialogType.connection:
        return 'error_dialog_connection_issue'.tr();
      case ErrorDialogType.noPermission:
        return 'error_dialog_permission_required'.tr();
      case ErrorDialogType.general:
        return 'error_dialog_oops_something_went_wrong'.tr();
      case ErrorDialogType.accNotFound:
        return 'error_dialog_account_not_found'.tr();
      case ErrorDialogType.restoreFailed:
        return 'error_dialog_no_active_purchases'.tr();
    }
  }

  String get message {
    switch (this) {
      case ErrorDialogType.connection:
        return 'error_dialog_please_check_your_internet_connection_and_try_again'
            .tr();
      case ErrorDialogType.noPermission:
        return 'error_dialog_please_grant_permission_to_access_the_camera'.tr();
      case ErrorDialogType.general:
        return 'error_dialog_please_try_again_in_a_moment'.tr();
      case ErrorDialogType.accNotFound:
        return 'error_dialog_we_couldnt_find_an_account_with_this_email'.tr();
      case ErrorDialogType.restoreFailed:
        return 'error_dialog_theres_nothing_to_restore_on_this_account'.tr();
    }
  }
}
