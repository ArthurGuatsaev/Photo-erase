import 'package:adapty_flutter/adapty_flutter.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/router/router.gr.dart';
import '../../../../main.dart';
import '../../../../services/app/app_service.dart';
import '../../../../services/payments/extensions.dart';
import '../../../../services/payments/payment_service.dart';
import '../../../../services/ui_message/ui_message_service.dart';
import '../../../widgets/pop_up_content/pop_up_error.dart';

part 'paying_state.dart';

@injectable
class PayingCubit extends Cubit<PayingState> {
  PayingCubit(this._paymentService, this._usMessages, this._appService)
    : super(const PayingState());

  final PaymentService _paymentService;
  final UIMessageService _usMessages;
  final AppService _appService;

  void selectProduct(AdaptyPaywallProduct product) {
    emit(state.copyWith(selectedProduct: product));
  }

  Future<void> purchaseProduct([AdaptyPaywallProduct? product]) async {
    if (product != null) selectProduct(product);
    try {
      emit(state.copyWith(isLoading: true));
      await _paymentService.purchase(state.selectedProduct!);
      await _paymentService.refreshPremium();
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    } finally {
      emit(state.copyWith(isLoading: false));
      if (_paymentService.state.isPremium) closePaywall();
    }
  }

  Future<void> restorePurchases() async {
    try {
      emit(state.copyWith(isLoading: true));
      await _paymentService.restore();
      await _paymentService.refreshPremium();
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    } finally {
      emit(state.copyWith(isLoading: false));
      if (_paymentService.state.isPremium) {
        appRouter.pop();
      } else {
        _usMessages.showAppDialog(child: PopupError.showSubscriptionError());
      }
    }
  }

  void launchUrl(String url) {
    _appService.launch(url);
  }

  void closePaywall() {
    if (appRouter.canPop()) {
      appRouter.pop(_paymentService.state.isPremium);
    } else {
      appRouter.replaceAll([const MainRoute()]);
    }
  }
}
