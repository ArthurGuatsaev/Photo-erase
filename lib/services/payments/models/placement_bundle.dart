import 'package:adapty_flutter/adapty_flutter.dart';
import 'package:collection/collection.dart';

import '../extensions.dart';
import 'paywall_type.dart';

class PlacementBundle {
  final AdaptyPaywall paywall;
  final List<AdaptyPaywallProduct> products;

  PlacementBundle(this.paywall, this.products);

  PaywallType get paywallType {
    final remoteConfig = paywall.remoteConfig;
    final paywallTypeValue =
        (remoteConfig?.dictionary?['paywall_type'] as String?)?.trim();

    switch (paywallTypeValue) {
      case "special_offer":
        return PaywallType.specialOffer;
      case "personal_total":
        return PaywallType.personalTotal;
      case "personal_switch":
        return PaywallType.personalSwitch;
      case "tunnel":
        return PaywallType.tunnel;
      case "timeline":
        return PaywallType.timeline;
      case "usual_total":
        return PaywallType.usualTotal;
      case "usual_switch":
        return PaywallType.usualSwitch;
      case _:
        return PaywallType.usualSwitch;
    }
  }

  AdaptyPaywallProduct? get weekProduct {
    return products.firstWhereOrNull((product) => product.isWeekProduct);
  }

  AdaptyPaywallProduct? get monthProduct {
    return products.firstWhereOrNull((product) => product.isMonthProduct);
  }

  AdaptyPaywallProduct? get halfyearProduct {
    return products.firstWhereOrNull((product) => product.isHalfyearProduct);
  }

  AdaptyPaywallProduct? get yearProduct {
    return products.firstWhereOrNull((product) => product.isYearProduct);
  }
}
