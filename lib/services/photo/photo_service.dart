import 'dart:async';
import 'dart:typed_data';
import '../../entities/photo/photo.dart';

abstract class PhotoService {
  Future<void> getPhotos();
  Future<void> deletePhoto(Photo photo);
  Future<void> deletePhotos(List<Photo> photos);
  Future<Photo> savePhoto(Photo photo);
  Future<Photo> updatePhoto(Photo photo, String newPath);
  Stream<List<Photo>> watchPhotos();
  Future<Photo> pickImage();
  Future<String> saveAfterChange(Uint8List bytes);
  Future<void> sharePhotos(List<Photo> photos);
}
