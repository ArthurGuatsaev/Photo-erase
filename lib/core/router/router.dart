import 'package:auto_route/auto_route.dart';

import 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: MainRoute.page, path: '/main'),
    AutoRoute(page: OnboardingRoute.page, path: '/onboarding'),
    AutoRoute(page: SplashRoute.page, path: '/'),
    AutoRoute(page: PaywallRoute.page, path: '/paywall'),
    AutoRoute(
      page: EraseBgRoute.page,
      path: '/erase_bg',
      fullscreenDialog: true,
    ),
    AutoRoute(
      page: EraseObjRoute.page,
      path: '/erase_obj',
      fullscreenDialog: true,
    ),
    AutoRoute(page: SettingsRoute.page, path: '/settings'),
  ];
}
