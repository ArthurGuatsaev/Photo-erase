import 'package:cupertino_context_menu_plus/cupertino_context_menu_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:erasica/core/observers/bloc_observer.dart';
import 'package:erasica/core/router/router.dart';
import 'package:erasica/core/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'core/di/di.dart';
import 'core/language/app_language.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await configureDependencies();
  await getIt.allReady();
  Bloc.observer = getIt<ErrorBlocObserver>();
  runApp(MyApp());
  // runApp(AddApp());
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
      child: ScreenUtilInit(
        designSize: const Size(375, 815),
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

///TODO для тестирования адаптивных 26 виджетов

class AddApp extends StatelessWidget {
  const AddApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      themeMode: ThemeMode.system,
      // materialLightTheme: ThemeData.light(),
      // materialDarkTheme: ThemeData.dark(),
      // cupertinoLightTheme: const CupertinoThemeData(
      //   brightness: Brightness.light,
      // ),
      // cupertinoDarkTheme: const CupertinoThemeData(brightness: Brightness.dark),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = CupertinoContextMenuPlusController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: SafeArea(
          child: Center(
            child: Column(
              spacing: 10,
              children: [
                CupertinoContextMenuPlus(
                  controller: controller,
                  openGestureEnabled: false,
                  onOpened: () => debugPrint('Context menu opened'),
                  location: CupertinoContextMenuLocation.center,
                  showGrowAnimation: false,
                  backdropBlurSigma: 8,
                  backdropBlurCurve: Interval(0.0, 0.25, curve: Curves.easeOut),
                  backdropBlurReverseCurve: Curves.easeIn,
                  modalReverseTransitionDuration: Duration(milliseconds: 180),
                  barrierColor: const Color(0x3304040F),
                  // topWidget: Container(
                  //   decoration: BoxDecoration(color: Colors.amber),
                  //   height: 100,
                  //   width: 100,
                  // ),
                  bottomWidgetBuilder: (context) => ClipRSuperellipse(
                    borderRadius: BorderRadius.circular(16),
                    child: SizedBox(
                      width: 190,
                      child: ColoredBox(
                        color: CupertinoColors.systemRed,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            CupertinoContextMenuAction(
                              trailingIcon: CupertinoIcons.add,
                              child: const Text('Replys'),
                              onPressed: () {},
                            ),
                            CupertinoContextMenuAction(
                              child: const Text('Replys'),
                              onPressed: () {},
                            ),
                            CupertinoContextMenuAction(
                              child: const Text('Replys'),
                              onPressed: () {},
                            ),
                            CupertinoContextMenuAction(
                              child: const Text('Replys'),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: CupertinoColors.activeBlue,
                      ),
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const Text('Message'),
                          const SizedBox(width: 8),
                          CupertinoButton(
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            onPressed: controller.open,
                            child: const Icon(
                              CupertinoIcons.smiley,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum Options { option1, option2, option3 }

Options? _selectedOption = Options.option1;
