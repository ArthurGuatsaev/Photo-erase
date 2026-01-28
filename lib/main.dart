import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:erasica/core/observers/bloc_observer.dart';
import 'package:erasica/core/router/router.dart';
import 'package:erasica/core/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'core/di/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await configureDependencies();
  await getIt.allReady();
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

///TODO для тестирования адаптивных 26 виджетов

// class AddApp extends StatelessWidget {
//   const AddApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return AdaptiveApp(
//       title: 'My App',
//       themeMode: ThemeMode.system,
//       materialLightTheme: ThemeData.light(),
//       materialDarkTheme: ThemeData.dark(),
//       cupertinoLightTheme: const CupertinoThemeData(
//         brightness: Brightness.light,
//       ),
//       cupertinoDarkTheme: const CupertinoThemeData(brightness: Brightness.dark),
//       home: const HomePage(),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return AdaptiveScaffold(
//       body: Container(
//         color: Colors.black,
//         child: SafeArea(
//           child: Column(
//             spacing: 10,
//             children: [
//               AdaptiveCard(child: Row(children: [Text('some text')])),
//               AdaptiveCard(child: Row(children: [Text('some text')])),
//               AdaptiveCard(child: Row(children: [Text('some text')])),
//               AdaptiveButton(
//                 onPressed: () {
//                   AdaptiveAlertDialog.show(
//                     context: context,
//                     title: 'Confirm',
//                     message: 'Are you sure?',
//                     icon: 'checkmark.circle.fill',
//                     actions: [
//                       AlertAction(
//                         title: 'Cancel',
//                         style: AlertActionStyle.cancel,
//                         onPressed: () {},
//                       ),
//                       AlertAction(
//                         title: 'Confirm',
//                         style: AlertActionStyle.primary,
//                         onPressed: () {
//                           // Do something
//                         },
//                       ),
//                     ],
//                   );
//                 },
//                 label: 'Disabled',
//                 // enabled: false,
//                 color: Colors.white,
//               ),
//               AdaptiveExpansionTile(
//                 title: Text('Premium Features'),
//                 backgroundColor: Colors.amber.withValues(alpha: 0.1),
//                 iconColor: Colors.amber,
//                 onExpansionChanged: (expanded) {
//                   print('Expanded: $expanded');
//                 },
//                 children: [
//                   ListTile(title: Text('Feature 1')),
//                   ListTile(title: Text('Feature 2')),
//                 ],
//               ),
//               AdaptiveFormSection.insetGrouped(
//                 header: Text('Settings'),
//                 children: [
//                   CupertinoFormRow(
//                     prefix: Text('Notifications'),
//                     child: AdaptiveSwitch(value: true, onChanged: (v) {}),
//                   ),
//                 ],
//               ),
//               AdaptiveFormSection(
//                 header: Text('Personal Information'),
//                 footer: Text('Please provide accurate information'),
//                 children: [
//                   CupertinoFormRow(
//                     prefix: Text('Name'),
//                     child: AdaptiveTextField(placeholder: 'Enter name'),
//                   ),
//                   CupertinoFormRow(
//                     prefix: Text('Email'),
//                     child: AdaptiveTextField(placeholder: 'Enter email'),
//                   ),
//                 ],
//               ),
//               AdaptiveListTile(
//                 title: Text('Enable Feature'),
//                 subtitle: Text('Toggle to enable'),
//                 trailing: AdaptiveSwitch(
//                   value: true,
//                   onChanged: (value) {
//                     // Handle change
//                   },
//                 ),
//               ),
//               AdaptiveBadge(count: 5, child: Icon(Icons.notifications)),

//               AdaptivePopupMenuButton.text<String>(
//                 label: 'Options',
//                 items: [
//                   AdaptivePopupMenuItem(
//                     label: 'Edit',
//                     icon: PlatformInfo.isIOS26OrHigher()
//                         ? 'pencil'
//                         : Icons.edit,
//                     value: 'edit',
//                   ),
//                   AdaptivePopupMenuItem(
//                     label: 'Delete',
//                     icon: PlatformInfo.isIOS26OrHigher()
//                         ? 'trash'
//                         : Icons.delete,
//                     value: 'delete',
//                   ),
//                   AdaptivePopupMenuDivider(),
//                   AdaptivePopupMenuItem(
//                     label: 'Share',
//                     icon: PlatformInfo.isIOS26OrHigher()
//                         ? 'square.and.arrow.up'
//                         : Icons.share,
//                     value: 'share',
//                   ),
//                 ],
//                 onSelected: (index, item) {
//                   print('Selected: ${item.value}');
//                 },
//               ),

//               // Custom widget with popup menu
//               AdaptivePopupMenuButton.widget<String>(
//                 items: [
//                   AdaptivePopupMenuItem(label: 'Option 1', value: 'opt1'),
//                   AdaptivePopupMenuItem(label: 'Option 2', value: 'opt2'),
//                 ],
//                 onSelected: (index, item) {
//                   print('Selected: ${item.value}');
//                 },
//                 child: Container(
//                   padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//                   decoration: BoxDecoration(
//                     color: Colors.blue.withOpacity(0.1),
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Icon(Icons.menu),
//                       SizedBox(width: 8),
//                       Text('Custom Button'),
//                     ],
//                   ),
//                 ),
//               ),
//               AdaptiveContextMenu(
//                 actions: [
//                   AdaptiveContextMenuAction(
//                     title: 'Edit',
//                     icon: PlatformInfo.isIOS
//                         ? CupertinoIcons.pencil
//                         : Icons.edit,
//                     onPressed: () {
//                       print('Edit pressed');
//                     },
//                   ),
//                   AdaptiveContextMenuAction(
//                     title: 'Share',
//                     icon: PlatformInfo.isIOS
//                         ? CupertinoIcons.share
//                         : Icons.share,
//                     onPressed: () {
//                       print('Share pressed');
//                     },
//                   ),
//                   AdaptiveContextMenuAction(
//                     title: 'Delete',
//                     icon: PlatformInfo.isIOS
//                         ? CupertinoIcons.trash
//                         : Icons.delete,
//                     isDestructive: true,
//                     onPressed: () {
//                       print('Delete pressed');
//                     },
//                   ),
//                 ],
//                 child: Container(
//                   padding: EdgeInsets.all(16),
//                   child: Text(
//                     'Long press me',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// enum Options { option1, option2, option3 }

// Options? _selectedOption = Options.option1;
