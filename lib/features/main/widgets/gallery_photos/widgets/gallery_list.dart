import 'package:erasica/core/const/system_untils.dart';
import 'package:erasica/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import '../../../../widgets/wrapper/list_horizontal.dart';
import 'gallery_photo_item.dart';

class GalleryList extends StatelessWidget {
  const GalleryList({super.key, required this.galleryPhotoList});

  final List<String>? galleryPhotoList;

  @override
  Widget build(BuildContext context) {
    final listData = context.itemsList.galleryPhotoItemsData;
    final gridDelegate = SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: listData.crossAxisCount,
      childAspectRatio: listData.childAspectRatio,
      mainAxisSpacing: listData.mainAxisSpacing,
      crossAxisSpacing: listData.crossAxisSpacing,
    );
    return ListHorizontalWrapper(
      aspectValue: listData.horizontalBoxAspect,
      child: listData.horizontalBoxAspect != null
          ? GridView.builder(
              scrollDirection: listData.scrollDirrection,
              itemCount: galleryPhotoList!.length,
              gridDelegate: gridDelegate,
              itemBuilder: (context, index) {
                final galleryPhoto = galleryPhotoList![index];
                dprint(galleryPhoto);
                return GalleryPhotoItem(galleryPhoto: galleryPhoto);
              },
            )
          : SliverGrid.builder(
              itemCount: galleryPhotoList!.length,
              gridDelegate: gridDelegate,
              itemBuilder: (context, index) {
                final galleryPhoto = galleryPhotoList![index];
                return GalleryPhotoItem(galleryPhoto: galleryPhoto);
              },
            ),
    );
  }
}
