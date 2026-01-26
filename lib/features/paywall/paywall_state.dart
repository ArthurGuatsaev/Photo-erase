part of 'paywall_cubit.dart';

class PaywallState extends Equatable {
  const PaywallState({
    required this.placementType,
    this.placement,
    this.selectedProduct,
    this.isLoading = false,
    this.error,
    this.document,
  });

  final PlacementType placementType;
  final PlacementBundle? placement;
  final AdaptyPaywallProduct? selectedProduct;

  final bool isLoading;
  final String? error;
  final Photo? document;

  bool get isWeekSelected => selectedProduct == placement?.weekProduct;

  bool get isHalfyearSelected => selectedProduct == placement?.halfyearProduct;

  bool get isYearSelected => selectedProduct == placement?.yearProduct;

  bool get isTotalType =>
      placement?.paywallType == PaywallType.personalTotal ||
      placement?.paywallType == PaywallType.usualTotal;

  bool get isSelectedProductWithTrial => selectedProduct?.withTrial ?? false;

  @override
  List<Object?> get props => [
    placementType,
    placement,
    selectedProduct,
    isLoading,
    error,
    document,
  ];

  PaywallState copyWith({
    PlacementType? placementType,
    PlacementBundle? placement,
    AdaptyPaywallProduct? selectedProduct,
    bool? isLoading,
    String? error,
    Photo? document,
  }) {
    return PaywallState(
      placementType: placementType ?? this.placementType,
      placement: placement ?? this.placement,
      selectedProduct: selectedProduct ?? this.selectedProduct,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      document: document ?? this.document,
    );
  }
}

class PaywallUsualSwitchState extends PaywallState {
  final ProductOption productOption;
  const PaywallUsualSwitchState({
    required super.placementType,
    super.isLoading = false,
    super.document,
    super.error,
    super.placement,
    super.selectedProduct,
    this.productOption = const ProductOption(
      title: 'title',
      subtitle: 'subtitle',
      price: 'price',
    ),
  });
}

class PaywallUsualTotalState extends PaywallState {
  final ProductOption productOption;
  const PaywallUsualTotalState({
    required super.placementType,
    super.isLoading = false,
    super.document,
    super.error,
    super.placement,
    super.selectedProduct,
    this.productOption = const ProductOption(
      title: 'title',
      subtitle: 'subtitle',
      price: 'price',
    ),
  });
}

class PaywallPersonalState extends PaywallState {
  final ProductOption productOption;
  const PaywallPersonalState({
    required super.placementType,
    super.isLoading = false,
    super.document,
    super.error,
    super.placement,
    super.selectedProduct,
    this.productOption = const ProductOption(
      title: 'title',
      subtitle: 'subtitle',
      price: 'price',
    ),
  });
}

class PaywallSpecialState extends PaywallState {
  final ProductOption productOption;
  const PaywallSpecialState({
    required super.placementType,
    super.isLoading = false,
    super.document,
    super.error,
    super.placement,
    super.selectedProduct,
    this.productOption = const ProductOption(
      title: 'title',
      subtitle: 'subtitle',
      price: 'price',
    ),
  });
}

class PaywallTunnelState extends PaywallState {
  const PaywallTunnelState({
    required super.placementType,
    super.isLoading = false,
    super.document,
    super.error,
    super.placement,
    super.selectedProduct,
  });
}

class PaywallTimelineState extends PaywallState {
  const PaywallTimelineState({
    required super.placementType,
    super.isLoading = false,
    super.document,
    super.error,
    super.placement,
    super.selectedProduct,
  });
}
