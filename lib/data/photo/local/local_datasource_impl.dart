import 'dart:async';
import 'package:erasica/data/photo/local/photo_model.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';
import '../../local_repository.dart';

@LazySingleton(as: LocalDataSource<PhotoModel>)
class PhotoLocalDatasourceImpl implements LocalDataSource<PhotoModel> {
  PhotoLocalDatasourceImpl({
    required this.db,
    @Named('photosTable') required this.table,
  });

  final Database db;
  final String table;

  final _controller = StreamController<List<PhotoModel>>.broadcast();

  @override
  Future<PhotoModel> create(PhotoModel model) async {
    final conflict = ConflictAlgorithm.replace;
    await db.insert(table, model.toMap(), conflictAlgorithm: conflict);
    await _emitCurrent();
    return model;
  }

  @override
  Future<void> deleteItem(String id) async {
    await db.delete(table, where: 'id = ?', whereArgs: [id]);
    await _emitCurrent();
  }

  @override
  Future<List<PhotoModel>> getItems() async {
    final rows = await db.query(table);
    return rows.map(PhotoModel.fromMap).toList();
  }

  @override
  Stream<List<PhotoModel>> watch() {
    _emitCurrent();
    return _controller.stream;
  }

  Future<void> _emitCurrent() async {
    final list = await getItems();
    if (!_controller.isClosed) _controller.add(list);
  }

  Future<void> dispose() async {
    await _controller.close();
  }

  @override
  Future<void> deleteItems(List<String> itemsId) async {
    await db.delete(
      table,
      where: 'id IN (${List.filled(itemsId.length, '?').join(',')})',
      whereArgs: itemsId,
    );
    await _emitCurrent();
  }
}
