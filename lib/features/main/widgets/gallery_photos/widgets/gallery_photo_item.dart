import 'package:erasica/core/theme/app_theme.dart';
import 'package:erasica/features/main/widgets/gallery_photos/gallery_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../widgets/items/photo_item.dart';
import '../../../blocs/photo/photo_bloc.dart';

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
              context.read<GalleryCubit>().pickImage(galleryPhoto, photoBloc);
            },
            borderRadius: BorderRadius.circular(photoData.borderRadius),
          ),
        ),
      ],
    );
  }
}
