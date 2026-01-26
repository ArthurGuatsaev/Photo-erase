import 'package:bloc/bloc.dart';
import 'package:erasica/core/const/system_untils.dart';
import 'package:erasica/services/gallery_photos/gallery_photo_service.dart';
import 'package:flutter/animation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../services/gallery_photos/gallery_load_process.dart';

part 'gallery_state.dart';

@injectable
class GalleryCubit extends Cubit<GalleryState> {
  GalleryCubit({required GalleryPhotoService service})
    : _galleryPhotoService = service,
      super(GalleryAllowInitial()) {
    _galleryPhotoService.watchGalleryPhotos().listen(onHandle);
  }
  final GalleryPhotoService _galleryPhotoService;
  Future<void> onLoad() async {
    await _galleryPhotoService.loadGalleryPhotos();
  }

  Future<void> onPressAllow({required VoidCallback onEnd}) async {
    try {
      await _galleryPhotoService.openGallery();
      onEnd();
    } catch (e) {
      dprint(e.toString());
    }
  }

  void onHandle(GalleryLoadProcess status) {
    switch (status.status) {
      case GalleryLoadStatus.loaded:
        status.photos.isEmpty
            ? emit(GalleryAllowInitial())
            : emit(GalleryWithPhotos(galleryPhotos: status.photos));
      case GalleryLoadStatus.needToSettings:
        emit(GalleryNoAccess());
      default:
        emit(GalleryAllowInitial());
    }
  }
}
