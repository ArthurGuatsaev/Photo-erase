import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../../../services/app/app_service.dart';
import '../../../../services/payments/payment_service.dart';
import '../../../../services/ui_message/ui_message_service.dart';
import '../../../widgets/pop_up_content/pop_up_att.dart';

part 'app_state.dart';

@injectable
class AppCubit extends Cubit<AppState> {
  AppCubit(this._appService, this._messageService, this._paymentService)
    : super(AppState(needRequest: _appService.needRating));

  final AppService _appService;
  final PaymentService _paymentService;
  final UIMessageService _messageService;

  Future<void> showAtt() async {
    if (Platform.isIOS) {
      if (!await _appService.getNeedAttRequest()) return;
      Future.delayed(const Duration(seconds: 1), () {
        _messageService.showAppDialog(
          child: PopupATT.show(_appService.requestATT),
        );
      });
    }
  }

  Future<void> showAppRequest() async {
    if (!_paymentService.state.metadata.ratingPlace.needAction) {
      _appService.requestReview();
    }
    emit(state.copyWith(needRequest: false));
  }
}
