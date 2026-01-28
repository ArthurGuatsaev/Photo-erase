import 'dart:async';

abstract class LocalDataSource<T> {
  Future<List<T>> getItems();
  Future<T> create(T model);
  Future<void> deleteItem(String id);
  Future<void> deleteItems(List<String> itemsId);
  Stream<List<T>> watch();
}
