// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:erasica/data/local_repository.dart';
import 'package:erasica/data/photo/photo_converter.dart';
import 'package:erasica/entities/photo/photo.dart';
import 'package:injectable/injectable.dart';

import '../repository.dart';
import 'local/photo_model.dart';

@LazySingleton(as: Repository<Photo>)
class PhotoRepositoryImpl implements Repository<Photo> {
  final LocalDataSource<PhotoModel> _local;
  PhotoRepositoryImpl({required LocalDataSource<PhotoModel> local})
    : _local = local;
  @override
  Future<Photo> create(Photo item) async {
    final photoModel = await _local.create(PhotoConverter.toPhotoModel(item));
    return PhotoConverter.toPhoto(photoModel);
  }

  @override
  Future<void> deleteItem(String id) async {
    await _local.deleteItem(id);
  }

  @override
  Future<List<Photo>> get() async {
    final photoModels = await _local.getItems();
    return photoModels.map((e) => PhotoConverter.toPhoto(e)).toList();
  }

  @override
  Stream<List<Photo>> watch() {
    return _local.watch().transform(PhotoConverter.streamTransformer);
  }
}
