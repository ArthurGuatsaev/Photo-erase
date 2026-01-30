import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:injectable/injectable.dart';
import 'package:quick_actions/quick_actions.dart';
import '../../core/router/router.gr.dart';
import '../../main.dart';
import '../payments/models/placement_type.dart';
import '../payments/payment_service.dart';

abstract class QuickActionsService {
  Future<void> init();
}

/// Реализация сервиса для работы с iOS Quick Actions
@LazySingleton(as: QuickActionsService)
class QuickActionsServiceImpl implements QuickActionsService {
  static const String exitOfferAction = 'exit_offer';

  final QuickActions _quickActions = const QuickActions();
  final PaymentService _paymentService;
  StreamSubscription? _subscription;

  QuickActionsServiceImpl(this._paymentService);

  @override
  Future<void> init() async {
    // Обновляем Quick Actions на основе текущего статуса подписки
    await _updateQuickActions();

    // Подписываемся на изменения статуса подписки
    _subscription = _paymentService.stateStream.listen((_) {
      _updateQuickActions();
    });

    // Обрабатываем нажатие на quick action
    _quickActions.initialize((String shortcutType) {
      _handleQuickAction(shortcutType);
    });
  }

  Future<void> _updateQuickActions() async {
    // Если у пользователя уже есть подписка, не показываем Quick Action
    if (_paymentService.state.isPremium) {
      await _quickActions.setShortcutItems([]);
      return;
    }

    await _quickActions.setShortcutItems([
      ShortcutItem(
        type: exitOfferAction,
        localizedTitle: 'exit_offer'.tr(),
        icon: "🎁",
      ),
    ]);
  }

  void _handleQuickAction(String shortcutType) {
    switch (shortcutType) {
      case exitOfferAction:
        appRouter.push(PaywallRoute(placementType: PlacementType.special));
        break;
    }
  }

  void dispose() {
    _subscription?.cancel();
  }
}
