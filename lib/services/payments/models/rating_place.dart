/// Место показа рейтинга
enum RatingPlace {
  /// Показываем после успешного добавления подписи/печати/инициалов
  /// (только 1 раз)
  action,

  /// Показываем в онбординге на следующем шаге после rating
  onboarding,
}

extension RatingPlaceExtension on RatingPlace {
  /// Преобразует строку из метаданных в RatingPlace
  static RatingPlace fromString(String? value) {
    if (value == null || value.isEmpty) {
      return RatingPlace.onboarding;
    }

    switch (value.toLowerCase()) {
      case 'action':
        return RatingPlace.action;
      case 'onboarding':
        return RatingPlace.onboarding;
      default:
        return RatingPlace.onboarding;
    }
  }
}
