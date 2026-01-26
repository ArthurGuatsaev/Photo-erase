import 'package:adapty_flutter/adapty_flutter.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../core/const/system_untils.dart';
import '../../../../core/router/router.gr.dart';
import '../../../../main.dart';
import '../../../../services/payments/extensions.dart';
import '../../../../services/payments/payment_service.dart';

part 'paying_state.dart';

@injectable
class PayingCubit extends Cubit<PayingState> {
  PayingCubit(this._paymentService) : super(PayingState());

  final PaymentService _paymentService;

  /// TODO скорее всего не нужно будет
  // Future<void> init(PlacementType placement) async {
  //   emit(state.copyWith(isLoading: true));
  //   try {
  //     if (!_paymentService.state.isInitialized) {
  //       await _paymentService.init();
  //     }
  //     emit(state.copyWith(isLoading: false));
  //   } catch (e) {
  //     emit(state.copyWith(isLoading: false, error: e.toString()));
  //   }
  // }

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
      if (_paymentService.state.isPremium) appRouter.pop();
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
        //TODO показать поп ап нет подписки
        // if (context.mounted) {
        //   ErrorPopup.show(context: context);
        // }
      }
    }
  }

  void launchUrl(String url) {
    try {
      launchUrlString(url);
    } catch (e) {
      dprint('launchUrl error: $e');
    }
  }

  void closePaywall() {
    if (appRouter.canPop()) {
      appRouter.pop();
    } else {
      appRouter.replaceAll([MainRoute()]);
    }
  }
}
