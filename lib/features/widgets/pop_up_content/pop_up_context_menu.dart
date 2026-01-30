import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:cupertino_context_menu_plus/cupertino_context_menu_plus.dart';
import 'package:erasica/core/theme/widget_styles/longpress_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppContextMenu extends StatelessWidget {
  const AppContextMenu({
    super.key,
    required this.child,
    required this.styleData,
  });
  final LongpressSize styleData;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    // TODO только ios & android
    return AdaptiveContextMenu(
      previewBuilder: (context) {
        return SizedBox(height: 100, width: 100, child: child);
      },
      actions: [
        AdaptiveContextMenuAction(
          icon: PlatformInfo.isIOS ? CupertinoIcons.share : Icons.share,
          title: 'Share',
          onPressed: () {
            print('Share pressed');
          },
        ),
        AdaptiveContextMenuAction(
          title: 'Edit',
          icon: PlatformInfo.isIOS ? CupertinoIcons.pencil : Icons.edit,
          onPressed: () {
            print('Edit pressed');
          },
        ),
        //TODO проверить дивайдер
        AdaptiveContextMenuAction(
          title: 'Delete',
          icon: PlatformInfo.isIOS ? CupertinoIcons.trash : Icons.delete,
          isDestructive: true,
          onPressed: () {
            print('Delete pressed');
          },
        ),
      ],
      child: Material(
        color: Colors.transparent,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: styleData.height,
            maxWidth: styleData.width,
          ),
          child: child,
        ),
      ),
    );
  }
}
// class AppContextMenu extends StatefulWidget {
//   const AppContextMenu({
//     super.key,
//     required this.child,
//     required this.styleData,
//   });
//   final LongpressSize styleData;
//   final Widget child;

//   @override
//   State<AppContextMenu> createState() => _AppContextMenuState();
// }

// class _AppContextMenuState extends State<AppContextMenu> {
//   final controller = CupertinoContextMenuPlusController();

//   @override
//   Widget build(BuildContext context) {
//     return CupertinoContextMenuPlus(
//       controller: controller,
//       openGestureEnabled: false,
//       onOpened: () => debugPrint('Context menu opened'),
//       location: CupertinoContextMenuLocation.center,
//       showGrowAnimation: true,
//       backdropBlurSigma: 8,
//       backdropBlurCurve: Interval(0.0, 0.25, curve: Curves.easeOut),
//       backdropBlurReverseCurve: Curves.easeIn,
//       modalReverseTransitionDuration: Duration(milliseconds: 180),
//       barrierColor: const Color(0x3304040F),
//       // topWidget: Container(
//       //   decoration: BoxDecoration(color: Colors.amber),
//       //   height: 100,
//       //   width: 100,
//       // ),
//       bottomWidgetBuilder: (context) => ClipRSuperellipse(
//         borderRadius: BorderRadius.circular(16),
//         child: SizedBox(
//           width: 190,
//           child: ColoredBox(
//             color: CupertinoColors.systemRed,
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 CupertinoContextMenuAction(
//                   trailingIcon: CupertinoIcons.add,
//                   child: const Text('Replys'),
//                   onPressed: () {},
//                 ),
//                 CupertinoContextMenuAction(
//                   child: const Text('Replys'),
//                   onPressed: () {},
//                 ),
//                 CupertinoContextMenuAction(
//                   child: const Text('Replys'),
//                   onPressed: () {},
//                 ),
//                 CupertinoContextMenuAction(
//                   child: const Text('Replys'),
//                   onPressed: () {},
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//       child: GestureDetector(
//         onLongPress: controller.open,
//         child: Material(
//           color: Colors.transparent,
//           child: ConstrainedBox(
//             constraints: BoxConstraints(
//               maxHeight: widget.styleData.height,
//               maxWidth: widget.styleData.width,
//             ),
//             child: widget.child,
//           ),
//         ),
//       ),
//     );
//   }
// }
