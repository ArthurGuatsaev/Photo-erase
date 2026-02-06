import 'package:adapty_flutter/adapty_flutter.dart';
import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:erasica/services/payments/extensions.dart';
import 'package:injectable/injectable.dart';

import '../../../../entities/photo/photo.dart';
import '../../../../services/payments/models/paywall_type.dart';
import '../../../../services/payments/models/placement_type.dart';
import '../../../../services/payments/payment_service.dart';
import '../../model/default_product.dart';
import '../../model/product_option.dart';

part 'paywall_state.dart';

@injectable
class PaywallCubit extends Cubit<PaywallState> {
  PaywallCubit({
    @factoryParam required PlacementType placementType,
    @factoryParam required Photo? photo,
    required PaymentService paymantServie,
  }) : _paymantService = paymantServie,
       _photo = photo,
       super(PaywallLoading()) {
    init(placementType);
  }

  final Photo? _photo;
  final PaymentService _paymantService;

  void setPaywallUsualSwitch() {
    final week = _paymantService.state.startPlacement?.weekProduct;
    final year = _paymantService.state.startPlacement?.yearProduct;
    if (week == null || year == null) return emit(PaywallLoading());
    emit(PaywallUsualSwitchState(week: week, year: year));
  }

  void setPaywallUsualTotal() {
    final week = _paymantService.state.startPlacement?.weekProduct;
    final year = _paymantService.state.startPlacement?.yearProduct;
    if (week == null || year == null) return emit(PaywallLoading());
    week.withTrial
        ? emit(PaywallUsualTotalState.withTrial(week: week, year: year))
        : emit(PaywallUsualTotalState.withoutTrial(week: week, year: year));
  }

  void setPaywallPersonalSwitch() {
    if (_photo == null) return setPaywallUsualSwitch();
    final week = _paymantService.state.startPlacement?.weekProduct;
    final year = _paymantService.state.startPlacement?.yearProduct;
    if (week == null || year == null) return emit(PaywallLoading());
    emit(PaywallPersonalSwitchState(week: week, year: year, photo: _photo));
  }

  void setPaywallPersonalTotal() {
    if (_photo == null) return setPaywallUsualSwitch();
    final week = _paymantService.state.startPlacement?.weekProduct;
    final year = _paymantService.state.startPlacement?.yearProduct;
    if (week == null || year == null) return emit(PaywallLoading());
    emit(PaywallPersonalTotalState(week: week, year: year, photo: _photo));
  }

  void setTunnel() {
    final year = _paymantService.state.onboardingPlacement?.yearProduct;
    if (year == null) return emit(PaywallLoading());
    emit(PaywallTunnelState(year: year, yearTimeline: year));
  }

  void setSpecial() {
    final half = _paymantService.state.specialPlacement?.halfyearProduct;
    if (half == null) return emit(PaywallLoading());
    emit(PaywallSpecialState(half: half));
  }

  void setTimeline() {
    final year = _paymantService.state.onboardingPlacement?.yearProduct;
    if (year == null) return emit(PaywallLoading());
    emit(PaywallTimelineState(year: year));
  }

  Future<void> init(PlacementType type) async {
    try {
      if (!_paymantService.state.isInitialized) {
        await _paymantService.init();
      }
      final bundle = _paymantService.getPlacement(type);
      switch (bundle?.paywallType) {
        case PaywallType.usualSwitch:
          setPaywallUsualSwitch();
        case PaywallType.usualTotal:
          setPaywallUsualTotal();
        case PaywallType.personalTotal:
          setPaywallPersonalTotal();
        case PaywallType.personalSwitch:
          setPaywallPersonalSwitch();
        case PaywallType.tunnel:
          setTunnel();
        case PaywallType.timeline:
          setTimeline();
        case PaywallType.specialOffer:
          setSpecial();
        case _:
          setPaywallUsualSwitch();
      }
    } catch (_) {}
  }
}
