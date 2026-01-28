import 'package:erasica/core/const/system_untils.dart';
import 'package:erasica/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

import '../../../entities/photo/photo.dart';
import '../../widgets/wrapper/box_with_title.dart';
import '../../widgets/wrapper/list_horizontal.dart';
import '../../widgets/items/photo_item.dart';

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
      child: ListHorizontalWrapper(
        aspectValue: listData.horizontalBoxAspect,
        withoutGlass: true,

        // если в теме поменяется направление списка предусматриваем
        child: listData.horizontalBoxAspect != null
            ? GridView.builder(
                scrollDirection: listData.scrollDirrection,
                gridDelegate: gridDelegate,
                padding: paddintData.pagePadding,
                itemCount: photoList.length,
                itemBuilder: (context, index) {
                  final photo = photoList[index];
                  dprint(photo.photoPath);
                  return PhotoItem(path: photo.photoPath);
                },
              )
            : SliverPadding(
                padding: context.appWidget.data.pagePadding,
                sliver: SliverGrid.builder(
                  gridDelegate: gridDelegate,
                  itemCount: photoList.length,
                  itemBuilder: (context, index) {
                    final photo = photoList[index];
                    return PhotoItem(path: photo.toString());
                  },
                ),
              ),
      ),
    );
  }
}
