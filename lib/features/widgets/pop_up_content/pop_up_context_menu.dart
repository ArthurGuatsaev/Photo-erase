import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:cupertino_context_menu_plus/cupertino_context_menu_plus.dart';
import 'package:erasica/core/theme/widget_styles/longpress_size.dart';
import 'package:erasica/features/widgets/text/text_row.dart';
import 'package:erasica/features/widgets/wrapper/grass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/text/texts.dart';

// class AppContextMenu extends StatelessWidget {
//   const AppContextMenu({
//     super.key,
//     required this.child,
//     required this.styleData,
//   });
//   final LongpressSize styleData;
//   final Widget child;

//   @override
//   Widget build(BuildContext context) {
//     // TODO только ios & android
//     return AdaptiveContextMenu(
//       previewBuilder: (context) {
//         return SizedBox(height: 100, width: 100, child: child);
//       },
//       actions: [
//         AdaptiveContextMenuAction(
//           icon: PlatformInfo.isIOS ? CupertinoIcons.share : Icons.share,
//           title: 'Share',
//           onPressed: () {
//             print('Share pressed');
//           },
//         ),
//         AdaptiveContextMenuAction(
//           title: 'Edit',
//           icon: PlatformInfo.isIOS ? CupertinoIcons.pencil : Icons.edit,
//           onPressed: () {
//             print('Edit pressed');
//           },
//         ),
//         //TODO проверить дивайдер
//         AdaptiveContextMenuAction(
//           title: 'Delete',
//           icon: PlatformInfo.isIOS ? CupertinoIcons.trash : Icons.delete,
//           isDestructive: true,
//           onPressed: () {
//             print('Delete pressed');
//           },
//         ),
//       ],
//       child: Material(
//         color: Colors.transparent,
//         child: ConstrainedBox(
//           constraints: BoxConstraints(
//             maxHeight: styleData.height,
//             maxWidth: styleData.width,
//           ),
//           child: child,
//         ),
//       ),
//     );
//   }
// }
class AppContextMenu extends StatefulWidget {
  const AppContextMenu({
    super.key,
    required this.child,
    required this.styleData,
  });
  final LongpressSize styleData;
  final Widget child;

  @override
  State<AppContextMenu> createState() => _AppContextMenuState();
}

class _AppContextMenuState extends State<AppContextMenu> {
  final controller = CupertinoContextMenuPlusController();

  @override
  Widget build(BuildContext context) {
    return CupertinoContextMenuPlus(
      controller: controller,
      openGestureEnabled: false,
      onOpened: () => debugPrint('Context menu opened'),
      location: CupertinoContextMenuLocation.center,
      showGrowAnimation: true,
      backdropBlurSigma: 8,
      backdropBlurCurve: Interval(0.0, 0.25, curve: Curves.easeOut),
      backdropBlurReverseCurve: Curves.easeIn,
      modalReverseTransitionDuration: Duration(milliseconds: 250),
      barrierColor: const Color(0x3304040F),
      bottomWidgetBuilder: (context) => GlassWrapper(
        borderRadius: 16,
        child: ClipRSuperellipse(
          borderRadius: BorderRadius.circular(16),
          child: Material(
            color: Colors.transparent,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 220),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ContextMenuRow(),
                  ContextMenuRow(),
                  ContextMenuRow(),
                ],
              ),
            ),
          ),
        ),
      ),
      child: GestureDetector(
        onLongPress: controller.open,
        child: Material(
          color: Colors.transparent,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: widget.styleData.height,
              minWidth: widget.styleData.width,
            ),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}

class ContextMenuRow extends StatelessWidget {
  const ContextMenuRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      child: Row(
        spacing: 8.w,
        children: [
          Icon(CupertinoIcons.share, color: Colors.white),
          Flexible(
            child: TextRow(
              text: 'context_menu_share',
              style: TextStyle(
                fontSize: 17.sp,
                fontFamily: font(FontWeight.w400),
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
