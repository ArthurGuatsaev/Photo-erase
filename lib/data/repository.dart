import 'dart:async';

abstract class Repository<T> {
  Future<List<T>> get();
  Future<T> create(T item);
  Future<void> deleteItem(String id);
  Future<void> deleteItems(List<String> itemsId);
  Stream<List<T>> watch();
}
