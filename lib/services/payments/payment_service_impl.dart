import 'dart:async';
import 'dart:developer';

import 'package:adapty_flutter/adapty_flutter.dart';
import 'package:erasica/services/app/app_service.dart';
import 'package:injectable/injectable.dart';
import '../../core/const/const.dart';
import '../../core/const/system_untils.dart';
import 'models/payment_state.dart';
import 'models/placement_bundle.dart';
import 'models/placement_type.dart';
import 'models/rating_place.dart';
import 'payment_service.dart';

@LazySingleton(as: PaymentService)
class PaymentServiceImpl implements PaymentService {
  PaymentServiceImpl({required this.appService});
  final AppService appService;
  @override
  PaymentState get state => _state;

  @override
  Stream<PaymentState> get stateStream => _stateController.stream;

  PaymentState _state = const PaymentState();
  final _stateController = StreamController<PaymentState>.broadcast();

  @override
  Future<void> init() async {
    await _configure();
    await refreshPremium();
    await _getProducts();
    _getMetadata();
  }

  Future<void> _configure() async {
    try {
      await Adapty().setLogLevel(AdaptyLogLevel.error);
      if (!await Adapty().isActivated()) {
        await Adapty().activate(
          configuration: AdaptyConfiguration(apiKey: AppConst.adaptyKey),
        );
      }
    } catch (e) {
      dprint('PaymentService _configure error: $e');
      _updateState(_state.copyWith(isInitialized: true));
    }
  }

  Future<void> _getProducts() async {
    try {
      if (state.isPremium) return;

      final isFirstLaunch = appService.applicationOpenCount == 0;
      final firstPlacementKey = isFirstLaunch
          ? PlacementType.onboarding.name
          : PlacementType.start.name;

      await _setPaywallBundle(firstPlacementKey);

      final keys = <String>[
        PlacementType.start.name,
        PlacementType.special.name,
        PlacementType.personal.name,
        PlacementType.onboarding.name,
        PlacementType.common.name,
      ]..remove(firstPlacementKey);

      for (final key in keys) {
        unawaited(_setPaywallBundle(key));
      }
    } catch (e) {
      dprint('PaymentService _getProducts error: $e');
    }
  }

  Future<void> _setPaywallBundle(String key) async {
    final bundle = await _fetchPaywallBundle(key);

    _updateState(
      state.copyWith(
        startPlacement: key == 'start' ? bundle : state.startPlacement,
        specialPlacement: key == 'special' ? bundle : state.specialPlacement,
        personalPlacement: key == 'personal' ? bundle : state.personalPlacement,
        onboardingPlacement: key == 'onboarding'
            ? bundle
            : state.onboardingPlacement,
        commonPlacement: key == 'common' ? bundle : state.commonPlacement,
        isInitialized: true,
      ),
    );
  }

  Future<PlacementBundle?> _fetchPaywallBundle(
    String placementId, {
    String? locale,
  }) async {
    try {
      final paywall = await Adapty().getPaywall(
        placementId: placementId,
        locale: locale,
      );

      final products = await Adapty().getPaywallProducts(paywall: paywall);
      return PlacementBundle(paywall, products);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> refreshPremium() async {
    try {
      final profile = await Adapty().getProfile();
      final isPremium = profile.accessLevels['premium']?.isActive ?? false;
      _updateState(_state.copyWith(isPremium: isPremium));
    } catch (e) {
      log('PaymentService refreshPremium error: $e');
    }
  }

  void _updateState(PaymentState newState) {
    _state = newState;
    _stateController.add(newState);
  }

  void dispose() {
    _stateController.close();
  }

  @override
  Future<void> purchase(AdaptyPaywallProduct product) async {
    try {
      await Adapty().makePurchase(product: product);
    } catch (e) {
      dprint('PaymentService purchase error: $e');
    }
  }

  @override
  Future<void> restore() async {
    try {
      await Adapty().restorePurchases();
    } catch (e) {
      dprint('PaymentService restore error: $e');
      rethrow;
    }
  }

  @override
  PlacementBundle? getPlacement(PlacementType type) {
    switch (type) {
      case PlacementType.special:
        return state.specialPlacement;
      case PlacementType.personal:
        return state.personalPlacement;
      case PlacementType.onboarding:
        return state.onboardingPlacement;
      case PlacementType.start:
        return state.startPlacement;
      case PlacementType.common:
        return state.commonPlacement;
    }
  }

  Future<void> _getMetadata() async {
    try {
      final appConfigPaywall = await Adapty().getPaywall(
        placementId: "app_config",
      );
      final remoteConfig = appConfigPaywall.remoteConfig?.dictionary;
      final ratingPlace = RatingPlace.get((remoteConfig?['rating_place']));
      final showReview = remoteConfig?['show_onboarding_reviews'] as bool?;
      _updateState(
        state.copyWith(
          metadata: state.metadata.copyWith(
            ratingPlace: ratingPlace,
            showOnboardingReviews: showReview,
          ),
        ),
      );
    } catch (e) {
      dprint('PaymentService _getMetadata error: $e');
    }
  }
}
