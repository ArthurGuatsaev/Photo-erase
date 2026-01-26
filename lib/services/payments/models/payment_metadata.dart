import 'package:equatable/equatable.dart';

import 'rating_place.dart';

class PaymentMetadata extends Equatable {
  const PaymentMetadata({
    required this.freeDocumentsLimit,
    required this.ratingPlace,
    required this.showOnboardingQuestions,
    required this.showOnboardingSignature,
    required this.showOnboardingReviews,
  });

  final int freeDocumentsLimit;

  final RatingPlace ratingPlace;

  final bool showOnboardingQuestions;

  final bool showOnboardingSignature;

  final bool showOnboardingReviews;

  @override
  List<Object> get props => [
    freeDocumentsLimit,
    ratingPlace,
    showOnboardingQuestions,
    showOnboardingSignature,
    showOnboardingReviews,
  ];

  static const defaults = PaymentMetadata(
    freeDocumentsLimit: 0,
    ratingPlace: RatingPlace.onboarding,
    showOnboardingQuestions: true,
    showOnboardingSignature: true,
    showOnboardingReviews: true,
  );

  PaymentMetadata copyWith({
    int? freeDocumentsLimit,
    RatingPlace? ratingPlace,
    bool? showOnboardingQuestions,
    bool? showOnboardingSignature,
    bool? showOnboardingReviews,
  }) {
    return PaymentMetadata(
      freeDocumentsLimit: freeDocumentsLimit ?? this.freeDocumentsLimit,
      ratingPlace: ratingPlace ?? this.ratingPlace,
      showOnboardingQuestions:
          showOnboardingQuestions ?? this.showOnboardingQuestions,
      showOnboardingSignature:
          showOnboardingSignature ?? this.showOnboardingSignature,
      showOnboardingReviews:
          showOnboardingReviews ?? this.showOnboardingReviews,
    );
  }
}
