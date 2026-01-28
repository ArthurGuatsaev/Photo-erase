import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:erasica/data/repository.dart';
import 'package:erasica/entities/photo/photo.dart';
import 'package:erasica/services/app/app_service.dart';
import 'package:erasica/services/photo/photo_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: PhotoService)
class PhotoServiceImpl implements PhotoService {
  PhotoServiceImpl({
    required Repository<Photo> repository,
    required AppService appService,
  }) : _appService = appService,
       _repository = repository;

  final Repository<Photo> _repository;
  final AppService _appService;
  @override
  Future<void> deletePhoto(String id) async {
    await _repository.deleteItem(id);
  }

  @override
  Future<void> deletePhotos(List<String> ids) async {
    await _repository.deleteItems(ids);
  }

  @override
  Future<void> getPhotos() async {
    await _repository.get();
  }

  @override
  Future<void> savePhoto(Photo photo) async {
    final path = await _appService.saveAsFileFromPath(photo.photoPath);
    await _repository.create(photo.copyWith(photoPath: path));
  }

  @override
  Future<void> updatePhoto(Photo photo, String newPath) async {
    await File(newPath).copy(photo.photoPath);
    await savePhoto(photo);
  }

  @override
  Stream<List<Photo>> watchPhotos() {
    return _repository.watch();
  }

  @override
  Future<String> pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) throw 'User doesnt pick image';
    return image.path;
  }

  @override
  Future<String> saveAfterChange(Uint8List bytes) async {
    return await _appService.saveAsFile(bytes, tmp: true);
  }
}
