import 'package:erasica/core/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../entities/photo/photo.dart';
import 'history_photo_item.dart';

class HistoryPhotoList extends StatelessWidget {
  const HistoryPhotoList({super.key, required this.photos});
  final List<Photo> photos;
  @override
  Widget build(BuildContext context) {
    final listData = context.itemsList.historyPhotoItemsData;
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
        return HistoryPhotoItem(photo: photo);
      },
    );
  }
}
