part of 'history_bloc.dart';

@immutable
sealed class HistoryEvent {}

final class PressSelect extends HistoryEvent {}

final class PressCancelSelect extends HistoryEvent {}

final class PressSelectAll extends HistoryEvent {}

final class PressDeselectAll extends HistoryEvent {}

final class GetHistoryPhotos extends HistoryEvent {
  final List<Photo> photos;

  GetHistoryPhotos({required this.photos});
}

final class PressSelectItem extends HistoryEvent {
  final String id;

  PressSelectItem({required this.id});
}

final class PressDeletes extends HistoryEvent {}

final class PressDeleteOne extends HistoryEvent {
  final String id;
  PressDeleteOne({required this.id});
}

// final class LongPressHistoryItem extends HistoryEvent {
//   final String id;
//   LongPressHistoryItem({required this.id});
// }
