import 'dart:async';

import 'package:erasica/core/const/system_untils.dart';
import 'package:erasica/core/di/di.dart';
import 'package:erasica/data/photo/local/photo_model.dart';
import 'package:erasica/services/app/app_service.dart';
import 'package:path/path.dart';

import '../../entities/photo/photo.dart';

class PhotoConverter {
  static PhotoModel toPhotoModel(Photo photo) {
    return PhotoModel(
      id: photo.id,
      photoPath: photo.photoPath.lastPath,
      date: photo.date,
    );
  }

  static Photo toPhoto(PhotoModel photoModel) {
    final directory = getIt<AppService>().applicationDirectory;
    return Photo(
      id: photoModel.id,
      photoPath: join(directory.path + photoModel.photoPath),
      date: photoModel.date,
    );
  }

  static final StreamTransformer<List<PhotoModel>, List<Photo>>
  streamTransformer = StreamTransformer.fromHandlers(
    handleData: (entities, sink) {
      sink.add(entities.map((e) => toPhoto(e)).toList());
    },
  );
}
