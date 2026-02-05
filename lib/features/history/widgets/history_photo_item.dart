import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/theme/app_theme.dart';
import '../../../entities/photo/photo.dart';
import '../../../main.dart';
import '../../main/blocs/photo/photo_bloc.dart';
import '../../widgets/items/photo_item.dart';
import '../../widgets/pop_up_content/pop_up_context_menu.dart';
import '../bloc/history_bloc.dart';
import 'history_selected_icon.dart';
import 'overlay_dialog.dart';

class HistoryPhotoItem extends StatelessWidget {
  const HistoryPhotoItem({super.key, required this.photo});

  final Photo photo;

  @override
  Widget build(BuildContext context) {
    final photoBloc = context.read<PhotoBloc>();
    return Stack(
      children: [
        LongPressContextMenu(
          key: ValueKey(photo.photoPath),
          actions: [
            IOSContextMenuAction(
              title: 'context_menu_share',
              icon: CupertinoIcons.share,
              onPressed: () {
                final render = context.findRenderObject() as RenderBox;
                photoBloc.add(
                  PressSharePhotos(photos: [photo], render: render),
                );
              },
            ),
            IOSContextMenuAction(
              title: 'context_menu_edit',
              icon: CupertinoIcons.create,
              onPressed: () {
                photoBloc.add(PressEditPhoto(photo: photo));
              },
            ),
            IOSContextMenuAction(
              withDivider: true,
              title: 'context_menu_delete',
              icon: CupertinoIcons.delete,
              textColor: const Color.fromRGBO(226, 17, 17, 1),
              onPressed: () {
                photoBloc.add(
                  PressDeletePhotos(
                    photos: [photo],
                    backCallback: appRouter.maybePop,
                  ),
                );
              },
            ),
          ],
          child: PhotoItem(
            borderRadiusValue: context.item.historyPhotoItemData.borderRadius,
            path: photo.photoPath,
          ),
        ),

        //TODO реализация как в signica
        // AnchorMenu(
        //   minEdgePadding: 0,
        //   useLongPress: true,
        //   onMenuOpen: () {},
        //   onMenuClose: () {},
        //   menuBuilder: (close) => PhotoMenu(
        //     close: appRouter.maybePop,
        //     onEdit: () {
        //       photoBloc.add(PressEditPhoto(photo: photo));
        //     },
        //     onShare: () {
        //       final render = context.findRenderObject() as RenderBox;
        //       photoBloc.add(PressSharePhotos(photos: [photo], render: render));
        //     },
        //     onDelete: () {
        //       photoBloc.add(
        //         PressDeletePhotos(
        //           ids: [photo.id],
        //           backCallback: appRouter.maybePop,
        //         ),
        //       );
        //     },
        //   ),
        //   child: PhotoItem(
        //     borderRadiusValue: context.item.historyPhotoItemData.borderRadius,
        //     path: photo.photoPath,
        //   ),
        // ),
        GestureDetector(
          onTap: () =>
              context.read<HistoryBloc>().add(PressSelectItem(photo: photo)),
          child: HistorySelectedIcon(photo: photo),
        ),
      ],
    );
  }
}
