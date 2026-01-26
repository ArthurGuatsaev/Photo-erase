import 'dart:async';

abstract class LocalDataSource<T> {
  Future<List<T>> getItems();
  Future<T> create(T model);
  Future<void> deleteItem(String id);
  Stream<List<T>> watch();
}
