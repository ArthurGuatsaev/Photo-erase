part of 'history_bloc.dart';

@immutable
sealed class HistoryEvent {}

final class PressSelect extends HistoryEvent {}

final class PressCancelSelect extends HistoryEvent {}

final class PressSelectAll extends HistoryEvent {
  final Set<String> ids;
  PressSelectAll({required List<Photo> photos})
    : ids = photos.map((e) => e.id).toSet();
}

final class PressDeselectAll extends HistoryEvent {}

final class PressSelectItem extends HistoryEvent {
  final String id;
  PressSelectItem({required this.id});
}

// final class LongPressHistoryItem extends HistoryEvent {
//   final String id;
//   LongPressHistoryItem({required this.id});
// }
