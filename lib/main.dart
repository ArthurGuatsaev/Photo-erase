import 'package:easy_localization/easy_localization.dart';
import 'package:erasica/core/observers/bloc_observer.dart';
import 'package:erasica/core/router/router.dart';
import 'package:erasica/core/router/router.gr.dart';
import 'package:erasica/core/theme/app_theme.dart';
import 'package:erasica/services/gallery_photos/gallery_photo_service.dart';
import 'package:erasica/services/payments/models/placement_type.dart';
import 'package:erasica/services/payments/payment_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'core/di/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(LoadingApp());
  await EasyLocalization.ensureInitialized();
  await configureDependencies();
  await getIt.allReady();
  //TODO
  await getIt<PaymentService>().init();
  getIt<GalleryPhotoService>().loadGalleryPhotos();
  appRouter.replaceAll([
    MainRoute(),
    PaywallRoute(placementType: PlacementType.special),
  ]);
  //TODO
  Bloc.observer = getIt<ErrorBlocObserver>();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('ja'),
        Locale('de'),
        Locale('fr'),
        Locale('it'),
        Locale('pt'),
        Locale('es'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      useOnlyLangCode: true,
      child: ScreenUtilInit(
        designSize: const Size(375, 800),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp.router(
            supportedLocales: context.supportedLocales,
            localizationsDelegates: context.localizationDelegates,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            theme: createLightTheme(),

            routerConfig: appRouter.config(),
          );
        },
      ),
    );
  }
}

final appRouter = AppRouter();

class LoadingApp extends StatelessWidget {
  const LoadingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: Center(child: Text('LOADING...'))),
    );
  }
}
