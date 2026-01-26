import 'package:equatable/equatable.dart';

import 'payment_metadata.dart';
import 'placement_bundle.dart';

class PaymentState extends Equatable {
  const PaymentState({
    this.isPremium = false,
    this.metadata = PaymentMetadata.defaults,
    this.isInitialized = false,
    this.commonPlacement,
    this.onboardingPlacement,
    this.personalPlacement,
    this.specialPlacement,
    this.startPlacement,
  });

  final bool isPremium;

  final PlacementBundle? commonPlacement;

  final PlacementBundle? onboardingPlacement;

  final PlacementBundle? personalPlacement;

  final PlacementBundle? specialPlacement;

  final PlacementBundle? startPlacement;

  final PaymentMetadata metadata;

  final bool isInitialized;

  @override
  List<Object?> get props => [
    isPremium,
    commonPlacement,
    onboardingPlacement,
    personalPlacement,
    specialPlacement,
    startPlacement,
    metadata,
    isInitialized,
  ];

  PaymentState copyWith({
    bool? isPremium,
    PlacementBundle? commonPlacement,
    PlacementBundle? onboardingPlacement,
    PlacementBundle? personalPlacement,
    PlacementBundle? specialPlacement,
    PlacementBundle? startPlacement,
    PaymentMetadata? metadata,
    bool? isInitialized,
  }) {
    return PaymentState(
      isPremium: isPremium ?? this.isPremium,
      commonPlacement: commonPlacement ?? this.commonPlacement,
      onboardingPlacement: onboardingPlacement ?? this.onboardingPlacement,
      personalPlacement: personalPlacement ?? this.personalPlacement,
      specialPlacement: specialPlacement ?? this.specialPlacement,
      startPlacement: startPlacement ?? this.startPlacement,
      metadata: metadata ?? this.metadata,
      isInitialized: isInitialized ?? this.isInitialized,
    );
  }
}
