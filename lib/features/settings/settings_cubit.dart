import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:erasica/core/const/const.dart';
import 'package:erasica/core/const/system_untils.dart';
import 'package:erasica/features/widgets/pop_up_content/pop_up_error.dart';
import 'package:erasica/services/app/app_service.dart';
import 'package:erasica/services/payments/payment_service.dart';
import 'package:erasica/services/ui_message/ui_message_service.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

part 'settings_state.dart';

@injectable
class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit(this._appService, this._paymentService, this._messageService)
    : super(SettingsInitial());

  final AppService _appService;
  final PaymentService _paymentService;
  final UIMessageService _messageService;

  pressShareApp(RenderBox render) async {
    await _appService.shareApp(AppConst.shareUrl, render);
  }

  pressSupportApp() async {
    await _appService.launch(AppConst.contactUrl);
  }

  pressPrivacyApp() async {
    await _appService.launch(AppConst.privacyUrl);
  }

  pressTermsApp() async {
    await _appService.launch(AppConst.termsUrl);
  }

  pressRestoreApp() async {
    emit(SettingsLoading());
    try {
      await _paymentService.restore();
    } catch (e) {
      dprint(e.toString());
    } finally {
      emit(SettingsInitial());
      if (!_paymentService.state.isPremium) {
        _messageService.showAppDialog(
          child: PopupError.showSubscriptionError(),
        );
      }
    }
  }
}
