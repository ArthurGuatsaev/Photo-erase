import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'dart:math' as math;
import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart';
import 'package:photo_manager/photo_manager.dart';
import '../../core/exceptions/app_exceptions.dart';
import 'gallery_photo_service.dart';

@LazySingleton(as: GalleryPhotoService)
class GalleryPhotosServiceImpl implements GalleryPhotoService {
  GalleryPhotosServiceImpl({@pathParam required Directory directory})
    : _directory = Directory(join(directory.path, 'gallery'));
  final Directory _directory;
  final StreamController<List<String>> watchGalleryLoad = StreamController();

  //TODO: уточнить какое количество фотографий мы загружаем
  //TODO: настроить для андроид photo manager
  @override
  Future<void> openGallery() async {
    final permissionState = await PhotoManager.requestPermissionExtend();
    if (permissionState.hasAccess) {
      final photos = await _handleGallery(10);
      await _savePhotosToFileSystem(photos);
      await loadGalleryPhotos();
    } else {
      throw PermissionException('User: Not permission');
    }
  }

  @override
  Future<void> loadGalleryPhotos() async {
    if (await _directory.exists()) {
      final savedPhotos = _directory.listSync().map((e) => e.path).toList();
      watchGalleryLoad.add(savedPhotos);
    }
  }

  @override
  Stream<List<String>> watchGalleryPhotos() {
    return watchGalleryLoad.stream;
  }

  Future<List<AssetEntity>> _handleGallery(int photosCount) async {
    try {
      final paths = await PhotoManager.getAssetPathList(
        onlyAll: true,
        type: RequestType.image,
      );
      if (paths.isEmpty) return [];
      final AssetPathEntity recent = paths.first;
      final int totalPhotoCount = await recent.assetCountAsync;
      final int end = math.min(photosCount, totalPhotoCount);
      return await recent.getAssetListRange(start: 0, end: end);
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  Future<void> _savePhotosToFileSystem(List<AssetEntity> photos) async {
    for (var i = 0; i < photos.length; i++) {
      await _directory.create();
      final path = (await photos[i].file)?.path;
      if (path == null) continue;
      await File(path).copy(join(_directory.path, '$i.png'));
    }
  }
}
