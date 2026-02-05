part of 'history_bloc.dart';

@immutable
sealed class HistoryEvent {}

final class PressSelect extends HistoryEvent {}

final class PressCancelSelect extends HistoryEvent {}

final class PressSelectAll extends HistoryEvent {
  final Set<Photo> photos;
  PressSelectAll({required List<Photo> items}) : photos = items.toSet();
}

final class PressDeselectAll extends HistoryEvent {}

final class PressSelectItem extends HistoryEvent {
  final Photo photo;
  PressSelectItem({required this.photo});
}

// final class LongPressHistoryItem extends HistoryEvent {
//   final String id;
//   LongPressHistoryItem({required this.id});
// }
