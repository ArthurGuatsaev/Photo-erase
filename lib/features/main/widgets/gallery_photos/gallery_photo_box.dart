import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../widgets/wrapper/box_with_title.dart';
import 'gallery_cubit.dart';
import 'widgets/allowing_button.dart';
import 'package:flutter/material.dart';
import 'widgets/gallery_list.dart';

class GalleryPhotoBox extends StatelessWidget {
  const GalleryPhotoBox({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GalleryCubit, GalleryState>(
      builder: (context, state) {
        if (state is GalleryWithPhotos) {
          return BoxWithTitleWrapper(
            title: 'gallery_photo_title',
            child: GalleryList(galleryPhotoList: state.galleryPhotos),
          );
        }
        return AllowingButton();
      },
    );
  }
}
