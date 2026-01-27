enum RatingPlace {
  action,
  onboarding;

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
