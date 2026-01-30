import 'package:erasica/core/theme/app_theme.dart';
import 'package:erasica/features/widgets/pop/sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../widgets/items/photo_item.dart';
import '../../../../widgets/pop_up_content/sheet_removing_buttons.dart';
import '../../../bloc/photo_bloc.dart';

class GalleryPhotoItem extends StatelessWidget {
  const GalleryPhotoItem({super.key, required this.galleryPhoto});

  final String galleryPhoto;

  @override
  Widget build(BuildContext context) {
    final photoData = context.item.galleryPhotoItemData;
    final photoBloc = context.read<PhotoBloc>();
    return Stack(
      fit: StackFit.expand,
      children: [
        PhotoItem(
          path: galleryPhoto,
          borderRadiusValue: photoData.borderRadius,
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              showAppSheet(context, SheetRemovingButtons(photoBloc: photoBloc));
            },
            borderRadius: BorderRadius.circular(photoData.borderRadius),
          ),
        ),
      ],
    );
  }
}
