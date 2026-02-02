import 'package:bloc/bloc.dart';
import 'package:erasica/core/const/system_untils.dart';
import 'package:meta/meta.dart';
import '../../../entities/photo/photo.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc() : super(HistoryInitial()) {
    on<PressSelect>(onPressSelect);
    on<PressSelectItem>(onPressItem);
    on<PressSelectAll>(onPressSelectAll);
    on<PressDeselectAll>(onPressDeselectAll);
    on<PressCancelSelect>(onPressCancelSelect);
  }

  onPressSelect(PressSelect event, Emitter<HistoryState> emit) {
    emit(HistorySelecting());
  }

  onPressSelectAll(PressSelectAll event, Emitter<HistoryState> emit) {
    emit(HistorySelectAll(selected: event.ids));
  }

  onPressDeselectAll(PressDeselectAll event, Emitter<HistoryState> emit) {
    emit(HistorySelecting(selected: <String>{}));
  }

  onPressCancelSelect(PressCancelSelect event, Emitter<HistoryState> emit) {
    emit(HistoryInitial());
  }

  onPressItem(PressSelectItem event, Emitter<HistoryState> emit) {
    if (state is HistorySelecting || state is HistorySelectAll) {
      final selected = {...state.selected}..selection(event.id);
      emit(HistorySelecting(selected: selected));
    }
  }
}
