import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';
import '../../../entities/photo/photo.dart';
import '../../widgets/wrapper/box_with_title.dart';
import '../../widgets/wrapper/list_horizontal.dart';
import 'main_photo_item.dart';

class MainHistoryList extends StatelessWidget {
  const MainHistoryList({super.key, required this.photoList});
  final List<Photo> photoList;
  @override
  Widget build(BuildContext context) {
    final paddintData = context.appWidget.data;
    final listData = context.itemsList.mainPhotoItemsData;
    final gridDelegate = SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: listData.crossAxisCount,
      mainAxisSpacing: listData.mainAxisSpacing,
      crossAxisSpacing: listData.crossAxisSpacing,
      childAspectRatio: listData.childAspectRatio,
    );
    return BoxWithTitleWrapper(
      title: 'history_box_title',
      showMore: photoList.isNotEmpty ? 'show_more_photo' : null,
      child: listData.horizontalBoxAspect != null && listData.isHorizontal
          ? ListHorizontalWrapper(
              aspectValue: listData.horizontalBoxAspect,
              withoutGlass: true,
              child: GridView.builder(
                scrollDirection: listData.scrollDirrection,
                gridDelegate: gridDelegate,
                padding: paddintData.pagePadding,
                itemCount: photoList.length,
                itemBuilder: (context, index) {
                  final photo = photoList[index];
                  return MainPhotoItem(photo: photo);
                },
              ),
            )
          : SliverPadding(
              padding: context.appWidget.data.pagePadding,
              sliver: SliverGrid.builder(
                gridDelegate: gridDelegate,
                itemCount: photoList.length,
                itemBuilder: (context, index) {
                  final photo = photoList[index];
                  return MainPhotoItem(photo: photo);
                },
              ),
            ),
    );
  }
}
