import 'dart:async';
import 'dart:typed_data';
import 'package:erasica/data/repository.dart';
import 'package:erasica/entities/photo/photo.dart';
import 'package:erasica/main.dart';
import 'package:erasica/services/app/app_service.dart';
import 'package:erasica/services/photo/photo_service.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:share_plus/share_plus.dart';
import 'package:uuid/uuid.dart';

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
  Future<void> deletePhoto(Photo photo) async {
    await _repository.deleteItem(photo.id);
    await deleteFiles([photo]);
  }

  @override
  Future<void> deletePhotos(List<Photo> photos) async {
    final ids = photos.map((e) => e.id).toList();
    await _repository.deleteItems(ids);
    await deleteFiles(photos);
  }

  @override
  Future<void> getPhotos() async {
    await _repository.get();
  }

  @override
  Future<Photo> savePhoto(Photo photo) async {
    final path = await _appService.saveAsFileFromPath(photo.photoPath);
    final initialPath = await _appService.saveAsFileFromPath(photo.initialPath);
    final id = const Uuid().v4();
    return await _repository.create(
      photo.copyWith(photoPath: path, initialPath: initialPath, id: id),
    );
  }

  @override
  Future<Photo> updatePhoto(Photo photo, String newPath) async {
    final path = await _appService.saveAsFileFromPath(newPath);
    return await _repository.create(
      photo.copyWith(date: DateTime.now(), photoPath: path),
    );
  }

  Future<Photo> changeAppPathByTmp(Photo photo) async {
    final path = await _appService.changeFilePathByTmp(photo.photoPath);
    return photo.copyWith(photoPath: path);
  }

  @override
  Stream<List<Photo>> watchPhotos() {
    return _repository.watch();
  }

  @override
  Future<Photo> pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) throw 'User doesnt pick image';
    return await savePhoto(Photo.create(path: image.path));
  }

  @override
  Future<String> saveAfterChange(Uint8List bytes) async {
    return await _appService.saveAsFile(bytes, tmp: true);
  }

  @override
  Future<void> sharePhotos(List<Photo> photos) async {
    final render =
        appRouter.navigatorKey.currentContext?.findRenderObject() as RenderBox?;
    if (render == null) return;
    await SharePlus.instance.share(
      ShareParams(
        files: photos.map((e) => XFile(e.photoPath)).toList(),
        sharePositionOrigin: render.localToGlobal(Offset.zero) & render.size,
      ),
    );
  }

  Future<void> deleteFiles(List<Photo> photos) async {
    for (var photo in photos) {
      await _appService.deleteFile(photo.photoPath);
      await _appService.deleteFile(photo.initialPath);
    }
  }
}
