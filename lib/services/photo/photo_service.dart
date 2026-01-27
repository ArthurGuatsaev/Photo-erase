import 'dart:async';
import 'dart:typed_data';
import '../../entities/photo/photo.dart';

abstract class PhotoService {
  Future<void> getPhotos();
  Future<void> deletePhoto(String id);
  Future<void> savePhoto(Photo photo);
  Future<void> updatePhoto(Photo photo, String newPath);
  Stream<List<Photo>> watchPhotos();
  Future<String> pickImage();
  Future<String> saveAfterChange(Uint8List bytes);
}
