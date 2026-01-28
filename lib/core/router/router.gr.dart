// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:erasica/entities/photo/photo.dart' as _i11;
import 'package:erasica/features/erasing/erase_bg_page.dart' as _i1;
import 'package:erasica/features/erasing/erase_object_page.dart' as _i2;
import 'package:erasica/features/erasing/widgets/screenshot_page.dart' as _i6;
import 'package:erasica/features/main/main_page.dart' as _i3;
import 'package:erasica/features/onboarding/onboarding_page.dart' as _i4;
import 'package:erasica/features/paywall/paywall_page.dart' as _i5;
import 'package:erasica/features/settings/settings_page.dart' as _i7;
import 'package:erasica/features/splash/splash_page.dart' as _i8;
import 'package:erasica/services/payments/models/placement_type.dart' as _i12;
import 'package:flutter/material.dart' as _i10;

/// generated route for
/// [_i1.EraseBgPage]
class EraseBgRoute extends _i9.PageRouteInfo<EraseBgRouteArgs> {
  EraseBgRoute({
    _i10.Key? key,
    required _i11.Photo photo,
    List<_i9.PageRouteInfo>? children,
  }) : super(
         EraseBgRoute.name,
         args: EraseBgRouteArgs(key: key, photo: photo),
         initialChildren: children,
       );

  static const String name = 'EraseBgRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EraseBgRouteArgs>();
      return _i1.EraseBgPage(key: args.key, photo: args.photo);
    },
  );
}

class EraseBgRouteArgs {
  const EraseBgRouteArgs({this.key, required this.photo});

  final _i10.Key? key;

  final _i11.Photo photo;

  @override
  String toString() {
    return 'EraseBgRouteArgs{key: $key, photo: $photo}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! EraseBgRouteArgs) return false;
    return key == other.key && photo == other.photo;
  }

  @override
  int get hashCode => key.hashCode ^ photo.hashCode;
}

/// generated route for
/// [_i2.EraseObjPage]
class EraseObjRoute extends _i9.PageRouteInfo<EraseObjRouteArgs> {
  EraseObjRoute({
    _i10.Key? key,
    required _i11.Photo photo,
    List<_i9.PageRouteInfo>? children,
  }) : super(
         EraseObjRoute.name,
         args: EraseObjRouteArgs(key: key, photo: photo),
         initialChildren: children,
       );

  static const String name = 'EraseObjRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EraseObjRouteArgs>();
      return _i2.EraseObjPage(key: args.key, photo: args.photo);
    },
  );
}

class EraseObjRouteArgs {
  const EraseObjRouteArgs({this.key, required this.photo});

  final _i10.Key? key;

  final _i11.Photo photo;

  @override
  String toString() {
    return 'EraseObjRouteArgs{key: $key, photo: $photo}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! EraseObjRouteArgs) return false;
    return key == other.key && photo == other.photo;
  }

  @override
  int get hashCode => key.hashCode ^ photo.hashCode;
}

/// generated route for
/// [_i3.MainPage]
class MainRoute extends _i9.PageRouteInfo<void> {
  const MainRoute({List<_i9.PageRouteInfo>? children})
    : super(MainRoute.name, initialChildren: children);

  static const String name = 'MainRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i3.MainPage();
    },
  );
}

/// generated route for
/// [_i4.OnboardingPage]
class OnboardingRoute extends _i9.PageRouteInfo<void> {
  const OnboardingRoute({List<_i9.PageRouteInfo>? children})
    : super(OnboardingRoute.name, initialChildren: children);

  static const String name = 'OnboardingRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i4.OnboardingPage();
    },
  );
}

/// generated route for
/// [_i5.PaywallPage]
class PaywallRoute extends _i9.PageRouteInfo<PaywallRouteArgs> {
  PaywallRoute({
    _i10.Key? key,
    required _i12.PlacementType placementType,
    List<_i9.PageRouteInfo>? children,
  }) : super(
         PaywallRoute.name,
         args: PaywallRouteArgs(key: key, placementType: placementType),
         initialChildren: children,
       );

  static const String name = 'PaywallRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PaywallRouteArgs>();
      return _i5.PaywallPage(key: args.key, placementType: args.placementType);
    },
  );
}

class PaywallRouteArgs {
  const PaywallRouteArgs({this.key, required this.placementType});

  final _i10.Key? key;

  final _i12.PlacementType placementType;

  @override
  String toString() {
    return 'PaywallRouteArgs{key: $key, placementType: $placementType}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! PaywallRouteArgs) return false;
    return key == other.key && placementType == other.placementType;
  }

  @override
  int get hashCode => key.hashCode ^ placementType.hashCode;
}

/// generated route for
/// [_i6.ScreenshotPage]
class ScreenshotRoute extends _i9.PageRouteInfo<void> {
  const ScreenshotRoute({List<_i9.PageRouteInfo>? children})
    : super(ScreenshotRoute.name, initialChildren: children);

  static const String name = 'ScreenshotRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i6.ScreenshotPage();
    },
  );
}

/// generated route for
/// [_i7.SettingsPage]
class SettingsRoute extends _i9.PageRouteInfo<void> {
  const SettingsRoute({List<_i9.PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i7.SettingsPage();
    },
  );
}

/// generated route for
/// [_i8.SplashPage]
class SplashRoute extends _i9.PageRouteInfo<void> {
  const SplashRoute({List<_i9.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i8.SplashPage();
    },
  );
}
