import 'package:adapty_flutter/adapty_flutter.dart';
import 'package:equatable/equatable.dart';
import 'package:erasica/entities/photo/photo.dart';
import 'package:erasica/features/widgets/pop_up_content/error_pop_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../core/const/system_untils.dart';
import '../../core/router/router.gr.dart';
import '../../main.dart';
import '../../services/payments/extensions.dart';
import '../../services/payments/models/paywall_type.dart';
import '../../services/payments/models/placement_bundle.dart';
import '../../services/payments/models/placement_type.dart';
import '../../services/payments/payment_service.dart';
import 'model/product_option.dart';

part 'paywall_state.dart';

@injectable
class PaywallCubit extends Cubit<PaywallState> {
  PaywallCubit(
    this._paymentService, {
    @factoryParam required PlacementType placementType,
  }) : super(PaywallState(placementType: placementType)) {
    _setPlacement(placementType);
  }

  final PaymentService _paymentService;

  void _setPlacement(PlacementType placement) {
    final newPlacement = _paymentService.getPlacement(placement);

    emit(
      state.copyWith(
        placement: newPlacement,
        selectedProduct: state.selectedProduct ?? newPlacement?.weekProduct,
      ),
    );
  }

  Future<void> init(PlacementType placement) async {
    emit(state.copyWith(isLoading: true));

    try {
      if (!_paymentService.state.isInitialized) {
        await _paymentService.init();
      }

      emit(state.copyWith(isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  void selectProduct(AdaptyPaywallProduct? product) {
    emit(state.copyWith(selectedProduct: product));
  }

  Future<void> purchaseProduct(
    AdaptyPaywallProduct? product,
    BuildContext context,
  ) async {
    if (product == null) {
      ErrorPopup.show(context: context);
      return;
    }

    selectProduct(product);

    try {
      emit(state.copyWith(isLoading: true));
      await _paymentService.purchase(product);
      await _paymentService.refreshPremium();

      if (_paymentService.state.isPremium) {
        appRouter.pop();
        return;
      }

      emit(state.copyWith(isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  Future<void> restorePurchases(BuildContext context) async {
    try {
      emit(state.copyWith(isLoading: true));
      await _paymentService.restore();
      await _paymentService.refreshPremium();

      if (_paymentService.state.isPremium) {
        appRouter.pop();
        return;
      } else {
        if (context.mounted) {
          ErrorPopup.show(context: context);
        }
      }

      emit(state.copyWith(isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
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
