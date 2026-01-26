/// Типы подписок
enum SubscriptionType {
  /// Недельная подписка с триалом
  weekTrial,

  /// Подписка на 6 месяцев
  sixMonth,

  /// Годовая подписка
  year,
}

extension SubscriptionTypeExtension on SubscriptionType {
  /// Получить позицию в списке (для соответствия дизайну в Figma)
  int get position {
    switch (this) {
      case SubscriptionType.weekTrial:
        return 0;
      case SubscriptionType.sixMonth:
        return 1;
      case SubscriptionType.year:
        return 2;
    }
  }
}

