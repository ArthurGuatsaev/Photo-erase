import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
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
    return AdaptiveContextMenu(
      previewBuilder: (context) {
        return SizedBox(height: 100, width: 100, child: child);
      },
      actions: [
        AdaptiveContextMenuAction(
          title: 'Edit',
          icon: PlatformInfo.isIOS ? CupertinoIcons.pencil : Icons.edit,
          onPressed: () {
            print('Edit pressed');
          },
        ),
        AdaptiveContextMenuAction(
          title: 'Share',
          icon: PlatformInfo.isIOS ? CupertinoIcons.share : Icons.share,
          onPressed: () {
            print('Share pressed');
          },
        ),
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
