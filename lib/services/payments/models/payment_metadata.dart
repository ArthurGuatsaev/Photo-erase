// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'rating_place.dart';

class PaymentMetadata extends Equatable {
  const PaymentMetadata({
    required this.ratingPlace,
    required this.showOnboardingReviews,
  });

  final RatingPlace ratingPlace;
  final bool showOnboardingReviews;

  @override
  List<Object> get props => [ratingPlace, showOnboardingReviews];

  static const defaults = PaymentMetadata(
    ratingPlace: RatingPlace.onboarding,
    showOnboardingReviews: true,
  );

  PaymentMetadata copyWith({
    RatingPlace? ratingPlace,
    bool? showOnboardingReviews,
  }) {
    return PaymentMetadata(
      ratingPlace: ratingPlace ?? this.ratingPlace,
      showOnboardingReviews:
          showOnboardingReviews ?? this.showOnboardingReviews,
    );
  }
}
