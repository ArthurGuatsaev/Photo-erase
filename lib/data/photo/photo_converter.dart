import 'dart:async';

import 'package:erasica/data/photo/local/photo_model.dart';

import '../../entities/photo/photo.dart';

class PhotoConverter {
  static PhotoModel toPhotoModel(Photo photo) {
    return PhotoModel(
      id: photo.id,
      photoPath: photo.photoPath,
      date: photo.date,
    );
  }

  static Photo toPhoto(PhotoModel photoModel) {
    return Photo(
      id: photoModel.id,
      photoPath: photoModel.photoPath,
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
