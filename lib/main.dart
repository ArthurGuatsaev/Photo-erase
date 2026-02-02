import 'package:easy_localization/easy_localization.dart';
import 'package:erasica/core/observers/bloc_observer.dart';
import 'package:erasica/core/router/router.dart';
import 'package:erasica/core/theme/app_theme.dart';
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

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'iOS Long Press with Preview',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         platform: TargetPlatform.iOS,
//       ),
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final List<ListItem> items = [
//     ListItem('Документ 1', 'Сегодня, 10:30', Colors.blue, Icons.description),
//     ListItem('Фотография', 'Вчера, 15:45', Colors.green, Icons.photo),
//     ListItem('Презентация', '2 дня назад', Colors.orange, Icons.slideshow),
//     ListItem('Видео файл', 'Неделю назад', Colors.purple, Icons.videocam),
//     ListItem('Аудио запись', 'Месяц назад', Colors.red, Icons.audiotrack),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('iOS Long Press with Preview'),
//       ),
//       body: ListView.builder(
//         padding: EdgeInsets.all(16),
//         itemCount: items.length,
//         itemBuilder: (context, index) {
//           return IOSLongPressListItem(
//             item: items[index],
//             onActionSelected: (action) {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(
//                   content: Text('Выбрано: $action для "${items[index].title}"'),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

// class ListItem {
//   final String title;
//   final String subtitle;
//   final Color color;
//   final IconData icon;

//   ListItem(this.title, this.subtitle, this.color, this.icon);
// }

// class IOSLongPressListItem extends StatefulWidget {
//   final ListItem item;
//   final Function(String) onActionSelected;

//   const IOSLongPressListItem({
//     Key? key,
//     required this.item,
//     required this.onActionSelected,
//   }) : super(key: key);

//   @override
//   _IOSLongPressListItemState createState() => _IOSLongPressListItemState();
// }

// class _IOSLongPressListItemState extends State<IOSLongPressListItem>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _scaleAnimation;
//   bool _isPressed = false;
//   OverlayEntry? _previewOverlay;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: Duration(milliseconds: 150),
//       vsync: this,
//     );
//     _scaleAnimation = Tween<double>(begin: 1.0, end: 0.97).animate(
//       CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     _removePreview();
//     super.dispose();
//   }

//   void _showPreview(Offset globalPosition) {
//     _removePreview();
    
//     _previewOverlay = OverlayEntry(
//       builder: (context) => Positioned(
//         left: globalPosition.dx - 100,
//         top: globalPosition.dy - 120,
//         child: Material(
//           color: Colors.transparent,
//           child: Container(
//             width: 200,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(14),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.2),
//                   blurRadius: 20,
//                   spreadRadius: 2,
//                 ),
//               ],
//             ),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 // Превью элемента
//                 Container(
//                   padding: EdgeInsets.all(16),
//                   child: Column(
//                     children: [
//                       Container(
//                         width: 60,
//                         height: 60,
//                         decoration: BoxDecoration(
//                           color: widget.item.color.withOpacity(0.1),
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         child: Icon(
//                           widget.item.icon,
//                           size: 32,
//                           color: widget.item.color,
//                         ),
//                       ),
//                       SizedBox(height: 12),
//                       Text(
//                         widget.item.title,
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w600,
//                         ),
//                         textAlign: TextAlign.center,
//                         maxLines: 2,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                       SizedBox(height: 4),
//                       Text(
//                         widget.item.subtitle,
//                         style: TextStyle(
//                           fontSize: 12,
//                           color: Colors.grey[600],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Divider(height: 1, color: Colors.grey[300]),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );

//     Overlay.of(context).insert(_previewOverlay!);
//   }

//   void _removePreview() {
//     _previewOverlay?.remove();
//     _previewOverlay = null;
//   }

//   void _onLongPressStart(LongPressStartDetails details) {
//     HapticFeedback.mediumImpact();
//     _showPreview(details.globalPosition);
    
//     // Через 0.6 секунд показываем полноценное меню
//     Future.delayed(Duration(milliseconds: 600), () {
//       if (_previewOverlay != null) {
//         _showContextMenu(details.globalPosition);
//       }
//     });
//   }

//   void _onLongPressEnd(LongPressEndDetails details) {
//     _removePreview();
//     _controller.reverse();
//   }

//   void _showContextMenu(Offset position) {
//     showModalBottomSheet(
//       context: context,
//       backgroundColor: Colors.transparent,
//       builder: (context) => _buildIOSContextMenu(position),
//     ).then((_) {
//       _removePreview();
//     });
//   }

//   Widget _buildIOSContextMenu(Offset position) {
//     return Container(
//       margin: EdgeInsets.all(16),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           // Карточка с превью элемента
//           _buildPreviewCard(),
//           SizedBox(height: 8),
//           // Меню действий
//           Container(
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(14),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.15),
//                   blurRadius: 30,
//                   spreadRadius: 0,
//                 ),
//               ],
//             ),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 _buildMenuItem(
//                   'Открыть',
//                   Icons.open_in_new,
//                   Colors.blue,
//                   'open',
//                 ),
//                 _buildMenuItem(
//                   'Копировать',
//                   Icons.content_copy,
//                   Colors.green,
//                   'copy',
//                 ),
//                 _buildMenuItem(
//                   'Переименовать',
//                   Icons.edit,
//                   Colors.orange,
//                   'rename',
//                 ),
//                 _buildMenuItem(
//                   'Поделиться',
//                   Icons.share,
//                   Colors.purple,
//                   'share',
//                 ),
//                 Divider(height: 1, color: Colors.grey[300]),
//                 _buildMenuItem(
//                   'Удалить',
//                   Icons.delete,
//                   Colors.red,
//                   'delete',
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 8),
//           // Кнопка отмены
//           Container(
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(14),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.15),
//                   blurRadius: 30,
//                   spreadRadius: 0,
//                 ),
//               ],
//             ),
//             child: _buildCancelButton(),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildPreviewCard() {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(14),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.15),
//             blurRadius: 20,
//             spreadRadius: 0,
//           ),
//         ],
//       ),
//       child: Padding(
//         padding: EdgeInsets.all(16),
//         child: Row(
//           children: [
//             Container(
//               width: 50,
//               height: 50,
//               decoration: BoxDecoration(
//                 color: widget.item.color.withOpacity(0.1),
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Icon(
//                 widget.item.icon,
//                 size: 28,
//                 color: widget.item.color,
//               ),
//             ),
//             SizedBox(width: 16),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     widget.item.title,
//                     style: TextStyle(
//                       fontSize: 17,
//                       fontWeight: FontWeight.w600,
//                     ),
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                   SizedBox(height: 4),
//                   Text(
//                     widget.item.subtitle,
//                     style: TextStyle(
//                       fontSize: 14,
//                       color: Colors.grey[600],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildMenuItem(String title, IconData icon, Color color, String action) {
//     return Material(
//       color: Colors.transparent,
//       child: InkWell(
//         onTap: () {
//           Navigator.pop(context);
//           widget.onActionSelected(action);
//         },
//         borderRadius: BorderRadius.circular(8),
//         child: Container(
//           padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
//           child: Row(
//             children: [
//               Container(
//                 width: 30,
//                 height: 30,
//                 decoration: BoxDecoration(
//                   color: color.withOpacity(0.1),
//                   borderRadius: BorderRadius.circular(6),
//                 ),
//                 child: Icon(
//                   icon,
//                   size: 18,
//                   color: color,
//                 ),
//               ),
//               SizedBox(width: 16),
//               Text(
//                 title,
//                 style: TextStyle(
//                   fontSize: 17,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//               Spacer(),
//               if (action == 'delete')
//                 Text(
//                   'Будет удалено',
//                   style: TextStyle(
//                     fontSize: 14,
//                     color: Colors.grey,
//                   ),
//                 ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildCancelButton() {
//     return Material(
//       color: Colors.transparent,
//       child: InkWell(
//         onTap: () => Navigator.pop(context),
//         borderRadius: BorderRadius.circular(14),
//         child: Container(
//           padding: EdgeInsets.symmetric(vertical: 18),
//           child: Center(
//             child: Text(
//               'Отмена',
//               style: TextStyle(
//                 fontSize: 17,
//                 fontWeight: FontWeight.w600,
//                 color: Colors.blue,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ScaleTransition(
//       scale: _scaleAnimation,
//       child: GestureDetector(
//         onTapDown: (_) {
//           setState(() => _isPressed = true);
//           _controller.forward();
//         },
//         onTapUp: (_) {
//           setState(() => _isPressed = false);
//           _controller.reverse();
//         },
//         onTapCancel: () {
//           setState(() => _isPressed = false);
//           _controller.reverse();
//         },
//         onLongPressStart: _onLongPressStart,
//         onLongPressEnd: _onLongPressEnd,
//         child: AnimatedContainer(
//           duration: Duration(milliseconds: 150),
//           margin: EdgeInsets.only(bottom: 12),
//           decoration: BoxDecoration(
//             color: _isPressed ? Colors.grey[100] : Colors.white,
//             borderRadius: BorderRadius.circular(12),
//             border: Border.all(
//               color: _isPressed ? Colors.blue.withOpacity(0.3) : Colors.grey[200],
//               width: 1.5,
//             ),
//             boxShadow: _isPressed
//                 ? [
//                     BoxShadow(
//                       color: Colors.blue.withOpacity(0.1),
//                       blurRadius: 10,
//                       spreadRadius: 2,
//                     )
//                   ]
//                 : [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.05),
//                       blurRadius: 6,
//                       spreadRadius: 1,
//                     )
//                   ],
//           ),
//           child: Padding(
//             padding: EdgeInsets.all(16),
//             child: Row(
//               children: [
//                 Container(
//                   width: 48,
//                   height: 48,
//                   decoration: BoxDecoration(
//                     color: widget.item.color.withOpacity(0.1),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Icon(
//                     widget.item.icon,
//                     color: widget.item.color,
//                   ),
//                 ),
//                 SizedBox(width: 16),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         widget.item.title,
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                       SizedBox(height: 4),
//                       Text(
//                         widget.item.subtitle,
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: Colors.grey[600],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Icon(
//                   Icons.chevron_right,
//                   color: Colors.grey[400],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }