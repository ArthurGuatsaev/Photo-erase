import 'package:easy_localization/easy_localization.dart';
import 'package:erasica/core/observers/bloc_observer.dart';
import 'package:erasica/core/router/router.dart';
import 'package:erasica/core/theme/app_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:toastification/toastification.dart';
import 'core/const/const.dart';
import 'core/di/di.dart';
import 'core/language/app_language.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await configureDependencies();
  await getIt.allReady();
  Bloc.observer = getIt<ErrorBlocObserver>();
  runApp(const MyApp());
  // runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: AppLanguages.supportedLocales,
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      useOnlyLangCode: true,
      child: Builder(
        builder: (context) {
          return ToastificationWrapper(
            child: MaterialApp.router(
              supportedLocales: context.supportedLocales,
              localizationsDelegates: context.localizationDelegates,
              locale: context.locale,
              debugShowCheckedModeBanner: false,
              theme: createLightTheme(MediaQuery.of(context).size.width),
              routerConfig: appRouter.config(),
              builder: (context, appChild) {
                final Widget appContent = appChild ?? const SizedBox.shrink();

                // ИСПОЛЬЗУЕМ В КОДЕ КОРРЕКТНО!
                // breakpoints.isMobile, ResponsiveValue<int> (для grid и тд) и тд
                // размерная сетка Breakpoints ниже
                // scale не привязан к размерной сетки и перестает скейлить вниз с AppConst.designWidth

                return ResponsiveBreakpoints.builder(
                  breakpoints: const [
                    Breakpoint(start: 0, end: 599, name: MOBILE),
                    Breakpoint(start: 600, end: 839, name: TABLET),
                    Breakpoint(start: 840, end: double.infinity, name: DESKTOP),
                  ],
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final double screenWidth = constraints.maxWidth;

                      // scale-down only:
                      // если экран уже designWidth -> ничего не увеличиваем (scale=1)
                      // если меньше -> уменьшаем весь UI пропорционально
                      final double scaledBoxWidth =
                          screenWidth < AppConst.designWidth
                          ? AppConst.designWidth
                          : screenWidth;

                      return ResponsiveScaledBox(
                        width: scaledBoxWidth,
                        child: appContent,
                      );
                    },
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

final appRouter = AppRouter();
