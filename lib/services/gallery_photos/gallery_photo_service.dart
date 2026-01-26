import 'gallery_load_process.dart';

abstract class GalleryPhotoService {
  Future<void> loadGalleryPhotos();
  Future<void> openGallery();
  Stream<GalleryLoadProcess> watchGalleryPhotos();
}
