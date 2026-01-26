import 'package:adapty_flutter/adapty_flutter.dart';
import 'package:easy_localization/easy_localization.dart';

extension AdaptyPaywallProductX on AdaptyPaywallProduct {
  double? get priceValue => price.amount;

  String? get currencyCode => price.currencyCode;

  String? get priceLocalized => price.localizedString;

  double? get originalPrice {
    if (priceValue == null) return null;
    final doubled = priceValue! * 2;
    final rounded = doubled.roundToDouble();
    return rounded - 0.01;
  }

  String? get originalPriceLocalized =>
      _formattedPrice(originalPrice, currencyCode) ?? "";

  String get zeroPriceLocalized => _formattedPrice(0.00, currencyCode) ?? "";

  bool get withTrial => vendorProductId.contains("trial");

  String? _formattedPrice(double? price, String? currencyCode) {
    if (currencyCode == null || price == null) return null;
    final format = NumberFormat.simpleCurrency(name: currencyCode);
    return format.format(price);
  }

  bool get isWeekProduct =>
      subscription?.period.unit == AdaptyPeriodUnit.week &&
      subscription?.period.numberOfUnits == 1;

  bool get isMonthProduct =>
      subscription?.period.unit == AdaptyPeriodUnit.month &&
      subscription?.period.numberOfUnits == 1;

  bool get isHalfyearProduct =>
      subscription?.period.unit == AdaptyPeriodUnit.month &&
      subscription?.period.numberOfUnits == 6;

  bool get isYearProduct =>
      subscription?.period.unit == AdaptyPeriodUnit.year &&
      subscription?.period.numberOfUnits == 1;

  double? get perDay {
    final v = priceValue;
    if (v == null) return null;

    double? days;
    if (isWeekProduct) {
      days = 7;
    } else if (isMonthProduct) {
      days = 30;
    } else if (isHalfyearProduct) {
      days = 183;
    } else if (isYearProduct) {
      days = 365;
    }
    if (days == null) return null;

    final value = v / days;
    return double.parse(value.toStringAsFixed(2));
  }

  String? get perDayLocalized => _formattedPrice(perDay, currencyCode) ?? "";
}
