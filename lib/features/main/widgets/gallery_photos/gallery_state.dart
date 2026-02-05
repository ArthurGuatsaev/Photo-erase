part of 'gallery_cubit.dart';

@immutable
sealed class GalleryState {}

final class GalleryAllowInitial extends GalleryState {}

final class GalleryNoAccess extends GalleryState {}

final class GalleryLoading extends GalleryState {}

final class GalleryWithPhotos extends GalleryState {
  final List<String> galleryPhotos;
  GalleryWithPhotos({required this.galleryPhotos});
}
