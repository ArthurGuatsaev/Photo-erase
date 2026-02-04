enum RatingPlace {
  action,
  onboarding;

  bool get needAction => this == RatingPlace.action;
  bool get needOnboarding => this == RatingPlace.onboarding;

  static RatingPlace get(dynamic value) {
    if (value == null || value.isEmpty || value is! String) {
      return RatingPlace.onboarding;
    }

    switch (value.trim().toLowerCase()) {
      case 'action':
        return RatingPlace.action;
      case 'onboarding':
        return RatingPlace.onboarding;
      default:
        return RatingPlace.onboarding;
    }
  }
}
