import 'package:erasica/core/theme/app_theme.dart';
import 'package:erasica/features/history/bloc/history_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../entities/photo/photo.dart';
import '../../widgets/items/photo_item.dart';
import '../../widgets/pop_up_content/pop_up_context_menu.dart';
import 'history_selected_icon.dart';

class HistoryPhotoList extends StatelessWidget {
  const HistoryPhotoList({super.key, required this.photos});
  final List<Photo> photos;
  @override
  Widget build(BuildContext context) {
    final listData = context.itemsList.historyPhotoItemsData;
    final itemData = context.item.historyPhotoItemData;
    final longPressData = context.longPress.historyPhotoData;
    final bloc = context.read<HistoryBloc>();
    return SliverGrid.builder(
      itemCount: photos.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: listData.crossAxisCount,
        childAspectRatio: listData.childAspectRatio,
        crossAxisSpacing: listData.crossAxisSpacing,
        mainAxisSpacing: listData.mainAxisSpacing,
      ),
      itemBuilder: (context, index) {
        final photo = photos[index];
        return Stack(
          children: [
            AppContextMenu(
              styleData: longPressData,
              child: PhotoItem(
                borderRadiusValue: itemData.borderRadius,
                path: photo.photoPath,
              ),
            ),
            GestureDetector(
              onTap: () => bloc.add(PressSelectItem(id: photo.id)),
              child: HistorySelectedIcon(id: photo.id),
            ),
          ],
        );
      },
    );
  }
}
