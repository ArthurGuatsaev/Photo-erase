import 'package:erasica/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import '../../../entities/photo/photo.dart';
import '../../widgets/items/photo_item.dart';
import 'history_selected_icon.dart';

class PhotoList extends StatelessWidget {
  const PhotoList({super.key, required this.photos});
  final List<Photo> photos;
  @override
  Widget build(BuildContext context) {
    final listData = context.itemsList.historyPhotoItemsData;
    final itemData = context.item.historyPhotoItemData;
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
        return PhotoItem(
          //TODO реализовать длительное нажатие overlay
          borderRadiusValue: itemData.borderRadius,
          path: photo.toString(),
          child: HistorySelectedIcon(currentIndex: index),
        );
      },
    );
  }
}
