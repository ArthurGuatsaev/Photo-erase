import 'package:adapty_flutter/adapty_flutter.dart';

//TODO нужно для debug
class DefaultProduct implements AdaptyPaywallProduct {
  @override
  String get accessLevelId => throw UnimplementedError();

  @override
  bool get isFamilyShareable => throw UnimplementedError();

  @override
  String get localizedDescription => throw UnimplementedError();

  @override
  String get localizedTitle => 'product_week_title';

  @override
  String get paywallABTestName => throw UnimplementedError();

  @override
  String get paywallName => throw UnimplementedError();

  @override
  int get paywallProductIndex => throw UnimplementedError();

  @override
  String get paywallVariationId => throw UnimplementedError();

  @override
  AdaptyPrice get price => DefaultPrice();

  @override
  String get productType => throw UnimplementedError();

  @override
  String? get regionCode => throw UnimplementedError();

  @override
  AdaptyProductSubscription? get subscription => throw UnimplementedError();

  @override
  String get vendorProductId => '';
}

class DefaultPrice implements AdaptyPrice {
  @override
  double get amount => 1;

  @override
  String? get currencyCode => 'en';

  @override
  String? get currencySymbol => '\$';

  @override
  String? get localizedString => '\$10';
}
