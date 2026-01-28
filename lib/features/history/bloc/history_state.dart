part of 'history_bloc.dart';

@immutable
sealed class HistoryState {
  final List<Photo> photos;
  const HistoryState({required this.photos});
}

final class HistoryInitial extends HistoryState {
  const HistoryInitial({required super.photos});
}

final class HistorySelecting extends HistoryState {
  final Set<String> selected;
  const HistorySelecting({this.selected = const {}, required super.photos});
}

final class HistorySelectAll extends HistoryState {
  const HistorySelectAll({required super.photos});
}
