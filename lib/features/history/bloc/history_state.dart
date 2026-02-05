part of 'history_bloc.dart';

@immutable
sealed class HistoryState {
  final Set<Photo> selected;
  const HistoryState({required this.selected});
}

final class HistoryInitial extends HistoryState {
  const HistoryInitial({super.selected = const {}});
}

final class HistorySelecting extends HistoryState {
  const HistorySelecting({super.selected = const {}});
}

final class HistorySelectAll extends HistoryState {
  const HistorySelectAll({super.selected = const {}});
}
