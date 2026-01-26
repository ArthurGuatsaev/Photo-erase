import 'package:erasica/features/widgets/pop/sheet.dart';
import 'package:flutter/material.dart';
import '../../../../widgets/items/photo_item.dart';
import '../../../../widgets/pop_up_content/showing_removing_buttons.dart';

class GalleryPhotoItem extends StatelessWidget {
  const GalleryPhotoItem({super.key, required this.galleryPhoto});

  final String galleryPhoto;

  @override
  Widget build(BuildContext context) {
    final borderRadius = 4.0;
    return Stack(
      fit: StackFit.expand,
      children: [
        PhotoItem(path: galleryPhoto, borderRadiusValue: borderRadius),
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              showAppSheet(context, ShowingRemovingButtons());
            },
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
      ],
    );
  }
}
