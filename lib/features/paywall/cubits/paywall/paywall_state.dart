part of 'paywall_cubit.dart';

sealed class PaywallState {
  const PaywallState();
}

final class PaywallLoading extends PaywallState {}

class PaywallSpecialState extends PaywallState {
  final ProductOption productHalfYear;
  PaywallSpecialState({required AdaptyPaywallProduct half})
    : productHalfYear = ProductOption(
        title: 'product_year_title',
        subtitle: 'product_year_subtitle',
        price: half.priceLocalized,
        originPrice: half.originalPriceLocalized,
        product: half,
      );
}

class PaywallTunnelState extends PaywallState {
  final ProductOption productYearOption;
  final ProductOption productYearTimelineOption;
  PaywallTunnelState({
    required AdaptyPaywallProduct year,
    required AdaptyPaywallProduct yearTimeline,
  }) : productYearOption = ProductOption(
         title: 'product_year_title',
         subtitle: 'product_year_subtitle',
         price: year.priceLocalized,
         originPrice: year.originalPriceLocalized,
         product: year,
       ),
       productYearTimelineOption = ProductOption(
         title: 'product_year_title',
         subtitle: 'product_year_subtitle',
         price: yearTimeline.zeroPriceLocalized,
         originPrice: yearTimeline.originalPriceLocalized,
         product: yearTimeline,
       );
  PaywallTunnelState.isdefault()
    : productYearOption = ProductOption.defaultPr(),
      productYearTimelineOption = ProductOption.defaultPr();
}

class PaywallTimelineState extends PaywallState {
  final ProductOption year;
  PaywallTimelineState({required AdaptyPaywallProduct year})
    : year = ProductOption(
        title: 'product_year_title',
        subtitle: 'product_year_subtitle',
        price: year.zeroPriceLocalized,
        originPrice: year.originalPriceLocalized,
        product: year,
      );
}

abstract class PaywallUsual extends PaywallState {
  ProductOption get productWeakOption;
  ProductOption get productYearOption;
}

class PaywallUsualSwitchState extends PaywallUsual {
  @override
  final ProductOption productWeakOption;
  @override
  final ProductOption productYearOption;
  PaywallUsualSwitchState({
    required AdaptyPaywallProduct week,
    required AdaptyPaywallProduct year,
  }) : productWeakOption = ProductOption(
         title: 'product_week_title',
         subtitle: 'product_week_subtitle',
         product: week,
         price: week.priceLocalized,
         label: 'paywall_label_switch',
       ),
       productYearOption = ProductOption(
         title: 'product_year_title',
         subtitle: 'product_year_subtitle',
         price: year.priceLocalized,
         originPrice: year.originalPriceLocalized,
         product: year,
       );
  PaywallUsualSwitchState.isdefault()
    : productYearOption = ProductOption.defaultPr(),
      productWeakOption = ProductOption.defaultPr();
}

class PaywallUsualTotalState extends PaywallUsual {
  @override
  final ProductOption productWeakOption;
  @override
  final ProductOption productYearOption;
  PaywallUsualTotalState.withTrial({
    required AdaptyPaywallProduct week,
    required AdaptyPaywallProduct year,
  }) : productWeakOption = ProductOption(
         title: 'product_week_total_title',
         subtitle: "product_week_total_subtitle".tr(
           args: [week.priceLocalized ?? ""],
         ),
         product: week,
         label: "three_days_free_label",
         price: week.zeroPriceLocalized,
       ),
       productYearOption = ProductOption(
         title: 'product_year_title',
         subtitle: 'product_year_subtitle',
         price: year.priceLocalized,
         originPrice: year.originalPriceLocalized,
         product: year,
       );
  PaywallUsualTotalState.withoutTrial({
    required AdaptyPaywallProduct week,
    required AdaptyPaywallProduct year,
  }) : productWeakOption = ProductOption(
         title: 'product_week_title',
         subtitle: 'product_week_subtitle',
         product: week,
         label: "popular_label",
         price: week.zeroPriceLocalized,
       ),
       productYearOption = ProductOption(
         title: 'product_year_title',
         subtitle: 'product_year_subtitle',
         price: year.priceLocalized,
         originPrice: year.originalPriceLocalized,
         product: year,
       );
}

class PaywallPersonalSwitchState extends PaywallUsual {
  final Photo photo;

  @override
  final ProductOption productWeakOption;
  @override
  final ProductOption productYearOption;
  PaywallPersonalSwitchState({
    required this.photo,
    required AdaptyPaywallProduct week,
    required AdaptyPaywallProduct year,
  }) : productWeakOption = ProductOption(
         title: 'product_week_title',
         subtitle: 'product_week_subtitle',
         product: week,
         label: "popular_label",
         price: week.zeroPriceLocalized,
       ),
       productYearOption = ProductOption(
         title: 'product_year_title',
         subtitle: 'product_year_subtitle',
         price: year.priceLocalized,
         originPrice: year.originalPriceLocalized,
         product: year,
       );
}

class PaywallPersonalTotalState extends PaywallUsual {
  final Photo photo;
  @override
  final ProductOption productWeakOption;
  @override
  final ProductOption productYearOption;
  PaywallPersonalTotalState({
    required AdaptyPaywallProduct week,
    required AdaptyPaywallProduct year,
    required this.photo,
  }) : productWeakOption = ProductOption(
         title: 'product_week_total_title',
         subtitle: "product_week_total_subtitle".tr(
           args: [week.priceLocalized ?? ""],
         ),
         product: week,
         label: "paywall_label_total",
         price: week.zeroPriceLocalized,
       ),
       productYearOption = ProductOption(
         title: 'product_year_title',
         subtitle: 'product_year_subtitle',
         price: year.priceLocalized,
         originPrice: year.originalPriceLocalized,
         product: year,
       );
}
