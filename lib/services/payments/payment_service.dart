import 'package:adapty_flutter/adapty_flutter.dart';

import 'models/payment_state.dart';
import 'models/placement_bundle.dart';
import 'models/placement_type.dart';

/// TODO (мой план. минимальный для первичного ревью)
// onboarding создание подписи
// anchor menu и list menu в 1 единое
// фиолетовая полоска syncfusion
// подергивание thumb при показе
// AppState нормальный
// дергает документы при подгрузке первой на main
// ipad
// анимация новая

abstract class PaymentService {
  Future<void> init();

  PaymentState get state;

  Stream<PaymentState> get stateStream;

  PlacementBundle? getPlacement(PlacementType type);

  Future<void> purchase(AdaptyPaywallProduct product);

  Future<void> restore();

  Future<void> refreshPremium();
}
