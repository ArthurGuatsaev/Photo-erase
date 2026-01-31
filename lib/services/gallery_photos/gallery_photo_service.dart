abstract class GalleryPhotoService {
  Future<void> loadGalleryPhotos();
  Future<void> openGallery();
  Stream<List<String>> watchGalleryPhotos();
}
