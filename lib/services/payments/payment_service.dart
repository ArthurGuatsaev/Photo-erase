import 'package:adapty_flutter/adapty_flutter.dart';

import 'models/payment_state.dart';
import 'models/placement_bundle.dart';
import 'models/placement_type.dart';

abstract class PaymentService {
  Future<void> init();

  PaymentState get state;

  Stream<PaymentState> get stateStream;

  PlacementBundle? getPlacement(PlacementType type);

  Future<void> purchase(AdaptyPaywallProduct product);

  Future<void> restore();

  Future<void> refreshPremium();
}
