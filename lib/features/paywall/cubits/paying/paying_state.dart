part of 'paying_cubit.dart';

class PayingState extends Equatable {
  const PayingState({this.selectedProduct, this.isLoading = false, this.error});
  final AdaptyPaywallProduct? selectedProduct;
  final bool isLoading;
  final String? error;

  bool get isSelectedProductWithTrial => selectedProduct?.withTrial ?? false;

  @override
  List<Object?> get props => [selectedProduct, isLoading, error];

  PayingState copyWith({
    AdaptyPaywallProduct? selectedProduct,
    bool? isLoading,
    String? error,
  }) {
    return PayingState(
      selectedProduct: selectedProduct ?? this.selectedProduct,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
